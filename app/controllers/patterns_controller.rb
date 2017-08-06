class PatternsController < ApplicationController
  def index
    @patterns = Pattern.all
  end
  def show
    @pattern = Pattern.find(params[:id])
    @problems = @pattern.problems
  end
end
