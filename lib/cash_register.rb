
require "pry"
class  CashRegister
  attr_accessor :total, :discount
  attr_reader :items

  def initialize(employee_discount = 0)
    @discount = employee_discount
    @total = 0.0
    @items = []
    @transactions = []
  end

  def add_item(title, cost, quantity = 1)
    @total += cost * quantity
    quantity.times { @items << title }
    @transactions << {cost: cost, title: title, quantity: quantity}
  end

  def apply_discount
    if discount > 0
      @total *= ((100.0 - @discount) / 100)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    last = @transactions.pop
    @total -= last[:cost] * last[:quantity]
  end
end
