class SettingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
    @users = User.all
    @user = User.new(user_params)
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update_attributes(setting_params.permit(:value))
        format.html { redirect_to action: :index, notice: 'Setting was successfully updated.' }
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

    def user_params
       binding.pry
       params.permit(:user, :email, :password)
    end
end
