def without_ext(file : String)
  file.split(".")[0]
end

directory = Dir.new("#{Dir.current}/src/pages").children
output = ""

directory.each do |f|
  output += if without_ext(f) == "index"
              "get \"/\", ReactController, :index\n"
            else
              "get \"/#{without_ext(f)}\", ReactController, :#{without_ext(f)}\n"
            end
end
puts output
