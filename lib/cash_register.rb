require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction_price = nil
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @total += quantity * price
    quantity.times do
      @items << title
    end
    @last_transaction_price = price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * (@discount / 100.0))
        "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction_price

  end




end
