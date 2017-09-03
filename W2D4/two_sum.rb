require 'set'
#complexity: n^2 bc doing n things n times nested loops
def brute_two_sum?(arr, target_sum)
  arr.each_with_index do |el1, i|
    break if i == arr.length - 1
    arr[i+1..-1].each do |el2|
      return true if el1 + el2 == target_sum
    end
  end
  false
end

#nlogn + nlogn
def sorted_two_sum?(arr, target_sum)
  arr.sort![0...-1].each_with_index do |el1, i|
    target_val = target_sum - el1
    potential = arr[0...i] + arr[i + 1..-1]
    potential_val = potential.bsearch { |x| x >= target_val }
    return true if potential_val == target_val
  end
  false
end

def hashed_two_sum?(arr, target_sum)
  set = arr.to_set
  set.each { |el| return true if set.include?(target_sum - el) }
  false
end
