class PurchasesController < ApplicationController

  def new
    byebug
  	@client_token = Braintree::ClientToken.generate
  	@reservation = Reservation.find(params[:id])
  	@purchases = Purchases.new
  end

  def create
  	nonce = params[:payment_method_nonce]
  	render action: :new and return unless nonce
  	result = Braintree::Transaction.sale(
  		amount: "10.00",
  		payment_method_nonce: params[:payment_method_nonce]
  	)

  	# reserve to save the transaction details into database

  	redirect_to listing_reservations_path
  end	

end