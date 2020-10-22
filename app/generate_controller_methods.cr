directory = Dir.new("#{Dir.current}/src/pages").children
output = ""

directory.each { |f| output += "def #{f.split(".")[0]}; render \"layouts/application.ecr\"; end\n\n" }
puts output
