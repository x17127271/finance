class Case < ApplicationRecord
    belongs_to :customer

    validates :topic, presence: true
    validates :comments, presence: true
end
