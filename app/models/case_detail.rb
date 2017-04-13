#
# TODO: This class may be removed depending on the existing MBF schema
#
class CaseDetail < ApplicationRecord
  belongs_to :attorney
  belongs_to :third_party
  belongs_to :client
  belongs_to :facility

  validates :attorney, presence: true
  validates :third_party, presence: true
  validates :client, presence: true
  validates :facility, presence: true
  validates :docket_number, presence: true
  validates :charges, presence: true
  validates :arraignment_date, presence: true
  validates :appearance_date, presence: true
  validates :bail_amount, presence: true, numericality: true
  validates :gps_required, presence: true
  validates :court, presence: true

  accepts_nested_attributes_for :attorney
  accepts_nested_attributes_for :third_party
  accepts_nested_attributes_for :client
end
