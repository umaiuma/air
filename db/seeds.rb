# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pt = Pattern.create(name:'힘')
pt = Pattern.create(name:'점')
pt = Pattern.create(name:'전기장')
pt = Pattern.create(name:'가우스')
pt = Pattern.create(name:'전위')
pt = Pattern.create(name:'일')
pt = Pattern.create(name:'직선')
pt = Pattern.create(name:'평면')
pt = Pattern.create(name:'도체')
pt = Pattern.create(name:'구')
pt = Pattern.create(name:'진동')
pt = Pattern.create(name:'에너지밀도')
pt = Pattern.create(name:'에너지')
pt = Pattern.create(name:'각운동량')
pt = Pattern.create(name:'고리')
pt = Pattern.create(name:'도선')

(1..8).each do |chapter|
  (1..10).each do |pattern|
    pattern_name ="s01"+"c"+format("%02d",chapter)+"pt"+format("%02d",pattern)
    pt = Pattern.create(name: pattern_name)

  end
end

total =6
query = []

(0..total).each do |file_num|
  file_dir = "./db/problems/"+'p'+format('%04d', file_num)+'.txt'
  puts file_dir
  File.open(file_dir,"r").each_line do |line|
    query<< line
  end
  name = query[10].strip
  patterns = query[1].strip.split(',')
  difficulty = query[2].strip
  answer = query[3].strip
  subject_name = query[4].strip
  chapter_name = query[5].strip
  problem_html = query[6]
  solution_html = query[7]
  prev_problem = query[8].strip
  next_problem = query[9].strip
  query =[]
  pb = Problem.create(name: name, answer: answer, subject_name: subject_name, chapter_name: chapter_name, problem_html: problem_html, solution_html:solution_html, difficulty:difficulty, prev_problem: prev_problem, next_problem: next_problem)
  puts pb.name
  patterns.each do |pattern|
    pt = Pattern.find_by(name:pattern)
    pt.problems << [pb]

  end



end



user = User.create(username: "umaiuma", password:"air", password_confirmation:"air")
user.generate_exam

