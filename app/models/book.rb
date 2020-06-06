class Book < ApplicationRecord
    has_many :purchases
    has_many :users, through: :purchases 
    belongs_to :genre 
    
    validates :title, :author, :price, :number_of_pages, :description, presence: true
    accepts_nested_attributes_for :genre

    scope :search, -> (query){where('title LIKE ?', "%#{query}%")}

end
