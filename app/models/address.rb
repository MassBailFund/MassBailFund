class Address < ApplicationRecord
  has_many :attorneys
  has_many :clients
  has_many :third_parties

  validates :address, presence: true
end
