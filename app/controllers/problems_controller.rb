class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
  end

  def recommend
    @exam = @user.exams.find(session[:exam_id])


    @problems =[]
    @groups = []

    @exam.subjects.each do |subject|
      subject.chapters.each do |chapter|
        if chapter.onStudy
          @problems += Problem.all.where( chapter_name: chapter.name )
          @groups +=chapter.groups
        end
      end
    end


    score_minimum= @groups[0].level
    recommend_group =@groups[0]
    @groups.each do |group|
      if score_minimum > group.level
        score_minimum = group.level
        recommend_group = group
      end
    end

    if score_minimum<-2
      recommend_diff = 1
    elsif score_minimum < 2
      recommend_diff =2
    else
      recommend_diff =3
    end

    recommend_pattern =Pattern.find_by(name: recommend_group.name)
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
      puts @recommend_problem.name
      redirect_to problem_path(@recommend_problem)
    end
  end

  def set
    puts "hi"
    @user = User.find( session[:user_id] )
    session[:exam_id] = params[:selected_test_id]


    self.recommend

  end

  def show
    @problem = Problem.find(params[:id])
    @patterns = @problem.patterns


  end


  def mark

    @user = User.find(session[:user_id])
    @exam = @user.exams.find(session[:exam_id])


    @groups = []

    @exam.subjects.each do |subject|
      subject.chapters.each do |chapter|
        if chapter.onStudy
          @groups +=chapter.groups
        end
      end
    end


    @exam.subjects.each do |subject|
      subject.chapters.each do |chapter|
        if chapter.onStudy
          @groups +=chapter.groups
        end
      end
    end


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

      @groups.each do |group|
        if group.name == pattern.name
          group.level = meter.score
          group.save
        end
      end

    end

    self.recommend




  end
end
