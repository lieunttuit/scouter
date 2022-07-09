class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).order('updated_at DESC').paginate(page: params[:page], per_page: 6)
    @male = User.where(sex: 1)
    @female = User.where(sex: 0)
  end

  def evaluation
    @evaluations = Evaluation.includes(:user).order('created_at DESC').paginate(page: params[:page], per_page: 12)
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

end
