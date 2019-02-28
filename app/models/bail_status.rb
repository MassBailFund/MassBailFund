class BailStatus < ApplicationRecord
  self.table_name = "BAIL_STATUSES"

  include DowncaseAttributes

  alias_attribute :name, :bail_status
end
