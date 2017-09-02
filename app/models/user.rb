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
    (1..2).each do |i|
      s = Subject.new(name: 's'+format("%02d",i), exam: new_exam, onStudy: 0, onExam:0)
      (1..4).each do |j|
        chapter_name = 's'+format("%02d",i)+'c'+format("%02d",j)

        c = Chapter.new(name: chapter_name, subject:s, onStudy: 0, onExam: 0, level: 0)
        (1..10).each do |k|
          pattern_name = chapter_name + 'pt'+format("%02d",k)
          pt = Group.new(name:pattern_name, chapter: c, level: 0)
          puts pt.name
          pt.save

        end
          c.save

      end
      s.save
    end




    new_exam.save

    self.save
  end



 end
