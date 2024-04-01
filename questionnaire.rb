require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"
store = PStore.new(STORE_NAME)

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze

@answers = []

@ratings = []

# TODO: FULLY IMPLEMENT
def do_prompt
  # Ask each question and get an answer from the user's input.
  QUESTIONS.each_key do |question_key|
    print QUESTIONS[question_key]
    ans = gets.chomp
    @answers << ans
  end
end

def do_report
  # TODO: IMPLEMENT
  no_of_yes = @answers.select { |ans| ['Yes', 'Y'].include?(ans)}.count
  @answers = []
  rating = 100*no_of_yes/5;
  @ratings << rating
  rating
end

# Method to calculate average rating for all runs
def do_total_run_avg(total_runs)
  @ratings.sum/total_runs
end

puts "Please enter the input number of runs"
total_runs = gets.chomp.to_i

i = 1

while i <= total_runs
  do_prompt
  puts do_report
  i = i+1
end


puts "Average rating for all the runs : #{do_total_run_avg(total_runs)}"

