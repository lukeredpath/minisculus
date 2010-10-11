require 'restclient'
require 'json'

module Minisculus
  class QuizMaster < RestClient::Resource
    def self.connect
      new('http://minisculus.edendevelopment.co.uk/')
    end
    
    def start
      self['start'].get(headers) do |response, request, result|
        case response.code
        when 303
          return Question.from_response(self, self[response.headers[:location]].get)
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
    
    def headers(other_headers = {})
      other_headers.merge("Accept" => "application/json")
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
    
    def to_s
      @question
    end
  end
end
