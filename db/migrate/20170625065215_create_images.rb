class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :imageable, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
