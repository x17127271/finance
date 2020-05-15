class Case < ApplicationRecord
    belongs_to :customer

    validates :topic, presence: true
end
