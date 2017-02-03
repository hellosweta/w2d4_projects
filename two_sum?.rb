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
  midpoint = sorted_arr/2

  left = sorted_arr.take(midpoint)
  right = sorted_arr.drop(midpoint)

  case left.first + right.first == target
  when false
    


end
