require 'byebug'

def two_sum(array)
    hash = Hash.new
    ans = []
    array.each_with_index do |num, i|
        hash[num] = i
        difference = 0 - num
        ans << [hash[difference], i] if hash[difference] && num != 0
    end

    ans
end

def my_min(array)
    ans = nil
    array.each do |num|
        if ans == nil || num < ans
            ans = num
        end
    end
    ans
end

def largest_contiguous_subsum(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end


p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])