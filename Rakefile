require 'minisculus/quiz_master'
require 'minisculus/questions'

QUIZ_MASTER = Minisculus::QuizMaster.connect

def answer_question(question)
  answer = question.answer
  puts "Answering question with '#{answer}'..." unless ENV['QUIET']
  if next_question = QUIZ_MASTER.answer(question.id, answer)
    if ENV['QUIET']
      print "."
    else
      puts "Next question: #{next_question} (#{next_question.reference})"
      system("open #{next_question.reference_url}")
    end
  else
    if ENV['QUIET']
      print "F"
    else
      puts "Incorrect answer!"
    end
  end
end

namespace :quiz do
  task :start do
    first_question = QUIZ_MASTER.start
    puts "First question: #{first_question}."
    system("open #{first_question.reference_url}") 
  end
  
  namespace :answer do
    task :one do
      answer_question(Minisculus::Questions::One)
    end
    
    task :two do
      answer_question(Minisculus::Questions::Two)
    end
    
    task :three do
      answer_question(Minisculus::Questions::Three)
    end
    
    task :four do
      answer_question(Minisculus::Questions::Four)
    end
    
    task :all do
      ENV['QUIET'] = 'true'
      Rake::Task['quiz:answer:one'].execute
      Rake::Task['quiz:answer:two'].execute
      Rake::Task['quiz:answer:three'].execute
      Rake::Task['quiz:answer:four'].execute
      puts "\nFinished."
    end
  end
end

require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end

task :default => :spec
