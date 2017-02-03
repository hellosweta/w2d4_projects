list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# Phase 1
def my_min_1(list)
  min = nil
  list.each do |num1|
    list.each do |num2|
      new_min = (num1 < num2 ? num1 : num2)
      if min.nil? || new_min < min
        min = new_min
      end
    end
  end
  min
end

p my_min_1(list)

# Phase 2
def my_min_2(list)
  min = list.first
  list.each do |num|
    min = num if num < min
  end
  min
end

p my_min_2(list)


# Phase 1
list = [5, 3, -7]
list_two = [2, 3, -6, 7, -6, 7]
list_three = [-5, -1, -3]

def largest_contiguous_subsum_one(list)
  i = 0
  subsets = []
  while i < list.length
    j = i
    while j < list.length
      subsets << list[i..j]
      j += 1
    end
    i += 1
  end

  sum = subsets[0].inject(:+)
  subsets.each do |subset|
    sum = subset.inject(:+) if sum < subset.inject(:+)
  end
  sum
end


def largest_contiguous_subsum_two(list)
  best_sum = list[0]
  running_sum = list[0]

  list[1..-1].each do |el|
    running_sum += el
    best_sum = el if el > best_sum

    best_sum = running_sum if running_sum > best_sum

    running_sum = 0 if running_sum < 0
  end
  best_sum
end


p  largest_contiguous_subsum_two(list)
p  largest_contiguous_subsum_two(list_two)
p  largest_contiguous_subsum_two(list_three)
