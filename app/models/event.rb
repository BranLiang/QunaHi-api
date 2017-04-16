class Event < ApplicationRecord
  validates :name, :description, presence: true
end
