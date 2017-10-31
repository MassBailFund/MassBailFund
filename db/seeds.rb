# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {email: "alla@test.com", password: ENV["MA_BAIL_USER_PASSWORD"], password_confirmation: ENV["MA_BAIL_USER_PASSWORD"],
    reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil,
    sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
    current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmed_at: Time.now.utc}
])
