class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  attributes :starts_at
  attributes :ends_at
  attributes :lat
  attributes :lng
  attributes :location
  attributes :state
  attributes :coming_users_count
  
  belongs_to :event_type
  belongs_to :user
end
