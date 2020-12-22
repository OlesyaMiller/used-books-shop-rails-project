class User < ApplicationRecord
    has_many :purchases 
    has_many :books, through: :purchases
    has_secure_password
    validates :username, :email, :password_digest, presence: true, uniqueness: true
    validates :credit, presence: true
end
