class Person < ApplicationRecord
    validates :email, :name, presence: true
    
    has_many :plants
end
