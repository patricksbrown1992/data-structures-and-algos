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



