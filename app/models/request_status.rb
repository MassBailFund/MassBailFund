class RequestStatus < ApplicationRecord
  include DowncaseAttributes

  alias_attribute :name, :request_status
end
