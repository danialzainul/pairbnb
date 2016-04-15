class PaymentsController < ApplicationController

  def new
    @client_token = generate_client_token
    @reservation = Reservation.find(params[:id])
    @listing = @reservation.listing
    @payment = Payment.new
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: params[:payment_method_nonce]
    )

    # reserve to save the transaction details into database

    redirect_to root_path, notice: "Payment successful!"
  end

  private
  def generate_client_token
  	Braintree::ClientToken.generate
  end

end