class Drink
  attr_accessor :name, :price

  def self.cola
    { price: 120, name: "cola", stock: 5}
  end
  
  def self.redbull
    { price: 200, name: "redbull", stock: 5}
  end

  def self.redbull
    { price: 200, name: "water", stock: 5}
  end
end

class VendingMachine
  USABLE_MONEY = [ 10, 50, 100, 500, 1000 ].freeze
  Drink_Table = ["cola"]

  def initialize
    @drink = Drink.cola
    # @drinks = @drink
    @input_money = 0
    @sales = 0
  end

  def purchase(drink_name)
    if Drink_Table.include?(drink_name)
      p true
    end
  end

  def select_drink(drink_name)
    case drink_name
    when "cola" then
      @drink = Drink.cola
    when "redbull" then
      @drink = Drink.redbull
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
    if charged_money >= 120 && @drink[:stock] > 0
      @drink[:stock] -= 1
      @input_money -= 120
      @sales += 120
      return_money
    end
  end
end