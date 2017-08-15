class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end
  def show
    @problem = Problem.find(params[:id])
    @patterns = @problem.patterns

  end
  def front

  end
  def mark
    @user = User.find(session[:user_id])
    diff = 0
    text = params[:mark][:user_answer]
    @problem =Problem.find(params[:id])
    if text != @problem.answer
      diff = -(4-@problem.difficulty)
    else
      diff = @problem.difficulty
    end
    @problem.patterns.each do |pattern|
      if meter = @user.meters.find_by(pattern_name:pattern.name)
      else
        meter = Meter.new(score: 0, combo:1, sign:0, pattern_name: pattern.name, user: @user)
        meter.save
        @user.save
      end
      meter.set_score(diff)
    end




  end
end
