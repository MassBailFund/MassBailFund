#
# Public facing form to create ClientReferrals.
#
class ClientReferralsController < ApplicationController
  load_and_authorize_resource

  before_action :load_facilities, only: [:new, :create]

  def new
    # all logic handled by load_and_authorize_resource
  end

  def create
    redirect_to after_create_path if @client_referral.save
  end

  private

  def after_create_path
    root_path
  end

  def load_facilities
    @facilities = Facility.all
  end

  def create_params
    allowed_params = client_referral_param_names + attorney_param_names + client_param_names + third_party_param_names
    params.require(:client_referral).permit(allowed_params)
  end

  def client_referral_param_names
    %i(
      facility_id docket_number charges arraignment_date appearance_date
      bail_amount gps_required court open_cases_description
      warrants_description support_person_description
      released_upon_posting_description school_description
      employment_description housing_description history_description
      additional_info_description
    )
  end

  def attorney_param_names
    %i(attorney_email attorney_name attorney_phone attorney_address)
  end

  def client_param_names
    %i(client_birth_date client_email client_name client_phone client_address)
  end

  def third_party_param_names
    %i(
      third_party_relationship_to_client third_party_email third_party_name
      third_party_phone third_party_address
    )
  end
end
