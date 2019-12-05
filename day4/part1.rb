# 108457-562041

a = 108457
b = 562041

# a = 222222
# b = 222232

# # testing
# a = b = 123789

sum = 0
for i in a..b
  good = true
  duplicate_exists = false
  a = i.to_s.split('')
  for j in 0..4 do
    if a[j+1].to_i < a[j].to_i
      good = false
      break
    end
    if a[j+1].to_i == a[j].to_i
      duplicate_exists = true
    end
  end

  if good == true && duplicate_exists == true
    sum += 1
  end
end

puts sum