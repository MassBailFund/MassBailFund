class Client < ApplicationRecord
  include DowncaseAttributes

  belongs_to :request_status, foreign_key: :request_status_id
  belongs_to :bail_status, foreign_key: :bail_status_id
  belongs_to :case_status, foreign_key: :case_status_id

  default_scope -> { includes(:request_status, :bail_status, :case_status) }

  scope :closed, -> { where(bail_statuses: {bail_status: ['Ready for Pickup', 'Returned', 'Outstanding Fee']}) }
  scope :dismissed, -> { closed.where("case_disposition LIKE ('%DISMISSED%')") }
  scope :not_dismissed, -> { closed.where("case_disposition NOT LIKE ('%DISMISSED%')") }

  validates :attorney_name, presence: true
  validates :attorney_email, presence: true
  validates :attorney_phone, presence: true
  validates :attorney_address, presence: true

  validates :client_name, presence: true
  validates :client_email, presence: true
  validates :client_phone, presence: true
  validates :client_address, presence: true
  validates :client_dob, presence: true

  validates :reference_name, presence: true
  # no validates :reference_email
  validates :reference_phone, presence: true
  validates :reference_address, presence: true
  validates :reference_relationship, presence: true

  validates :facility, presence: true
  validates :docket, presence: true
  validates :charges, presence: true
  validates :arraignment_date, presence: true
  validates :appearance_date, presence: true
  validates :bail_amount, presence: true, numericality: true
  validates :gps_required, inclusion: [true, false]
  validates :court, presence: true

  # allow access to columns using their lowercase name
  self.columns.each do |attribute|
    unless attribute.name == attribute.name.downcase
      alias_attribute attribute.name.downcase.to_sym, attribute.name.to_sym
    end
  end

  def self.total_commissioners_fees
    sum(:commissioners_fee)
  end

  def request_status_type
    request_status&.request_status
  end

  def bail_status_type
    bail_status&.bail_status
  end

  def case_status_type
    case_status&.case_status
  end
end
