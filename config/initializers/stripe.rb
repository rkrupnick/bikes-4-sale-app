if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_1r6ipb83pe8gHisjWsO5e6VQ',
    :secret_key => 'sk_test_8koM3AoE1lwOzbD6iJZqFITw'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]