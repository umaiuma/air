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
    s1 = Subject.new(name: '일반물리학' , exam: new_exam, onStudy:0, onExam:0)
    s1c1 = Chapter.new(name:'전기장과 전위', subject: s1, onStudy:0, onExam:0, level:0 )
    pt = Group.new(name:'힘', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'점', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'전기장', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'가우스', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'일', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'직선', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'평면', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'도체', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'구', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'진동', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'에너지밀도', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'에너지', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'각운동량', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'고리', chapter:s1c1, level:0)
    pt.save
    pt = Group.new(name:'도선', chapter:s1c1, level:0)
    pt.save
    s1c1.save
    s1.save

    s1c2= Chapter.new(name:'전기용량과 유전체', subject:s1 , onStudy:0, onExam: 0,level:0)
    s1c2.save

    s1c3= Chapter.new(name:'회로', subject:s1 , onStudy:0, onExam: 0, level:0)
    s1c3.save

    s1c4= Chapter.new(name:'자기장', subject:s1 , onStudy:0, onExam: 0, level:0)
    s1c4.save

    s1c5= Chapter.new(name:'전기역학', subject:s1 , onStudy:0, onExam: 0, level:0)
    s1c5.save



    # (2..2).each do |i|
    #   s = Subject.new(name: 's'+format("%02d",i), exam: new_exam, onStudy: 0, onExam:0)
    #   (1..4).each do |j|
    #     chapter_name = 's'+format("%02d",i)+'c'+format("%02d",j)
    #
    #     c = Chapter.new(name: chapter_name, subject:s, onStudy: 0, onExam: 0, level: 0)
    #     (1..10).each do |k|
    #       pattern_name = chapter_name + 'pt'+format("%02d",k)
    #       pt = Group.new(name:pattern_name, chapter: c, level: 0)
    #       puts pt.name
    #       pt.save
    #
    #     end
    #       c.save
    #
    #   end
    #   s.save
    # end




    new_exam.save

    self.save
  end



 end
