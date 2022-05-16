class Product < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 500}
    validates :city, presence: true
    validates :quantity, presence: true, numericality: {greater_than: 0}
    validates :weight, numericality: {greater_than: 0}, allow_blank: true
    
    # Model function to generate CSV file for a specific product
    def to_csv
        headers = ["id", "title", "description", "quantity", "weight", "city", "weather_description"]
        CSV.generate(headers: true) do |csv|
            csv << headers
            csv << self.attributes.values_at(*headers)
        end
    end
end