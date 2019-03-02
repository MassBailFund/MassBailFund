class RequestStatus < ApplicationRecord
  self.table_name = "REQUEST_STATUSES"

  include DowncaseAttributes

  alias_attribute :name, :request_status
end
