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
end
