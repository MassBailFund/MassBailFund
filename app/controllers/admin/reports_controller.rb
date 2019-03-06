#
# Show report pages
#
class Admin::ReportsController < ApplicationController
  def index
    authorize! :index, :reports

    @total_dismissed_clients = Client.dismissed.count
    @total_closed_clients = Client.closed.count
    @total_comissioners_fees = Client.total_commissioners_fees
  end

  def sureties
    authorize! :surities, :reports

    @sureties = Client.group(:surety_name).sum(:amount_posted)
  end

  def clients_by_month
    authorize! :clients, :reports

    @monthly_requests = Client.where('TIME_STAMP IS NOT NULL')
                              .group("EXTRACT(YEAR_MONTH FROM TIME_STAMP)")
                              .order("EXTRACT(YEAR_MONTH FROM TIME_STAMP) DESC")
                              .count
  end

  def clients_by_year
    authorize! :clients, :reports

    @yearly_requests = Client.where('TIME_STAMP IS NOT NULL')
                              .order('YEAR(TIME_STAMP) DESC')
                              .group('YEAR(TIME_STAMP)')
                              .count
  end

  def clients_for_year
    authorize! :clients, :reports
    params.require(:created_year)
    @clients = Client.where('TIME_STAMP IS NOT NULL AND YEAR(TIME_STAMP) = ?', params[:created_year])
                              .order('TIME_STAMP DESC')

  end
end
