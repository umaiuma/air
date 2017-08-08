class User < ApplicationRecord
  has_many :exams
  validates :username, presence:true, uniqueness: true
  validates :userpw, presence:true, uniqueness: true
  attr_accessor :a
  @a=3

  def generate_exam(name)

    new_exam = Exam.new(user: self, name: name)

    self.exams << new_exam
    s01 = Subject.new( name: "일반물리학", check: 0, exam: new_exam)
    s01.save

    c01 = Chapter.new( name: "전기장과전위", check: 0, subject: s01 )
    c01.save

    c02 = Chapter.new( name: "전기용량과유전체", check: 0, subject: s01)
    c02.save

    c03 = Chapter.new( name: "회로", check: 0, subject: s01)
    c03.save

    c04 = Chapter.new( name: "자기장", check: 0, subject: s01)
    c04.save


    new_exam.save

    self.save
  end



 end
