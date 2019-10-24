class Public::CardsController < ApplicationController

  require "payjp"
  def new
    card = Card.where(user_id: 1)
    redirect_to action: "show" if card.exists?

  end

  def pay
    Payjp.api_key = "sk_test_66327bf5ac763be00a5638b2"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
        # metadata: {user_id: 1}
        )
      @card = Card.new(user_id:1, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = Card.where(user_id:1).first
    if card.blank?
    else
      Payjp.api_key = "sk_test_66327bf5ac763be00a5638b2"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
  end
  redirect_to action: "new"
end

  def show
    card = Card.where(user_id: 1).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = "sk_test_66327bf5ac763be00a5638b2"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

end
