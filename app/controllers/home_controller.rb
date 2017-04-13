#
# Controller for static pages
#
class HomeController < ApplicationController
  skip_authorization_check only: [:index]
end
