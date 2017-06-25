class AddColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :starts_at, :timestamp, null: false
    add_column :events, :ends_at, :timestamp, null: false
    add_column :events, :coming_users_count, :integer, default: 0, null: false
    add_column :events, :event_type_id, :integer, null: false
    add_column :events, :state, :string, null: false
    add_column :events, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :events, :lng, :decimal, {:precision=>10, :scale=>6}
    add_column :events, :location, :string
  end
end
