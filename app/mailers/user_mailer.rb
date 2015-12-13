class UserMailer < ApplicationMailer
	default from: "rachel@rachelkrupnick.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => "rachel@rachelkrupnick.com",
			:subject => "A new contact form message from #{name}")
	end
end
