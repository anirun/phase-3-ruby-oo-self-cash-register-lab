require 'pry'

class CashRegister
    attr_accessor :total
    attr_reader :discount, :items, :item_prices, :total

    def initialize(*discount) # when you make a parameter optional, can you only accept an array as an argument?!
        @discount = discount.reduce(0) {|sum, n| sum + n}
        @items = []
        @item_prices = []
        self.total = 0
    end

    def add_item(title, price, *quantity)
        num_of_items = quantity.reduce(0) {|sum, n| sum + n}
        if num_of_items == 0
            self.items << title
            self.item_prices << price
            self.total = item_prices.reduce(0) {|sum, n| sum + n}
        else
            self.item_prices << (price * num_of_items)
                self.total = item_prices.reduce(0) {|sum, n| sum + n}
            while num_of_items > 0 # is this the best way to do this?
                self.items << title
                num_of_items -= 1
            end
        end
    end

    def apply_discount
        if self.discount == 20
            self.total *= 0.8
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.item_prices.pop
        self.total = item_prices.reduce(0) {|sum, n| sum + n}
    end

end