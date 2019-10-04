class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address, null: false

      t.timestamps
    end

    add_index :companies, :name, unique: true
  end
end
