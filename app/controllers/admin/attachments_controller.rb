class Admin::AttachmentsController < ApplicationController
  load_and_authorize_resource

  def show
    # This does not create a useable file, however the real website doesn't either
    send_data @attachment.attachment, type: 'application/pdf', filename: @attachment.filename
  end
end
