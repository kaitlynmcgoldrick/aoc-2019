def calc(i)
  (i/3) - 2
end


def calc_recursion(i)
  sum = 0 
  while i >= 6
    i = calc(i)
    sum += i
  end
  return sum 
end

# puts calc_recursion(1969)
# puts calc_recursion(100756)
# puts calc_recursion(14)



sum = 0
File.readlines('day1/input.txt').each do |mass|
  sum += calc_recursion(mass.to_i)
end
puts sum