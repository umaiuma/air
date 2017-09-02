class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def recommend
    score_minimum= @user.meters.minimum("score")
    recommend_meter= @user.meters.find_by(score: score_minimum)
    if score_minimum<-2
      recommend_diff = 1
    elsif score_minimum < 2
      recommend_diff =2
    else
      recommend_diff =3
    end
    recommend_pattern =Pattern.find_by(name: recommend_meter.pattern_name)
    recommend_problems = recommend_pattern.problems.where(difficulty: recommend_diff)
    recommend_problems.each do |pb|
      if ! @user.history_problems.find_by(problem_id:pb.id)
        @recommend_problem = pb
        break
      end

    end

    if !@recommend_problem
      recommend_pattern.problems.each do |pb|
        if ! @user.history_problems.find_by(problem_id:pb.id)
          @recommend_problem = pb
          break
        end
      end
    end

    if @recommend_problem
      #redirect_to problem_path(@recommend_problem)
    end
  end

  def set
    @user = User.find( session[:user_id] )

    user_js= params.to_unsafe_h

    test_js = user_js[:user_info][:tests][format("%d",params[:selected_test_id])]
    exam = @user.exams.find(test_js[:id])
    exam.subjects.each |subject| do

  end

  end

  def show
    @problem = Problem.find(params[:id])
    @patterns = @problem.patterns


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

    if last_problem = @user.history_problems.find_by(problem_id: @problem.id)
    else
      last_problem = HistoryProblem.new(user: @user, problem_id: @problem.id, correct: false)
    end

    if diff>0
      last_problem.correct = true
    else
      last_problem.correct = false
    end

    last_problem.save
    last_problem.user.save


    @problem.patterns.each do |pattern|
      if meter = @user.meters.find_by(pattern_name:pattern.name)
      else
        meter = Meter.new(score: 0, combo:1, sign:0, pattern_name: pattern.name, user: @user)
        meter.save
        @user.save
      end
      meter.set_score(diff)
      subject =  @user.subjects.find_by(name: @problem.subject_name)
      chapter = subject.chapters.find_by(name: @problem.chapter_name)
      group = chapter.groups.find_by(name: pattern.name)
      group.level = meter.score
      group.save
    end









  end
end
