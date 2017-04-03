require 'faker'
p 'seeding'

User.create(email: 'user@example.com', password: "password")

tutorials = []

# create 10 users, each with five tutorials
10.times do 
	user = User.create(
		email: Faker::Internet.email,
		password: 'password',
		)	
	5.times do 
		tutorial = Tutorial.new(
			user_id: user.id,
			title: Faker::Lorem.word,
			description: Faker::Lorem.sentence,
			url:   Faker::Internet.url,
			difficulty: rand(1..5),
			duration: rand(5..90) * 10
			)
		tutorial.save!
		tutorials << tutorial
	end
end
p tutorials

# create 5 reviews and 25 ratings for each tutorial
tutorials.each do |tutorial|
	5.times do 
		Review.create(
			tutorial_id: tutorial.id, 
			user_id: rand(1..10),
			title: Faker::Lorem.sentence,
			content: Faker::Lorem.paragraph
			)
	end
	25.times do 
		Rating.create(
			tutorial_id: tutorial.id, 
			user_id: rand(1..10),
			value: rand(1..5)
			)
	end
end

