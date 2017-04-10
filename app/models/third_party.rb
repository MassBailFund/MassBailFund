class ThirdParty < ApplicationRecord
  belongs_to :address
  belongs_to :contact

  validates :address, presence: true
  validates :contact, presence: true
  validates :relationship_to_client, presence: true
end
