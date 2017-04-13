#
# TODO: This class may be removed depending on the existing MBF schema
#
class Contact < ApplicationRecord
  has_many :attorneys
  has_many :clients
  has_many :third_parties

  validates :name, presence: true
  validates :phone, presence: true
end
