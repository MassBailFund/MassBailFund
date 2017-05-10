#
# Admin controller to view and manage Clients.
#
class Admin::ClientsController < ApplicationController
  load_and_authorize_resource

  before_action :set_locals

  def show
    render :edit
  end

  def index
    @clients = @clients.order(:request_status_id)

    # filtering and ordering
    params[:scope]&.split(',')&.each do |scope|
      if scope == 'open'
        @clients = @clients.open
      elsif scope == 'dismissed'
        @clients = @clients.dismissed
      end
    end

    params[:order]&.split(',')&.each do |order|
      if order == 'court'
        @clients = @clients.order(:court)
      end
    end

    if params[:surety_name].present?
      @clients = @clients.where(surety_name: params[:surety_name])
    end
  end

  def edit
  end

  def update
    if @client.update_attributes(update_params)
      redirect_to action: :show, id: params[:id]
    else
      render :edit
    end
  end

  def destroy
    @client.destroy!

    redirect_to action: :index
  end

  private

  def update_params
    params.require(:client).permit(Client.attribute_names.map(&:downcase))
  end

  def set_locals
    @facilities = Facility.all
    @case_statuses = CaseStatus.all
    @request_statuses = RequestStatus.all
    @bail_statuses = BailStatus.all
  end
end
