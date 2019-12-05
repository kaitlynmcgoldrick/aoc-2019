require 'csv'

arr = CSV.read('day2/input.csv')[0]

arr.map!{|e| e.to_i}

a = [1,0,0,0,99]
b = [2,3,0,3,99]
c = [2,4,4,5,99,0]
d = [1,1,1,4,99,5,6,0,99]
def compute(array)
  array.each_slice(4).with_index do |slice, index|
    opcode = slice[0]
    input_1 = slice[1]
    input_2 = slice[2]
    output = slice[3]
    if opcode == 1
      array[output] = array[input_1] + array[input_2]
    elsif opcode == 2
      array[output] = array[input_1] * array[input_2]
    elsif opcode == 99
      return array
    else
      puts 'Error!'
      return 
    end
  end
end 

new_array = compute(arr)
puts new_array[0]