class ThirdParty < ApplicationRecord
  belongs_to :address
  belongs_to :contact

  has_many :case_details

  validates :address, presence: true
  validates :contact, presence: true
  validates :relationship_to_client, presence: true
end
