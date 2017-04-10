class CaseDetail < ApplicationRecord
  belongs_to :attorney
  belongs_to :third_party
  belongs_to :client
  belongs_to :facility

  validates :attorney, presence: true
  validates :third_party, presence: true
  validates :client, presence: true
  validates :facility, presence: true

  accepts_nested_attributes_for :attorney
  accepts_nested_attributes_for :third_party
  accepts_nested_attributes_for :client
end
