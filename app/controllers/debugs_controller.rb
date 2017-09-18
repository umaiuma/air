class DebugsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end
  def update

    user_js= params.to_unsafe_h
    @user = User.find_by(username: user_js[:user_info][:name])
    puts @user.username

    test_js = user_js[:user_info][:tests][format("%d",params[:update_test_id])]
    test = @user.exams.find(test_js[:id])
    test.name = test_js[:name]
    puts test.name
    subjects_length = test_js[:subjects].length
    (0..subjects_length-1).each do |subject_i|
      subject_js = test_js[:subjects][format("%d",subject_i)]
      subject = test.subjects.find_by(name: subject_js[:name])
      subject.onExam = subject_js[:onExam]
      subject.onStudy = subject_js[:onStudy]
      puts subject.name
      chapters_length = subject_js[:chapters].length
      (0..chapters_length-1).each do |chapter_i|
        chapter_js = subject_js[:chapters][format("%d",chapter_i)]
        chapter = subject.chapters.find_by(name: chapter_js[:name])
        chapter.onExam = chapter_js[:onExam]
        chapter.onStudy = chapter_js[:onStudy]
        puts chapter.name
        chapter.save
      end
      subject.save
    end
    test.save
    @user.save



  end
  def generate
    user_js= params.to_unsafe_h
    @user = User.find_by(username: user_js[:user_info][:name])
    puts @user.username
    @user.generate_exam

  end
  def destroy
    user_js= params.to_unsafe_h
    @user = User.find_by(username: user_js[:user_info][:name])
    puts @user.username
    test_js = user_js[:user_info][:tests][format("%d",params[:destroy_test_id])]
    destroy_test= @user.exams.find(test_js[:id])
    puts destroy_test.name
    destroy_test.destroy
    @user.save

  end
  def view_post

  end
  def status
    @user = User.find(session[:user_id])


  end
  def solution
    @problems = Problem.all
  end


end
