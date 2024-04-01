# require 'questionnaire.rb'

def do_report
  # TODO: IMPLEMENT
  no_of_yes = @answers.select { |ans| ['Yes', 'Y'].include?(ans)}.count
  @answers = []
  rating = 100*no_of_yes/5;
  @ratings << rating
  rating
end

def do_total_run_avg(total_runs)
  @ratings.sum/total_runs
end


describe "Questionnaire" do
	context " return accurante rating for questionnaire" do
		before(:each) do
			@ratings = []
		end

		it " should return correct rating with case incestivity" do
			@answers = ['Yes','Y','N','No','No']
			expect(do_report).to eq(40)

			@answers = ['Yes','Yes','Yes','No','No']
			expect(do_report).to eq(60)
		end

		it " should return correct average rating for all runs " do
			@answers = ['Yes','Y','N','No','No']
			expect(do_report).to eq(40)

			@answers = ['Yes','Yes','Yes','No','No']
			expect(do_report).to eq(60)

			@answers = ['Yes','Y','Yes','N','Y']
			expect(do_report).to eq(80)

			expect(do_total_run_avg(3)).to eq(60)
		end
	end
end