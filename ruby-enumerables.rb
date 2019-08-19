require "byebug"
class Array
  def my_each(&prc)
    self.length.times do |i|

      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    ans = []
    self.my_each do |item|
        ans << item if prc.call(item)
    end

    ans
  end

  def my_reject(&prc)
    ans = []
    self.my_each do |item|
        ans << item if !prc.call(item)
    end

    ans

 
  end

end 



p [1,2,4].my_reject {|x| x > 1}