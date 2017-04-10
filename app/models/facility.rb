class Facility < ApplicationRecord
  has_many :case_details

  validates :name, presence: true, uniqueness: true
end
