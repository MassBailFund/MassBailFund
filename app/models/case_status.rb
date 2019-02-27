class CaseStatus < ApplicationRecord
  self.table_name = "CASE_STATUSES"

  include DowncaseAttributes

  alias_attribute :name, :case_status
end
