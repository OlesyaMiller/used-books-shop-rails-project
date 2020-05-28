class Book < ApplicationRecord
    has_many :purchases
    #belongs_to :purchase 
    has_many :users, through: :purchases 
    belongs_to :genre 
end
