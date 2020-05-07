require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items
        def initialize(employee_discount=0)
            @discount = employee_discount
            @total = 0
            @items = []
        end

        def add_item(title_of_item, price, quantity=1 )
            @total = @total + (price *quantity)
            @last_item = price * quantity
            quantity.times do
            @items << title_of_item
            end
        end

        def apply_discount
            if @discount > 0
                @total = @total- (@total * (@discount/100.0))
                return "After the discount, the total comes to $#{@total.to_i}."
            else #discount = 0
                "There is no discount to apply."
            end
        end

        def void_last_transaction
            @total= @total - @last_item

        end
end
