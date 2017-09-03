require 'byebug'

def my_min_slow(array)
  array.each do |el1|
    return el1 if array.none? { |el2| el2 < el1 }
  end
end

def my_min_fast(array)
  min = nil
  array.each do |el|
    if min.nil? || el < min
      min = el
    end
  end
  min
end

def largest_contiguous_subsum(arr)
  subsets = []
  arr.each_index do |i|
    (i...arr.length).each do |j|
      subsets << arr[i..j]
    end
  end
  subsets.map { |el| el.reduce(:+) }.max
end

def largest_contiguous_subsum_fast(arr)
  largest_sum = arr.first
  total_with_last = largest_sum
  arr[1..-1].each do |num|
    total_with_last += num
    if num > total_with_last
      total_with_last = num
    end
    if total_with_last > largest_sum
      largest_sum = total_with_last
    end
  end
  largest_sum
end
#
# largest_sum = nil
# new_subsum = true
# arr.each do |el|
#   if new_subsum
#     if largest_sum.nil? || el > largest_sum
#       largest_sum = el
#       new_subsum = false
#     end
#   elsif el > 0 ||
#     largest_sum += el
#   else
#     new_subsum = true
#   end
# end
# largest_sum
