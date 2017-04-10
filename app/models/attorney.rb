class Attorney < ApplicationRecord
  belongs_to :address
  belongs_to :contact

  validates :email, presence: true
  validates :address, presence: true
  validates :contact, presence: true
end
