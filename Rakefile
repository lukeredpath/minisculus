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
  end
end
