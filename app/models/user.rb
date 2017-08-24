class User < ApplicationRecord
  has_many :exams
  validates :username, presence:true, uniqueness: true
  validates :password, presence:true
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :meters
  has_many :history_problems

  def generate_exam()

    new_exam = Exam.new(user: self, name: 'new exam')

    self.exams << new_exam
    (1..3).each do |i|
      s = Subject.new(name: 's'+format("%d",i), exam: new_exam, onStudy: 0, onExam:1)
      (1..8).each do |j|
        c = Chapter.new(name: 's'+format("%d",i)+'c'+format("%d",j), subject:s, onStudy: 0, onExam: 0)
        c.save
      end
      s.save
    end




    new_exam.save

    self.save
  end



 end
