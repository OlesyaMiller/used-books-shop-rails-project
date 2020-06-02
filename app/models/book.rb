class Book < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases 
    belongs_to :genre 

    accepts_nested_attributes_for :genre
end
