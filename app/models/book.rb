class Book < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases 
    belongs_to :genre 
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true
    validates :number_of_pages, presence: true
    validates :description, presence: true

    accepts_nested_attributes_for :genre
end
