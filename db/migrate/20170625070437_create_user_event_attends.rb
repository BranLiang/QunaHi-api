class CreateUserEventAttends < ActiveRecord::Migration[5.1]
  def change
    create_table :user_event_attends do |t|
      t.string :state
      t.references :user, foreign_key: true, index: true
      t.references :event, foreign_key: true, index: true

      t.timestamps
    end
  end
end
