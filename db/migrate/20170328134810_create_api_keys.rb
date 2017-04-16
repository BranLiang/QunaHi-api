class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.string :key, index: true
      t.boolean :active, default: true
      t.string :access_key, index: true

      t.timestamps
    end
  end
end
