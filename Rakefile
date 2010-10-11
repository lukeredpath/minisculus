require 'minisculus/quiz_master'

QUIZ_MASTER = Minisculus::QuizMaster.connect

namespace :quiz do
  task :start do
    first_question = QUIZ_MASTER.start
    puts "Question #1: #{first_question}."
    system("open #{first_question.reference_url}")
  end
end
