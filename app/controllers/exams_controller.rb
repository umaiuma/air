class ExamsController < ApplicationController
  def index
    @exams = Exam.all

  end

  def show
    @exam = Exam.find(params[:id])
    @problems = []
    @exam.subjects.each do |s|
      if s.check
        @problems += Problem.where(subject_name: s.name)
      else
        s.chapters.each do |c|
          if c.check
            @problems += Problem.where(subject_name: s.name, chapter_name: c.name )
          end
        end
      end

    end
  end
end
