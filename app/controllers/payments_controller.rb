class PaymentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@user = current_user 
	  token = params[:stripeToken]
  	# Create the charge on Stripe's servers - this will charge the user's card
  	begin
    	charge = Stripe::Charge.create(
      	:amount => @product.price, # amount in cents, again
      	:currency => "usd",
      	:source => token,
      	:description => params[:stripeEmail]
    	)
    if charge.paid
    	Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
      PaymentMailer.purchase_form(@user.email, @product.name, @product.price).deliver_now     
    end
  	rescue Stripe::CardError => e
    	# The card has been declined
    	body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  	end

	end

end
