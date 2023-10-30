class CardsSerializer < ActiveModel::Serializer
  attributes :id, :name, :card_number, :expiry, :balance

  def card_number
    object.card_number
  end

  def expiry
    "#{object.expiry_month}/#{object.expiry_year}"
  end
end
