require 'minisculus/quiz_master'
require 'minisculus/questions'

QUIZ_MASTER = Minisculus::QuizMaster.connect

def answer_question(reference, &block)
  answer = block.call
  puts "Answering question with '#{answer}'..."
  if next_question = QUIZ_MASTER.answer(reference, answer)
    puts "Next question: #{next_question} (#{next_question.reference})"
    system("open #{next_question.reference_url}")
  else
    puts "Incorrect answer!"
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
      answer_question("14f7ca5f6ff1a5afb9032aa5e533ad95") { Minisculus::QuestionOne.answer! }
    end
    
    task :two do
      answer_question("2077f244def8a70e5ea758bd8352fcd8") { Minisculus::QuestionTwo.answer! }
    end
    
    task :three do
      answer_question("36d80eb0c50b49a509b49f2424e8c805") { Minisculus::QuestionThree.answer! }
    end
    
    task :four do
      answer_question("4baecf8ca3f98dc13eeecbac263cd3ed") { Minisculus::QuestionFour.answer! }
    end
  end
end

require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end

task :default => :spec
