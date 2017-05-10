class CaseStatus < ApplicationRecord
  include DowncaseAttributes

  alias_attribute :name, :case_status
end
