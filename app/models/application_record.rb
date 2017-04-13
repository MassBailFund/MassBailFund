#
# Base class for all Models.
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  has_paper_trail
end
