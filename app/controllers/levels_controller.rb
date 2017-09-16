class LevelsController < ApplicationController
  before_action :require_user

  def index
      @user = User.find(session[:user_id])
    @user.exams.each do |exam|
      exam.subjects.each do |subject|
        subject.chapters.each do |chapter|
          chapter.level = chapter.groups.average('level')
        end
      end
    end

  end
end
