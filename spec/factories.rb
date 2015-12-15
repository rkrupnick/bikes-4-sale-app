FactoryGirl.define do
	factory :user do
		email 		"newuser@example.com"
		password 	"password"
	end

	factory :product do
		name 				"Product1"
		description "An awesome product"
		color				"Purple"
		image_url		"product.jpg"
	end

	factory :comment do
		rating 	5
		body 		"Great product!"
		user
		product
	end

	factory :order do
		product_id	1
		user_id			1
		total				200
	end
end