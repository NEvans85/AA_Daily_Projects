require 'byebug'

#(n-k) * k
def windowed_max_range_slow(arr, w_size)
  current_max_range = nil
  window = arr[0...w_size]
  arr.each_with_index do |el, idx|
    difference = window.max - window.min
    current_max_range = difference if current_max_range.nil? ||
                                      difference > current_max_range
    break if w_size + idx + 1 > arr.length
    window.shift
    window << arr[w_size + idx]
  end
  current_max_range
end

p windowed_max_range_slow([1, 0, 2, 5, 4, 8], 2) # 4, 8
p windowed_max_range_slow([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p windowed_max_range_slow([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p windowed_max_range_slow([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8
