class Drink
  # attr_accessor :name, :price
  def self.cola
    { price: 120, name: "cola", stock: 5}
  end
  
  def self.redbull
    { price: 200, name: "redbull", stock: 5}
  end

  def self.water
    { price: 100, name: "water", stock: 5}
  end
end

class VendingMachine
  USABLE_MONEY = [ 10, 50, 100, 500, 1000 ].freeze
  DRINK_TABLE = ["cola"]

  def initialize
    @drink = Drink.cola
    # @drinks = @drink
    @input_money = 0
    @sales = 0
  end

  def add_drinks
    DRINK_TABLE.push("redbull","water")
  end

  def check_drink_table?(drink_name)
    DRINK_TABLE.include?(drink_name)
  end

  def select_drink(drink_name)
    if check_drink_table?(drink_name)
      case drink_name
      when "cola" then
        @drink = Drink.cola
      when "redbull" then
        @drink = Drink.redbull
      when "water" then
        @drink = Drink.water
      end
    end
  end

  def charged_money
    @input_money
  end

  def input_money(money)
    return "いづれかの金額を入力してください → ( 10, 50, 100, 500, 1000 ）" unless USABLE_MONEY.include?(money)
    @input_money += money
  end

  def return_money
    puts "#{@input_money}円のお釣りです。"
    @input_money = 0
  end
  
  def buy
    if charged_money >= @drink[:price] && @drink[:stock] > 0
      @drink[:stock] -= 1
      @input_money -= @drink[:price]
      @sales += @drink[:price]
      return_money
    end
  end
end