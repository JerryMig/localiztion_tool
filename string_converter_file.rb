require 'fileutils'

puts ''
puts 'Starting to make dirs'

Dir['strings/*'].each do |file_name|

  # extract language string from file name
  lang = file_name.scan(/\(*[a-zA-Z]*\)/).first
  lang.gsub!(/\(/, "")
  lang.gsub!(/\)/, "")

  # make dir and name it after the language string
  FileUtils::mkdir_p "results/#{lang}"

  # make file and name it strings.xml
  command = `ruby string_converter.rb #{file_name.dump} results/#{lang}/strings.xml`
  puts command

end

puts 'all done, woohoo!'
puts ''
