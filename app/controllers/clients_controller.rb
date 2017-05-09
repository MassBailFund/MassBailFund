#
# Public facing form to create Clients.
#
class ClientsController < ApplicationController
  load_and_authorize_resource

  before_action :load_facilities, only: [:new, :create]

  def new
    # all logic handled by load_and_authorize_resource
  end

  def create
    redirect_to after_create_path if @client.save
  end

  private

  def after_create_path
    root_path
  end

  def load_facilities
    @facilities = Facility.all
  end

  def create_params
    params.require(:client).permit(client_param_names)
  end

  def client_param_names
    %i(
      facility docket charges arraignment_date appearance_date
      bail_amount gps_required court open_cases
      warrants support_person released_upon_posting school
      employment housing history additional_info
      attorney_email attorney_name attorney_phone attorney_address
      client_dob client_email client_name client_phone client_address
      reference_relationship reference_email reference_name
      reference_phone reference_address
    )
  end
end
