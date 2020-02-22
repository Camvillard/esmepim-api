puts "cleaning database..."

User.destroy_all
Product.destroy_all

puts "seeding database"

User.create!(
  email: 'ca.villard@gmail.com',
  password: 'esmepimca'
)

Product.create!(
  name: 'livre de recettes',
  description: '32 recettes',
  price_cents: 0
)

puts  "seeds completed."
