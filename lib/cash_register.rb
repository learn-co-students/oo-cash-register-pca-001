require 'pry'
class CashRegister
  attr_accessor :total, :discount, :last, :items_array
  def initialize(employee_discount=1)
    @total = 0.0
    @items = {}
    @items_array = []
    @discount = employee_discount
  end
  def add_item(title, price, quantity=1)
    @last = title.to_sym
    quantity.times{ @items_array << title } 
    increase = price * quantity
    @total += increase
    @items[title.to_sym] = 0.0
    @items[title.to_sym] +=  increase
  end
  def apply_discount()
    if @discount != 1
    	@total = (@total - @total * @discount / 100.0).to_i
	"After the discount, the total comes to $#{@total}."
    else 
      "There is no discount to apply."
    end
  end
  def items()
    @items_array 
  end
  def void_last_transaction()
    title = @last
    @total -= @items[title]
    @items.delete(title) if @items[title] = 0.0
    while title.to_s == @items_array.last && !@items_array.empty?
      @items_array.pop()
    end
    @total
  end
  
end
