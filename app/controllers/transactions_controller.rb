class TransactionsController < ApplicationController
  before_action :set_card

  # GET /transactions
  def index
    @transactions = @card.transactions.all
    respond_to do |format|
      format.html
      format.json { render json: @transactions}
    end
  end

  # GET cards/id/transactions/new
  def new
    @transaction = @card.transactions.new
  end

  # POST cards/id/transactions
  def create
    @transaction = @card.transactions.create(permitted_params)

    respond_to do |format|
      if @transaction.errors.any?
        format.html { render :new }
        format.json { render json: @transaction }
        format.turbo_stream { render_turbo_stream }
      else
        format.html { redirect_to card_transactions_path(@card.id) }
        format.json { render json: @transaction }
        format.turbo_stream { redirect_to card_transactions_path(@card.id) }
      end
    end
  end

  private

  def permitted_params
    params.require(:transaction).permit(:amount)
  end

  def set_card
    @card = Card.find(params[:card_id])
  end

  def render_turbo_stream
    render turbo_stream: [
      turbo_stream.replace(:new_transaction, partial: "shared/errors", locals: { object: @transaction })
    ]
  end
end
