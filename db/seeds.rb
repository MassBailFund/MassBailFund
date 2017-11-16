# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


RequestStatus.create!([
  {request_status: 'New'},
  {request_status: 'In Process'},
  {request_status: 'Approved'},
  {request_status: 'On Hold'},
  {request_status: 'Denied'},
  {request_status: 'Withdrawn'},
  ])

BailStatus.create!([
  {bail_status: 'None'},
  {bail_status: 'Posted'},
  {bail_status: 'Returned'},
  {bail_status: 'Ready For Pickup'},
  {bail_status: 'Outstanding Fee'},
  {bail_status: 'Forfeited'},
  {bail_status: 'Revoked'},
  {bail_status: 'Warrant'}
  ])
