require "pry"

class CashRegister
  attr_accessor :total, :discount
  attr_reader :items


  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @total += price
      @items << title
    end
    @last_price = price * quantity
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0

    percent = 1 - @discount.to_f / 100
    @total *= percent
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @last_price
  end
end
