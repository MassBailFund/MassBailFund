class ClientReferralsController < ApplicationController
  load_and_authorize_resource

  before_action :load_facilities, only: [:new, :create]

  def new
    # all logic handled by load_and_authorize_resource
  end

  def create
    if @client_referral.save
      redirect_to after_create_path
    end
  end

  private

  def after_create_path
    root_path
  end

  def create_params
    params.require(:client_referral).permit(
      :facility_id,

      :attorney_email,
      :attorney_name,
      :attorney_phone,
      :attorney_address,

      :client_birth_date,
      :client_email,
      :client_name,
      :client_phone,
      :client_address,

      :third_party_relationship_to_client,
      :third_party_name,
      :third_party_phone,
      :third_party_address,

      :docket_number,
      :charges,
      :arraignment_date,
      :appearance_date,
      :bail_amount,
      :gps_required,
      :court,
      :open_cases_description,
      :warrants_description,
      :support_person_description,
      :released_upon_posting_description,
      :school_description,
      :employment_description,
      :housing_description,
      :history_description,
      :additional_info_description
    )
  end

  def load_facilities
    @facilities = Facility.all
  end
end
