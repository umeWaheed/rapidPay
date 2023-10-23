class CreateTransactionFees < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_fees do |t|
      t.float :amount, default: 1

      t.timestamps
    end
  end
end
