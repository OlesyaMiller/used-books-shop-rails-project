class Purchase < ApplicationRecord
    belongs_to :user
    belongs_to :book

    def purchase_book
        if self.book.price > self.user.credit 
            "You do not have enough credit to purchase this book"
        else
            self.user.credit -= self.book.price 
            self.user.save 
            "Concratulations on purchasing this book! Your remaining credit is #{self.user.credit}"
        end        
    end
end
