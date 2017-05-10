class BailStatus < ApplicationRecord
  include DowncaseAttributes

  alias_attribute :name, :bail_status
end
