# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  'Nashua Street Jail',
  'South Bay House of Correction',
  'Middleton House of Correction',
  'Worcester County House of Correction',
  'Western Mass. Regional Women\'s Correctional Center',
  'MCI - Framingham',
  'Billerica House of Correction',
  'Plymouth County House of Correction'
].each do |name|
  FactoryGirl.create(:facility, name: name)
end
