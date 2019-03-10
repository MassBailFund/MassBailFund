FactoryBot.define do
  sequence :address do
    "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip}, MA"
  end

  sequence :facility_name do
    [
      'Nashua Street Jail',
      'South Bay House of Correction',
      'Middleton House of Correction',
      'Worcester County House of Correction',
      'Western Mass. Regional Women\'s Correctional Center',
      'MCI - Framingham',
      'Billerica House of Correction',
      'Plymouth County House of Correction'
    ].sample
  end
end
