# frozen_string_literal: true

require 'csv'

arr = CSV.read('day5/input.csv')[0]

arr.map!(&:to_i)

# a = [1,0,0,0,99]
# b = [2,3,0,3,99]
# c = [2,4,4,5,99,0]
# d = [1,1,1,4,99,5,6,0,99]

# a = [3,0,4,0,99]

def get_opcode_and_params(code)
  param_modes = Array.new(3, 0)
  instruc_digits = code.digits
  if instruc_digits.length > 2
    opcode = instruc_digits[0]
    # contains parameters modes
    instruc_digits[2..-1].each_with_index do |val, i|
      param_modes[i] = val
    end
  else
    opcode = code
  end

  [opcode, param_modes]
end

p get_opcode_and_params(1002) # [2, [0, 1, 0]]
# p get_opcode_and_params(4) # [4, [0, 0, 0]]

def get_position_or_immediate(i, num, array, param_mode)
  input = if param_mode == 1
            array[i + num]
          else
            array[array[i + num]]
          end
  input
end

def compute(array)
  i = 0
  while i < array.length
    opcode, param_modes = get_opcode_and_params(array[i])
    if opcode == 1
      input_1 = get_position_or_immediate(i, 1, array, param_modes[0])
      input_2 = get_position_or_immediate(i, 2, array, param_modes[1])
      output = array[i + 3]
      array[output] = input_1 + input_2
      i += 4
    elsif opcode == 2
      input_1 = get_position_or_immediate(i, 1, array, param_modes[0])
      input_2 = get_position_or_immediate(i, 2, array, param_modes[1])
      output = array[i + 3]
      array[output] = input_1 * input_2
      i += 4
    elsif opcode == 3
      puts 'Please input a value:'
      input = gets.chomp
      pos = array[i + 1]
      array[pos] = input.to_i
      i += 2
      next
    elsif opcode == 4
      pos = array[i + 1]
      puts 'OPCODE 4 response: ', array[pos]
      i += 2
      next
    elsif opcode == 99
      return array
    else
      puts 'Error!'
      return
    end
  end
end

new_array = compute(arr)
p new_array
