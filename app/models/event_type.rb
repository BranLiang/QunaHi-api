class EventType < ApplicationRecord
  acts_as_nested_set
  has_many :events
  has_many :ok_events, -> { where(state: :ok) }, class_name: "Event"
  has_many :needs_modification_events, -> { where(state: :needs_modification) }, class_name: "Event"

  validates :name, presence: true, uniqueness: true
end
