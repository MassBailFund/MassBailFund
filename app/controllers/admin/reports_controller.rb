#
# Show report pages
#
class Admin::ReportsController < ApplicationController
  def index
    authorize! :index, :report

    @total_dismissed_clients = Client.dismissed.count
    @total_closed_clients = Client.closed.count
    @total_comissioners_fees = Client.total_commissioners_fees
  end

  def sureties
    authorize! :surities, :report

    @sureties = Client.group(:surety_name).sum(:amount_posted)
  end

  def clients_by_month
    authorize! :clients, :report

    @monthly_requests = Client.where('TIME_STAMP IS NOT NULL')
                              .order('TIME_STAMP DESC')
                              .group('MONTH(TIME_STAMP)')
                              .group('YEAR(TIME_STAMP)')
                              .count
  end
end
