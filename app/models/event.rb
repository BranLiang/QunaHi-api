class Event < ApplicationRecord
  has_many :images, as: :imageable

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true
end
