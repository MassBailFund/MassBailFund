class Client < ApplicationRecord
  self.table_name = "CLIENTS"
  require 'csv'

  include DowncaseAttributes
  before_create :set_time_stamps
  before_save :set_time_stamps

  belongs_to :request_status, foreign_key: :REQUEST_STATUS_ID
  belongs_to :bail_status, foreign_key: :BAIL_STATUS_ID
  belongs_to :case_status, foreign_key: :CASE_STATUS_ID
  has_one :attachment, inverse_of: :client

  default_scope -> { includes(:request_status, :bail_status, :case_status) }

  scope :open, -> { where(REQUEST_STATUSES: {request_status: ['New','In Process', 'Approved', 'On Hold']}) }
  scope :closed, -> { where(BAIL_STATUSES: {bail_status: ['Ready for Pickup', 'Returned', 'Outstanding Fee']}) }
  scope :dismissed, -> { closed.where("case_disposition LIKE ('%DISMISSED%')") }
  scope :not_dismissed, -> { closed.where("case_disposition NOT LIKE ('%DISMISSED%')") }

  validates :attorney_name, presence: true, on: :create
  validates :attorney_email, presence: true, on: :create
  validates :attorney_phone, presence: true, on: :create
  validates :attorney_address, presence: true, on: :create

  validates :client_name, presence: true, on: :create
  validates :client_email, presence: true, on: :create
  validates :client_phone, presence: true, on: :create
  validates :client_address, presence: true, on: :create
  validates :client_dob, presence: true, on: :create

  validates :reference_name, presence: true, on: :create
  # no validates :reference_email
  validates :reference_phone, presence: true, on: :create
  validates :reference_address, presence: true, on: :create
  validates :reference_relationship, presence: true, on: :create

  validates :facility, presence: true, on: :create
  validates :docket, presence: true, on: :create
  validates :charges, presence: true, on: :create
  validates :arraignment_date, presence: true, on: :create
  validates :appearance_date, presence: true, on: :create
  validates :bail_amount, presence: true, numericality: true, on: :create
  validates :gps_required, inclusion: [true, false], on: :create
  validates :court, presence: true, on: :create

  # allow access to columns using their lowercase name
  self.columns.each do |attribute|
    unless attribute.name == attribute.name.downcase
      alias_attribute attribute.name.downcase.to_sym, attribute.name.to_sym
    end
  end

  def facility_name(facilities)
    begin
      Integer(facility)
    rescue ArgumentError
      return facility
    end
    correct_facility = facilities.find{|listed_facility| Integer(facility) == listed_facility.id}
    return correct_facility.name
  end

  def facility_id(facilities)
    if facility.nil?
      return facility
    end
    begin
      Integer(facility)
    rescue ArgumentError
      correct_facility = facilities.find{|listed_facility| facility == listed_facility.name}
      if correct_facility.nil?
        return 0
      end
      return correct_facility.id
    end
    return Integer(facility)
  end

  def court_name(courts)
    begin
      Integer(court)
    rescue ArgumentError
      return court
    end
    correct_court = courts.find{|listed_court| Integer(court) == listed_court.id}
    return correct_court.name
  end

  def court_id(courts)
    if court.nil?
      return court
    end
    begin
      Integer(court)
    rescue ArgumentError
      correct_court = courts.find{|listed_court| court == listed_court.name}
      if correct_court.nil?
        return nil
      end
      return correct_court.id
    end
    return Integer(court)
  end

  def gps_required_string()
    return set_boolean_to_yesno(gps_required)
  end

  def set_boolean_to_yesno(bool)
    if bool
      return 'Yes'
    else
      return 'No'
    end
  end

  def self.total_commissioners_fees
    sum(:commissioners_fee)
  end

  def request_status_type
    request_status&.request_status
  end

  def bail_status_type(bail_statuses)
    bail_statuses.find{|status| bail_status_id.to_i == status.id}.nil? ? '--' : bail_statuses.find{|status| bail_status_id.to_i == status.id}.name
  end

  def case_status_type
    case_status&.case_status
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |client|
        values = client.attributes.values
        csv.add_row values
      end
    end
  end

  private
    def set_time_stamps
      self.TIME_STAMP ||= DateTime.now if self.new_record?
      self.TIME_STAMP ||= DateTime.now
    end
end
