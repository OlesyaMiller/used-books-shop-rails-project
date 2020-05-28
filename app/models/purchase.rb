class Purchase < ApplicationRecord
    belongs_to :user
    belongs_to :book

    def purchase_book
        if self.book.price.to_i > self.user.credit.to_i 
            "You do not have enough credit to purchase this book"
        else
            self.user.credit.to_i - self.book.price.to_i 
            "Concratulations on purchasing this book!"
        end        
    end
end
