
class CashRegister
    
    attr_accessor :total, :discount, :items, :count, :price
    
    def initialize (discount=nil)
        @total=0
        @discount=discount
        @items=[]
    end

    def add_item (title, price, count=nil)
        @items<<title
        temp=Array.new(count-1,title) if count!=nil
        @items.concat(temp) if count!=nil
        @total=@total+(price*count) if count!=nil
        @total=@total+price if count == nil
        @count=count
        @price=price
    end

    def apply_discount
        phrase="There is no discount to apply."
        if discount !=nil
            @total=@total-200
            phrase= "After the discount, the total comes to $#{@total}."
        end
        phrase
    end

    def void_last_transaction
        @total=@total-@price if count ==nil
        @total=@total-(@price*count) if count != nil
    end

end