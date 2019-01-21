#
# Base class for all controllers.
#
class ApplicationController < ActionController::Base
  # CSRF protection, see http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf
  protect_from_forgery with: :exception

  # When models are created/updated through a controller action this will
  # saved the current_user that did it.
  before_action :set_paper_trail_whodunnit

  # Check if current_user is able to do an action based on Ability.
  # This is opted-in for every endpoint unless it is explicitly opted-out.
  #
  # Hint: usually you don't want to opt-out of this check but want to modify
  # the Ability model.
  check_authorization unless: :devise_controller?

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def after_sign_in_path_for(resource)
    admin_clients_path(:scope => 'open')
  end
end
