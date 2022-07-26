class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_user
  
  def index
  end

  private
  def redirect_user
    redirect_to users_path if current_user
  end
end
