# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Facility.create!([
  {name: 'Nashua Street Jail'},
  {name: 'South Bay House of Correction'},
  {name: 'Middleton House of Correction'},
  {name: 'Worcester County House of Correction'},
  {name: 'Western Mass. Regional Women\'s Correctional Center'},
  {name: 'MCI - Framingham'},
  {name: 'Billerica House of Correction'},
  {name: 'Plymouth County House of Correction'}
  ])

Court.create([
  {name: "Attleboro"},
  {name: "Ayer"},
  {name: "Barnstable"},
  {name: "Brockton"},
  {name: "Brookline"},
  {name: "Cambridge"},
  {name: "Chelsea"},
  {name: "Chicopee"},
  {name: "Clinton"},
  {name: "Concord"},
  {name: "Dedham"},
  {name: "Dudley"},
  {name: "East Brookfield"},
  {name: "Eastern Hampshire"},
  {name: "Edgartown"},
  {name: "Fall River"},
  {name: "Falmouth"},
  {name: "Fitchburg"},
  {name: "Framingham"},
  {name: "Gardner"},
  {name: "Gloucester"},
  {name: "Greenfield"},
  {name: "Haverhill"},
  {name: "Hingham"},
  {name: "Holyoke"},
  {name: "Ipswich"},
  {name: "Lawrence"},
  {name: "Leominster"},
  {name: "Lowell"},
  {name: "Lynn"},
  {name: "Malden"},
  {name: "Marlborough"},
  {name: "Milford"},
  {name: "Nantucket"},
  {name: "New Bedford"},
  {name: "Newburyport"},
  {name: "Newton"},
  {name: "Northampton"},
  {name: "Northern Berkshire"},
  {name: "Orange"},
  {name: "Orleans"},
  {name: "Palmer"},
  {name: "Peabody"},
  {name: "Pittsfield"},
  {name: "Plymouth"},
  {name: "Quincy"},
  {name: "Salem"},
  {name: "Somerville"},
  {name: "Southern Berkshire"},
  {name: "Springfield"},
  {name: "Stoughton"},
  {name: "Taunton"},
  {name: "Uxbridge"},
  {name: "Waltham"},
  {name: "Wareham"},
  {name: "Westborough"},
  {name: "Westfield"},
  {name: "Winchendon"},
  {name: "Woburn"},
  {name: "Worcester"},
  {name: "Wrentham"},
  {name: "BMC Brighton"},
  {name: "BMC Central"},
  {name: "BMC Charlestown"},
  {name: "BMC Dorchester"},
  {name: "BMC East Boston"},
  {name: "BMC Roxbury"},
  {name: "BMC South Boston"},
  {name: "BMC West Roxbury	"},
  {name: "Barnstable Superior"},
  {name: "Berkshire Superior"},
  {name: "Bristol Superior"},
  {name: "Dukes Superior"},
  {name: "Essex Superior"},
  {name: "Franklin Superior"},
  {name: "Hampden Superior"},
  {name: "Hampshire Superior"},
  {name: "Middlesex Superior"},
  {name: "Nantucket Superior"},
  {name: "Norfolk Superior"},
  {name: "Plymouth Superior"},
  {name: "Suffolk Superior"},
  {name: "Worcester Superior"},
])

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

CaseStatus.create!([
  {case_status: 'Open'},
  {case_status: 'Closed'}
  ])

User.create!([
  {
    email: "alla@test.com",
    password: ENV["MA_BAIL_USER_PASSWORD"],
    password_confirmation: ENV["MA_BAIL_USER_PASSWORD"],
    admin: true,
    reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil,
    sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
    current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmed_at: Time.now.utc}
])

Setting.create!([
  {name: "New referral from address", value: "referrals@massbailfund.org"},
  {name: "New referral to address", value: "referrals@massbailfund.org"}
])
