class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@dakawou\.com\z/i, message: "Use @dakawou.com email address" } 
end
    validates :password, presence: true, length: { minimum: 6 }
end
