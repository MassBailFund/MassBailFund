#
# Public facing form to create Clients.
#
class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :new]
  load_and_authorize_resource

  before_action :load_facilities, only: [:new, :create]
  before_action :load_courts, only: [:new, :create]

  def new
  end

  def create
    if @client.save
      NewReferralMailer.new_referral_email(@client).deliver
      redirect_to "https://www.massbailfund.org/request-received.html"
    end
  end

  private

  def after_create_path
    flash[:notice] = t('user_feedback.success')
    root_path
  end

  def load_facilities
    @facilities = Facility.all
  end

  def load_courts
    @courts = Court.all
  end

  def create_params
    params.permit(client_param_names)
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
      reference_phone reference_address client_race
    )
  end
end
