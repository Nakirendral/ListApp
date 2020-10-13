def permie(ans, str)
  temp_str = str
  puts ans
  puts temp_str
  
  if ans == ""
    temp_array = []
    temp_array << temp_str.join
  end

  if temp_str.length == 1
    return ans + temp_str[0].to_s
  else
    temp_str.each_with_index do |ch, idx|
      temper_str = temp_str
      puts idx
      puts temp_array
      puts temper_str
      new_letter = temper_str.delete_at(idx)
      temp_array << permie(ans + new_letter, temper_str)
    end 
  end

  return temp_array
end


puts "Enter your string: "
str = gets.chomp.split("")
puts "Your string is #{str}"
puts "Your permutations are: #{permie("", str)} "
