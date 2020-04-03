class Waiter

    @@all = []
    def initialize(name, exp)
        @name = name
        @exp =exp
        Waiter.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter==self}
    end

    def best_tipper
        tips = meals.map {|meal| meal.tip}
        high_tip = tips.max
        high_meal = meals.find {|meal| meal.tip==high_tip}
        high_meal.customer
    end
        
        

end