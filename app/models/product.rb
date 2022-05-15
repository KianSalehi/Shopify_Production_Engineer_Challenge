class Product < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 500}
    validates :city, presence: true
    validates :quantity, presence: true
end