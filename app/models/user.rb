class User < ApplicationRecord
    has_many :books, through: :purchases
    has_secure_password

end
