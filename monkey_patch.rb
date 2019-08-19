# Monkey-Patch Ruby's existing Array class to add your own custom methods
require 'byebug'
class Array
    def span
        return nil if self.empty?
        max = self.first
        min = self.first
        self.each do |num|
            max = num if num > max
            min = num if num < min
        end
        max - min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length + 0.0)
    end


    def median
        return nil if self.empty?
        return self.sort[self.length / 2] if self.length.odd? 
        arr = self.sort
        (arr[arr.length/2] + arr[(arr.length / 2) -1]) / 2.0
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(num)
        count = 0
        self.each {|number| count += 1 if num == number}
        count
    end

    def my_index(num)
        self.each_with_index {|number, i| return i if num == number}
        nil
    end

    def my_uniq
        ans = []
        self.each {|num| ans.push(num) if !ans.include?(num)}
        ans
    end

end
