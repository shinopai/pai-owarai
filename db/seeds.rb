50.times do
User.create([
  'name' => Faker::Name.unique.name,
  'email' => Faker::Internet.unique.email,
  'password' => 'password',
  'is_comedian' => rand(0..1)
])
end
