class Dog
    attr_accessor :name, :breed, :age, :favorite_foods
   def initialize (name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
   end

   def bark
        if @age <= 3
            return @bark.downcase
        else
            return @bark.upcase
        end
   end

   def favorite_food?(food)
    return @favorite_foods.map(&:upcase).include?(food.upcase)
   end

end
