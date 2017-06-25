# === SCHEMA ===
# t.string "name", null: false
# t.text "description", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.datetime "starts_at", null: false
# t.datetime "ends_at", null: false
# t.integer "coming_users_count", default: 0, null: false
# t.integer "event_type_id", null: false
# t.string "state", null: false
# t.decimal "lat", precision: 10, scale: 6
# t.decimal "lng", precision: 10, scale: 6
# t.string "location"

class Event < ApplicationRecord
  include AASM

  # events too long in the furture will not be shown
  # events finished will still be displayed for a while
  IN_COMING_EVENTS_DAYS_FORWARD = 14
  FINISHED_EVENTS_STAY_DAYS = 3

  belongs_to :product_type
  has_many :images, as: :imageable
  has_many :user_event_attends_may_coming, -> { where(state: [:coming, :may_come]) }, class_name: "UserEventAttend"
  has_many :may_coming_users, through: :user_event_attends_may_coming, class_name: "User", counter_cache: :coming_users_count
  has_many :user_event_attends
  has_many :interested_users, through: :user_event_attends, class_name: 'User'

  scope :fresh, -> { where("ends_at > ? AND starts_at < ?", Time.now - FINISHED_EVENTS_STAY_DAYS.days, Time.now + IN_COMING_EVENTS_DAYS_FORWARD.days) }

  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true

  aasm column: :state do
    state :pending, initial: true
    state :needs_modification
    state :ok
    state :canceled

    event :cancel do
      transitions to: :canceled, from: [:pending, :ok, :needs_modification]
    end

    event :work_harder do
      transitions to: :needs_modification, from: :pending
    end

    event :pass do
      transitions to: :ok, from: [:needs_modification, :pending]
    end
  end

  def active?
    ends_at < Time.now
  end
end
