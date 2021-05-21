fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# find the biggest fish using O(n^2)
# use either bubble sort, or a nested loop

def bubble_sort(fish_arr)
  sorted = false
  
  until sorted
    sorted = true
    
    (0...fish_arr.length-1).each do |i|
      if fish_arr[i].length > fish_arr[i+1].length
        fish_arr[i], fish_arr[i+1] = fish_arr[i+1], fish_arr[i]
        sorted = false
      end
    end
  end

  fish_arr.last
end

# p bubble_sort(fish_arr)

#Dominant Octopus
# use O(n log n) fxn which is merge sort
def self.merge_sort(fish_arr, &prc)
  return fish_arr if fish_arr.length <= 1

  midpoint = fish_arr.length / 2
  merge(
    merge_sort(fish_arr.take(midpoint), &prc),
    merge_sort(fish_arr.drop(midpoint), &prc),
    &prc
  )
end

def self.merge(left, right, &prc)
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  output = merged + left + right
  output.last
end
# p merge_sort(fish_arr) { |x,y| x <=> y}

#Clever Octopus
# this is n constant time
# so use a binary search algorithm
def bsearch
  return nil if target.length == 0
  mid = target.length / 2

  case target[mid] <=> target
  when 0
    return mid
  when 1
    return target.take(mid).bsearch(target)
  else
    search_res = target.drop(mid+1).bsearch(target)
    search_res.nil? ? nil : mid + 1 + search_res
  end
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


# Slow Dance
# use b search

def slow_dance(move_str, arr)
  return nil if target.length == 0
  mid = target.length / 2

  case target[mid] <=> target
  when 0
    return mid
  when 1
    return target.take(mid).bsearch(target)
  else
    search_res = target.drop(mid+1).bsearch(target)
    search_res.nil? ? nil : mid + 1 + search_res
  end
end


# Constant Dance using constant
# linear
def fast_dance(move_str, arr)
  largest_fish = fish_arr.first
  
  (1...fish_arr.length).each do |i|
    if largest_fish.length < fish_arr[i].length
      largest_fish = fish_arr[i]
    end
  end
  largest_fish
end

# p fast_dance(fish_arr)