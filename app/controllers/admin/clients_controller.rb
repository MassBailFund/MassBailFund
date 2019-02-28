#
# Admin controller to view and manage Clients.
#
class Admin::ClientsController < ApplicationController
  load_and_authorize_resource

  before_action :set_locals

  def show
    if @client.pooled == nil
      @client.pooled = false
    end
    @facilities = Facility.all
    render :edit
  end

  def index
    @clients = @clients
    .order(:request_status_id, :bail_status_id, :facility, time_stamp: :desc)

    # filtering and ordering
    params[:scope]&.split(',')&.each do |scope|
      if scope == 'open'
        @clients = @clients.where("CLIENTS.REQUEST_STATUS_ID IN (1, 2)  OR (CLIENTS.REQUEST_STATUS_ID = 3  AND (CLIENTS.BAIL_STATUS_ID = 4 OR CLIENTS.BAIL_STATUS_ID = 1))")
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

    if params[:created_month].present?
      @clients = @clients.where('MONTH(TIME_STAMP) = ?',params[:created_month])
    end

    if params[:created_year].present?
      @clients = @clients.where('YEAR(TIME_STAMP) = ?', params[:created_year])
    end

    @clientsGrouped = @clients.group_by{|client| [client.bail_status_id, client.request_status_id]}
  end

  def edit
  end

  def update
    if @client.update_attributes(update_params) && params.keys.include?("save")
      redirect_to action: :show, id: params[:id]
    elsif @client.update_attributes(update_params) && params.keys.include?("save-and-close")
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @client.destroy!

    redirect_to action: :index
  end

  helper_method :set_boolean_to_yesno
  helper_method :sum_bail_amounts

  private

  def update_params
    params.require(:client).permit(Client.attribute_names.map(&:downcase))
  end

  def sum_bail_amounts(clients)
    summedBail = clients.collect{|client| client.bail_amount}.map{|val| val.gsub(/[^\d\.]/, '').to_i}.reduce(:+)
    return summedBail
  end

  def set_boolean_to_yesno(bool)
    if bool
      return 'Yes'
    else
      return 'No'
    end
  end

  def set_locals
    @facilities = Facility.all
    @case_statuses = CaseStatus.all
    @request_statuses = RequestStatus.all
    @bail_statuses = BailStatus.all
  end
end
