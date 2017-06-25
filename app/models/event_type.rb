class EventType < ApplicationRecord
  acts_as_nested_set
  has_many :events

  validates :name, presence: true
end
