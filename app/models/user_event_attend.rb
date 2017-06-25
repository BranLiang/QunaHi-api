class UserEventAttend < ApplicationRecord
  include AASM
  
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: { scope: :event }

  aasm column: :state do
    state :coming, initial: true
    state :may_come
    state :canceled

    event :cancel do
      transitions to: :canceled, from: [:coming, :may_come]
    end

    event :leave_me_alone do
      transitions to: :may_come, from: [:coming, :canceled]
    end

    event :come do
      transitions to: :coming, from: [:canceled, :may_come]
    end
  end
end
