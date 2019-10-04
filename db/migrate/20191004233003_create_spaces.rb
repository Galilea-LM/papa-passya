class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :place, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :spaces, :name, unique: true
  end
end
