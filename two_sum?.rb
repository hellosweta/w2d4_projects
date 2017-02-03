def bad_two_sum?(arr, target)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end

  false
end

p bad_two_sum?([1,2,3], 5)
p bad_two_sum?([1,2,3], 6)
p bad_two_sum?([1,2,4], 4)

#O(n^2)
def okay_two_sum?(arr, target)
  sorted_arr = arr.sort
  sorted_arr.each_with_index do |el, idx|
    working_arr = sorted_arr[0...idx] + sorted_arr[(idx+1)..-1]
    return true unless bsearch(working_arr, (target - el)).nil?
  end
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  midpoint = arr.length/2

  left = arr.take(midpoint)
  right = arr.drop(midpoint + 1)

  case arr[midpoint] <=> target
  when -1
    return bsearch(left, target)
  when 0
    return midpoint
  when 1
    result = bsearch(right, target)
    result.nil? ? nil : midpoint + result + 1
  end

end

p okay_two_sum?([1,2,3], 5)
p okay_two_sum?([1,2,3], 6)
p okay_two_sum?([1,2,4], 4)

def two_sum?(arr, target)
  hash = {}

  arr.each do |el|
    return true if hash[target - el]
    hash[el] = true
  end

  false
end


p two_sum?([1,2,3], 5)
p two_sum?([1,2,3], 6)
p two_sum?([1,2,4], 4)
