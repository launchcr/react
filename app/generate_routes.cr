def without_ext(file : String)
  file.split(".")[0]
end

directory = Dir.new("#{Dir.current}/src/pages").children
output = ""

directory.each do |f|
  output += if without_ext(f) == "index"
              "get \"/\", ApplicationController, :root\n"
            else
              output += "get \"/#{without_ext(f)}\", ApplicationController, :root\n"
            end
end
puts output
