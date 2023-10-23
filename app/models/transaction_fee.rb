class TransactionFee < ApplicationRecord
  validate :single_instance

  def self.amount
    TransactionFee.first&.amount || ENV['INITIAL_FEE'].to_i
  end

  private

  def single_instance
    if TransactionFee.count == 1
      errors.add(:base, "Only one instance of TransactionFee is allowed.")
    end
  end
end
