# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..8).each do |chapter|
  ((chapter-1)*10+1..(chapter-1)*10+10).each do |pattern|
    pattern_name = "pt"+format("%03d",pattern)
    pt = Pattern.create(name: pattern_name)

  end
end

total =50
query = []

(1..total).each do |file_num|
  file_dir = "./db/problems/"+'p'+format('%04d', file_num)+'.txt'
  puts file_dir
  File.open(file_dir,"r").each_line do |line|
    query<< line
  end
  name = query[0].strip
  patterns = query[1].strip.split(',')
  difficulty = query[2].strip
  answer = query[3].strip
  subject_name = query[4].strip
  chapter_name = query[5].strip
  problem_html = query[6]
  solution_html = query[7]
  query =[]
  pb = Problem.create(name: name, answer: answer, subject_name: subject_name, chapter_name: chapter_name, problem_html: problem_html, solution_html:solution_html, difficulty:difficulty)
  puts pb.name
  patterns.each do |pattern|
    pt = Pattern.find_by(name:pattern)
    pt.problems << [pb]

  end



end



user = User.create(username: "umaiuma", password:"air", password_confirmation:"air")
user.generate_exam("exam1")
