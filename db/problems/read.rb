query = []
File.open("p0021.txt","r").each_line do |line|
  query << line

end
str = query[0].strip
str
