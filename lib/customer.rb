class Customer
    @@all=[]
    attr_accessor :total, :tip, :waiter
  def initialize(name,age)
    @name=name
    @age=age
    Customer.all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    meals = Meal.all.select {|meal| meal.customer ==self}
  end

  def waiters
    meals.map {|meal| meal.waiter}
  end
end