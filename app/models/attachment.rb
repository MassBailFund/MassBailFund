class Attachment < ApplicationRecord
  include DowncaseAttributes

  belongs_to :client, foreign_key: :CLIENT_ID
end
