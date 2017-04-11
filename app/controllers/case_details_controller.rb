class CaseDetailsController < ApplicationController
  load_and_authorize_resource

  before_action :load_facilities, only: [:new, :create]
  before_action :build_associations, only: [:new, :create]

  def new
  end

  def create
    if @case_detail.save
      redirect_to after_create_path
    end
  end

  private

  def after_create_path
    root
  end

  def create_params
    attorney_attributes = params.require(:case_detail).require(:attorney_attributes).permit(:email, contact_attributes: [:name, :phone], address_attributes: [:address])
    client_attributes = params.require(:case_detail).require(:client_attributes).permit(:birth_date, :email, contact_attributes: [:name, :phone], address_attributes: [:address])
    third_party_attributes = params.require(:case_detail).require(:third_party_attributes).permit(:relationship_to_client, contact_attributes: [:name, :phone], address_attributes: [:address])

    params.require(:case_detail).permit(
      :facility_id,
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
      :additional_info,
    ).merge(
      attorney_attributes: attorney_attributes,
      client_attributes: client_attributes,
      third_party_attributes: third_party_attributes
    )
  end

  def load_facilities
    @facilities = Facility.all
  end

  def build_associations
    @case_detail.build_attorney unless @case_detail.attorney
    @case_detail.attorney.build_contact unless @case_detail.attorney.contact
    @case_detail.attorney.build_address unless @case_detail.attorney.address

    @case_detail.build_client unless @case_detail.client
    @case_detail.client.build_contact unless @case_detail.client.contact
    @case_detail.client.build_address unless @case_detail.client.address

    @case_detail.build_third_party unless @case_detail.third_party
    @case_detail.third_party.build_contact unless @case_detail.third_party.contact
    @case_detail.third_party.build_address unless @case_detail.third_party.address
  end
end
