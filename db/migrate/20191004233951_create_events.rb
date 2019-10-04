class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date_start, null: false
      t.datetime :date_end, null: false
      t.string :date, null: false
      t.string :description, null: false

      t.timestamps
    end
    add_index :events, :name, unique: true
  end
end
