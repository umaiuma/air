query = []

File.open("p0021.txt","r").each_line do |line|
  query<< line
end

name = query[0].delete('\n')
patterns = query[1].delete('\n').split(',')
difficulty = query[2].delete('\n')
answer = query[3].delete('\n')
subject_name = query[4].delete('\n')
chapter_name = query[5].delete('\n')
problem_html = query[6]
solution_html = query[7]

puts 'name: ' +name
puts 'patterns: '
puts patterns
puts 'difficulty: '+difficulty
puts "answer: " +answer
puts "subject_name: "+subject_name
puts "chapter_name: "+chapter_name

