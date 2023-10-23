class Card < ApplicationRecord
  has_many :transactions

  validates :name, :number, :cvv, :balance, :expiry_month, :expiry_year, presence: true
  validates :number, length: { is: 15 }, uniqueness: true
  validates :cvv, length: { is: 3 }
  validates :expiry_month, numericality: { in: 1..12 }
  validates :expiry_year, length: { is: 4 }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  validate :validate_expiry_date

  encrypts :number, deterministic: true

  def validate_expiry_date
    current_date = Date.today
    if expiry_year < current_date.year
      errors.add(:expiry_year, 'value must be greater than current year')
    elsif expiry_year == current_date.year && expiry_month < current_date.month
      errors.add(:expiry_month, 'value must be greater than current month')
    end
  end

  def card_number
    'x'*11 + number.to_s.last(4)
  end
end
