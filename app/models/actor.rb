class Actor < ApplicationRecord
    has_many :characters
    has_many :shows, through: :characters
end
