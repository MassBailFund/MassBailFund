class ClientReferral < ApplicationRecord
  belongs_to :facility

  validates :attorney_name, presence: true
  validates :attorney_email, presence: true
  validates :attorney_phone, presence: true
  validates :attorney_address, presence: true

  validates :client_name, presence: true
  validates :client_email, presence: true
  validates :client_phone, presence: true
  validates :client_address, presence: true
  validates :client_birth_date, presence: true

  validates :third_party_name, presence: true
  # no validates :third_party_email
  validates :third_party_phone, presence: true
  validates :third_party_address, presence: true
  validates :third_party_relationship_to_client, presence: true

  validates :facility, presence: true
  validates :docket_number, presence: true
  validates :charges, presence: true
  validates :arraignment_date, presence: true
  validates :appearance_date, presence: true
  validates :bail_amount, presence: true, numericality: true
  validates :gps_required, inclusion: [true, false]
  validates :court, presence: true
end
