class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.integer :number, null: false, index: { unique: true }
      t.integer :balance, default: 0
      t.integer :cvv, null: false
      t.integer :expiry_month, null: false
      t.integer :expiry_year, null: false

      t.timestamps
    end
  end
end
