class SettingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
    @users = User.all
    @new_user = User.new
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update_attributes(setting_params.permit(:value))
        flash[:notice] = 'Setting was successfully updated.'
        format.html { redirect_to action: :index }
      else
        format.html { redirect_to action: :index }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.fetch(:setting, {})
    end
end
