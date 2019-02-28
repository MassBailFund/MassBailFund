class Attachment < ApplicationRecord
  self.table_name = "ATTACHMENTS"

  include DowncaseAttributes

  belongs_to :client, foreign_key: :CLIENT_ID
end
