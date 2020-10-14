def permie(ans, str)
  
  if ans == ""
    temp_array = []
  end

  if str.length == 1
     return ans + str[0].to_s
  elsif str.length > 1
    str.each_with_index do |ch, idx|
      temp_str = str
      new_letter = temp_str.delete_at(idx).to_s
      ans += new_letter
      puts "|| ch is: ", ch, "|| index is: ", idx, "|| new letter is: ", new_letter, "|| answer is: ", ans,"|| temp_str is: ", temp_str, "\n"
      if temp_str.length == str.length - 1
        temp_array.insert(permie(ans, temp_str))
      else
        permie(ans, temp_str)
      end
    end 
  else
    return temp_array
  end
end


puts "Enter your string: "
str = gets.chomp.split("")
puts "Your string is #{str}"
puts "Your permutations are: #{permie("", str)} "
