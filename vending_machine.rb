class VendingMachine
  USABLE_MONEY = [ 10, 50, 100, 500, 1000 ].freeze

  def initialize
    @drinks = { price: 120, name: :コーラ, stock: 5}
    @input_money = 0
    @sales = 0
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
    if charged_money >= 120 && @drinks[:stock] > 0
      @drinks[:stock] -= 1
      @input_money -= 120
      @sales += 120
      return_money
    end
  end
end