# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u01= User.create(username:"umaiuma", userpw:"name")
e01= Exam.new(name: "시험1 ", user: u01)
e01.save

s01 = Subject.new( name: "일반물리학", check: 0, exam: e01)
s01.save

c01 = Chapter.new( name: "전기장과전위", check: 0, subject: s01 )
c01.save

c02 = Chapter.new( name: "전기용량과유전체", check: 0, subject: s01)
c02.save

c03 = Chapter.new( name: "회로", check: 0, subject: s01)
c03.save

c04 = Chapter.new( name: "자기장", check: 0, subject: s01)
c04.save

pt01 = Pattern.new(name: "전기력", chapter: c01)
pt01.save
pt02 = Pattern.new(name: "가우스", chapter: c01)
pt02.save
pt03 = Pattern.new(name: "W&U", chapter: c01)
pt03.save
pt04 = Pattern.new(name: "평면E", chapter: c01)
pt04.save


p0101 = Problem.create(name: "01.01", difficulty: 1, problem_html:"밀리컨의 기름 방울 실험에서는 먼저 고른 전기장  를 가하여 반지름  , 질량  인 방울을 움직이지 않도록 한 다음, 전기장을 없애고 방울이 공기 중 중에서 종단속도  로 떨어지도록 한다. 유체의 마찰은 스토크스 법칙  을 따른다고 한다.  는 점성이다. 기름과 공기의 밀도를 각각  ,  라고 하고, 중력 가속도를  라고 할 때 방울의 전하량을 구하라")
p0102 = Problem.create(name: "01.02", difficulty: 1, problem_html:"반지름  인 구형의 풍선이 있다. 이제 풍선의 표면에 면 전하밀도  로 고르게 전하르 대전시킨다고 하자.
(a) 대전시키기 전에 비해 풍선이 커지겠는가? 아니면 작아지겠는가?
(b) 대전시킨 전하가 풍선에 미치는 압력을 구하라.")
p0103 = Problem.create(name: "01.03", difficulty: 1, problem_html:"전기적으로 절연된 판 위로 반지름  , 질량  인 두 개의 쇠공이 각각 전하량  와  (단,  )로 대전되어 연직 거리  만큼 떨어져서 평형 상태를 이루고 있다. 이 평형 상태는 불안정한 평형상태이나 쇠공은 수직 방향으로만 운동이 가능하다고 생각하고, 쇠공에 대전된 전하들의 편극 현상도 없어서 항상 쇠공 표면에 균일하게 분포한다고 가정한다.

(a)위의 쇠공에 수직으로 힘을 가하여 아래공과 접촉시키기 위한 최소 일을 구하라.
(b) 이 공들을 접촉시킨 뒤 떼어내서 다시 평형이 되도록 한다고 할 때, 새로 평형을 이루는 높이는  보다 멀어질 것인가, 가까워질 것인가, 아니면 변화하지 않을 것이가? 또 그렇게 생각하는 이유를 설명하라")
p0104 = Problem.create(name: "01.04", difficulty: 1, problem_html: "반지름이  인 빈 구껍질에 전하  를 고루 저장시킨다고 할 때 필요한 일의 양을 구하라.")
p0105 = Problem.create(name: "01.05", difficulty: 1, problem_html: "두께  의 평면판이 균일한 부피 전하 밀도  를 갖고 있다. 평면판의 중심면으로부터 평면에 수직한 방향으로의 거리를  라 할 때 전기장을  의 함수로 구하라.")

# 전기력 /가우스, 전기력/ 전기력, W&U / 전기력, W&U /평면E

pt01.problems << [p0101, p0102, p0103, p0104]
pt02.problems << [p0102]
pt03.problems << [p0103, p0104]
pt04.problems << [p0105]

