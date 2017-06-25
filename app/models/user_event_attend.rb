class UserEventAttend < ApplicationRecord
  belongs_to :user
  belongs_to :event

  aasm column: :state do
    state :coming, initial: true
    state :may_not_come
    state :canceled

    event :cancel do
      transitions to: :canceled, from: [:coming, :may_not_come]
    end

    event :leave_me_alone do
      transitions to: :may_not_come, from: [:coming, :canceled]
    end

    event :come do
      transitions to: :coming, from: [:canceled, :may_not_come]
    end
  end
end
