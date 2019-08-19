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

  def my_any?(&prc)
    self.my_each do |item|
      return true if prc.call(item)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |item|
      return false if !prc.call(item)
    end
    true
  end

  def my_join(split = '')
    ans = ''
    self.length.times do |i|
      ans += self[i].to_s
      ans += split unless i == self.length - 1
    end

    ans
  end

end 



p ['a', 'b', 'd'].my_join('%')