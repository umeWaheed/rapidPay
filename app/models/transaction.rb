class Transaction < ApplicationRecord
  belongs_to :card

  validates :amount, numericality: { greater_than: 0 }

  validate :available_balance

  before_save :set_fee

  after_save :update_balance

  private

  def available_balance
    return if card.balance >= (amount.to_i + TransactionFee.amount)

    errors.add(:amount, 'insufficient amount')
  end

  def set_fee
    self.fee = TransactionFee.amount
  end

  def update_balance
    card.update!(balance: card.balance - (amount.to_i + TransactionFee.amount))
  end
end
