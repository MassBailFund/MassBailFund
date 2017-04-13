#
# TODO: This class may be removed depending on the existing MBF schema
#
class Client < ApplicationRecord
  belongs_to :address
  belongs_to :contact

  has_many :case_details

  validates :address, presence: true
  validates :contact, presence: true
  validates :email, presence: true
  validates :birth_date, presence: true

  accepts_nested_attributes_for :contact
  accepts_nested_attributes_for :address
end
