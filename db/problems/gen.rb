
problem_id = 0
def file_gen id, subject_num, chapter_num, difficulty, patterns
  name = 'p'+format('%04d', id)
  subject_name= 's'+format('%02d', subject_num)
  chapter_name= 's'+format('%02d', subject_num)+'c'+format('%02d', chapter_num)
  answer = 'T'
  problem_html = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac eros felis. Fusce non lectus a dui ornare vestibulum. Mauris ultricies diam quis massa congue tincidunt. Aliquam nec egestas elit, scelerisque blandit ligula. Aenean in nulla non nisl cursus facilisis. In ac magna felis. Nulla ac risus vitae libero auctor fringilla vitae in mi. Ut dictum, velit nec venenatis mollis, lectus ipsum tristique nunc, id auctor eros est vel ipsum. Vestibulum efficitur orci id tincidunt dignissim. Vivamus id quam fermentum, feugiat enim id, aliquet leo. Aenean iaculis ultrices auctor. Praesent diam lacus, luctus ac consequat vitae, consectetur commodo nisi. Donec congue quam vel sem egestas, vitae laoreet arcu condimentum."
  solution_html = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel eleifend nisl, in fringilla mi. Fusce vehicula, velit sit amet scelerisque malesuada, ante urna mattis tortor, ac tempor ante nisi scelerisque dui. Sed dapibus ligula id est pretium, scelerisque consequat mi fringilla. Nullam est mauris, condimentum a dapibus ultricies, ultricies vitae erat. Fusce tincidunt ultrices tempor. Ut ipsum ipsum, vestibulum eu dolor at, maximus bibendum sapien. Morbi egestas velit sit amet eros dapibus, ut consectetur tortor sodales. Praesent efficitur eget libero a posuere. "
  File.open(name+'.txt', 'w') do |f|
    f.puts name
    patterns.each do |pattern|
      f.print chapter_name
      f.print 'pt'
      f.print format("%02d",pattern)
      if pattern != patterns[-1]
        f.print','
      else
        f.puts ''
      end
    end

    f.puts difficulty
    f.puts answer
    f.puts subject_name
    f.puts chapter_name
    f.puts problem_html
    f.puts solution_html

  end
end
subject=1
(1..8).each do |chapter|
  (1..10).each do |pattern|
    #single pattern
    patterns = [pattern]
    (1..7).each do
      file_gen(problem_id, subject, chapter,  1, patterns)
      problem_id+=1
    end
    (1..2).each do
      file_gen(problem_id, subject, chapter,  2, patterns)
      problem_id+=1
    end
    (1..1).each do
      file_gen(problem_id, subject, chapter,  3, patterns)
      problem_id+=1
    end

    #double pattern
    (pattern+1..10).each do |pattern_second|
      patterns =[pattern, pattern_second]
      (1..4).each do
        file_gen(problem_id, subject, chapter,  2, patterns)
        problem_id+=1
      end
      (1..2).each do
        file_gen(problem_id, subject, chapter,  3, patterns)
        problem_id+=1
      end

      #triple pattern
      (pattern_second+1..10).each do |pattern_third|
        patterns=[pattern,pattern_second,pattern_third]
        (1..3).each do
          file_gen(problem_id, subject, chapter,  3, patterns)
          problem_id+=1
        end
      end


    end




  end
end