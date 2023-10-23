class UpdateFeeJob
  include Sidekiq::Worker

  attr_accessor :fee_factor

  def initialize
    @fee_factor = rand(0.0..2.0)
  end

  def perform
    current_amount = TransactionFee.first.amount
    TransactionFee.first.update(amount: current_amount * @fee_factor)
  end
end
