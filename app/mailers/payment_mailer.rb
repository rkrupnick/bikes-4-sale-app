class PaymentMailer < ApplicationMailer
	default from: "NJBikes@NJBikes.com"

	def purchase_form(email, product, price)
		mail(:from => "NJBikes@NJBikes.com",
			:to => email,
			:subject => "Congratulations of your purchase!"
			)
	end
end
