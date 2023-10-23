class CardsController < ApplicationController
  before_action :set_card, only: %i[show update]

  # GET /cards
  def index
    @cards = Card.all
    respond_to do |format|
      format.html
      format.json { render json: @cards, each_serializer: CardsSerializer }
    end
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # POST /cards
  def create
    year, month = permitted_params["expiry"].split("-")
    card = Card.create(permitted_params.except("expiry")
               .merge({ expiry_year: year, expiry_month: month }))
    respond_to do |format|
      if card.errors.any?
        format.html {redirect_to new_card_path }
      else
        format.html {redirect_to cards_path }
        format.json { render json: card}
      end
    end
  end

  # GET /cards/:id
  def show
    respond_to do |format|
      format.html
      format.json { render json: @card.balance }
    end
  end

  # PUT api/v1/cards/:id
  def update
    @card.update(permitted_update_params)
    respond_to do |format|
      format.html
      format.json { render json: @card}
    end
  end

  private

  def permitted_params
    params.require(:card).permit(:name, :number, :cvv, :expiry, :balance)
  end

  def permitted_update_params
    params.require(:card).permit(:balance)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
