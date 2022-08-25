class Category < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :name, length: { minimum: 3, maximum: 25 }
end
