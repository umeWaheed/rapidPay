class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :amount, null: false
      t.float :fee, null: false
      t.belongs_to :card, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
