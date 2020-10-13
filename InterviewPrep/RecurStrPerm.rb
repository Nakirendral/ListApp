def permie(ans, str)
  tempStr = str.split("")
  tempStr.delete_at(tempStr.length)
  puts ans
  puts tempStr
  
  tempArray = []
  
  if tempStr.length == 1
    return ans + tempStr[0].to_s
  else
    for i in 0..tempStr.length-1
      temperStr = tempStr
      puts i
      puts tempArray
      tempArray << permie(ans + temperStr.delete_at(i).to_s, temperStr.join)
    end 
  end

  return tempArray
end


puts "Enter your string: "
str = gets.chomp
puts "Your string is #{str}"
puts "Your permutations are: #{permie("", str)} "
