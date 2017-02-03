class String



  def first_anagram?(other_string)
    perms = self.chars.permutation.map(&:join)
    perms.include?(other_string)
  end

  def second_anagram?(other_string)
    string = self.dup
    other_string = other_string.dup
    string.each_char do |char1|
      other_string.each_char do |char2|
        if char1 == char2
          string = string.sub(char1, "")
          other_string = other_string.sub(char2, "")
        end
      end

    end

    string.empty? && other_string.empty?
  end

  def third_anagram?(other_string)
    self.merge_sort == other_string.merge_sort
  end

  def merge_sort
    return self if length < 2
    midpoint = self.length / 2
    left_sorted = self[0...midpoint].merge_sort
    right_sorted = self[midpoint..-1].merge_sort
    String.merge(left_sorted, right_sorted)
  end

  def self.merge(left, right)
    left = left
    right = right
    merged = ""
    until left.empty? || right.empty?
      case left <=> right
      when -1
        merged << left[0]
        left = left[1..-1]
      else
        merged << right[0]
        right = right[1..-1]
      end
    end
    merged + left + right
  end

  def fourth_anagram?(other_string)
    hash = {}
    other_hash = {}

    self.each_char do |char|
      hash.keys.include?(char) ? hash[char] += 1 : hash[char] = 1
    end

    other_string.each_char do |char|
      other_hash.keys.include?(char) ? other_hash[char] += 1 : other_hash[char] = 1
    end

    hash == other_hash

  end

  def fourth_anagram_one_hash?(other_string)
    hash = {}

    self.each_char do |char|
      hash.keys.include?(char) ? hash[char] += 1 : hash[char] = 1
    end

    other_string.each_char do |char|
      hash.keys.include?(char) ? hash[char] -= 1 : false
    end

    hash.values.all?(&:zero?)

  end

end



p "string".fourth_anagram?("grinst")
p "string".fourth_anagram_one_hash?("grinst")
