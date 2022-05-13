class Admin::UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 6)
      @male = User.where(sex: 1)
      @female = User.where(sex: 0)
  end

  private
    def require_admin
      redirect_to root_path unless current_user.admin?
    end
end
