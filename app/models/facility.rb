#
# Facilities are pretty simple right now and only store a name.
# Currently they are created by the db/seeds.rb file.
#
class Facility < ApplicationRecord
  has_many :case_details

  validates :name, presence: true, uniqueness: true
end
