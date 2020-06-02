class User < ApplicationRecord
    has_many :purchases 
    has_many :books, through: :purchases
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    validates :credit, presence: true
    validates :password_digest, presence: true, uniqueness: true

end
