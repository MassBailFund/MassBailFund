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
end
