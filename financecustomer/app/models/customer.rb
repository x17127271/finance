class Customer < ApplicationRecord
    has_many :cases
    validates :name, presence: true
    validates :city, presence: true
    validates :phone, presence: true
end
