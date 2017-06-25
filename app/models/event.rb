class Event < ApplicationRecord
  belongs_to :product_type
  has_many :images, as: :imageable
  has_many :user_event_attends
  has_many :interested_users, through: :user_event_attends, class_name: 'User'

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true
end
