require 'byebug'

def first_anagram?(str1, str2)
  str1_perms = str1.chars.permutation.to_a.map(&:join)
  str1_perms.include?(str2)
end

def second_anagram?(str1, str2)
  str1.chars.each do |char|
    if str2.include?(char)
      idx1 = str1.index(char)
      idx2 = str2.index(char)
      str1.slice!(idx1)
      str2.slice!(idx2)
    end
  end
  str1.empty? && str2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  char_hash = Hash.new(0)

  str1.chars.each do |char|
    char_hash[char] += 1
  end

  str2.chars.each do |char|
    char_hash[char] -= 1
  end

  char_hash.values.all?(&:zero?)
end
