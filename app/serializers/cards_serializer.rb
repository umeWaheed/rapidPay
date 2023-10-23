class CardsSerializer < ActiveModel::Serializer
  attributes :id, :name, :card_number, :expiry, :balance

  def card_number
    object.card_number
  end

  def expiry
    "#{expiry_month}/#{expiry_year}"
  end
end
