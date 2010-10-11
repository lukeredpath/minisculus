require 'restclient'
require 'json'
require 'uri'

module Minisculus
  class QuizMaster < RestClient::Resource
    def self.connect
      new('http://minisculus.edendevelopment.co.uk/')
    end
    
    def start
      self['start'].get(headers) do |response, request, result|
        case response.code
        when 303
          get_next_question_from_response(response)
        else
          raise UnexpectedResponse.new(response)
        end
      end
    end
    
    def answer(question_reference, answer)
      self[question_reference].put({:answer => answer}.to_json, headers) do |response, request, result|
        case response.code
        when 406
          false
        when 303
          get_next_question_from_response(response)
        else
          raise UnexpectedResponse.new(response)
        end
      end
    end
    
    class UnexpectedResponse < RuntimeError
      attr_reader :response
      
      def initialize(response)
        @response = response
      end
      
      def message
        "Unexpected response: #{response.inspect}"
      end
    end
    
    private
    
    def get_next_question_from_response(response)
      Question.from_response(self, self[response.headers[:location]].get)
    end
    
    def headers(other_headers = {})
      other_headers.merge(:accept => :json, :content_type => :json)
    end
  end
  
  class Question
    def initialize(resource, question)
      @resource = resource
      @question = question
    end
    
    def self.from_response(quiz_master, response)
      data = JSON.parse(response)
      new(quiz_master[data['reference-url']], data['question'])
    end
    
    def reference_url
      @resource.url
    end
    
    def reference
      File.basename(URI.parse(reference_url).path, '.html')
    end
    
    def to_s
      @question
    end
  end
end
