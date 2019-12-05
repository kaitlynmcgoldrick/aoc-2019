# 108457-562041

a = 108457
b = 562041

# a = 222222
# b = 222232

# # testing
# a = b = 112233
# a = b = 123444
# a = b = 112234

sum = 0
for i in a..b
  good = true
  dup_hash = {}
  a = i.to_s.split('')
  for j in 0..4 do
    if a[j+1].to_i < a[j].to_i
      good = false
      break
    end
    if a[j+1].to_i == a[j].to_i
      if !dup_hash.key?(a[j].to_i)
        dup_hash[a[j].to_i] = 2
      else
        dup_hash[a[j].to_i] += 1
      end
    end
  end

  if good == true && dup_hash.has_value?(2)
    # puts i
    sum += 1
  end
end

puts sum