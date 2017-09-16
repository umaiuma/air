class User < ApplicationRecord
  has_many :exams
  validates :username, presence:true, uniqueness: true
  validates :password, presence:true
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :meters
  has_many :history_problems
  has_one :last_exam


  def set_last_exam(id)
    self.last_exam=id
    self.save

  end

  def generate_exam()


    new_exam = Exam.new(user: self, name: '새로운 시험')

    self.exams << new_exam
    dic_subjects=DicSubject.all
    dic_subjects.each do |dic_subject|
      subject = Subject.create(name: dic_subject.name, exam: new_exam,onStudy: 0, onExam: 0)

      dic_subject.dic_chapters.each do |dic_chapter|
        chapter = Chapter.create(name:dic_chapter.name, subject: subject, onStudy:0, onExam:0, level:0)

        dic_chapter.dic_groups.each do |dic_group|
          group = Group.create(name:dic_group.name, chapter:chapter, level:0)

        end
      end
    end





    new_exam.save

    self.save
  end



 end
