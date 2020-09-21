def print_array(array)
  line = ''
  array.each.with_index do |element, index|
    line += " #{element}"
    if index % 4 == 3
      puts line
      line.clear
    end
  end
  puts line unless line.empty?
end

def print_array2(array)
  array.each_slice(4) { |slice| p slice }
end



print_array([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35])
print_array2([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35])
