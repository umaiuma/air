# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

total =12
query = []

(0..total).each do |file_num|
  file_dir = "./db/problems/"+'p'+format('%04d', file_num)+'.txt'
  puts file_dir

  File.open(file_dir,"r").each_line do |line|
    query<< line.sub("\xEF\xBB\xBF", "").gsub("\r", "")
  end
  name = query[0].strip
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
  if(!dic_subject=DicSubject.find_by(name:subject_name))
    dic_subject=DicSubject.create(name:subject_name)
  end
  puts dic_subject.name

  if(!dic_chapter = DicChapter.find_by(name:chapter_name))
    dic_chapter=DicChapter.create(name:chapter_name, dic_subject: dic_subject)
  end

  puts dic_chapter.name

  patterns.each do |pattern|
    if(!pt = Pattern.find_by(name:pattern))
      pt =Pattern.create(name:pattern)
    end
    puts pt.name
    if(!dic_group = DicGroup.find_by(name:pattern, dic_chapter: dic_chapter))
      dic_group =DicGroup.create(name:pattern, dic_chapter:dic_chapter)
    end
    puts dic_group.name

    pt.problems << [pb]

  end



end



user = User.create(username: "umaiuma", password:"air", password_confirmation:"air")
user.generate_exam

