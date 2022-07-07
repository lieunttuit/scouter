class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).order('updated_at DESC').paginate(page: params[:page], per_page: 6)
    @male = User.where(sex: 1)
    @female = User.where(sex: 0)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def evaluation
    @evaluations = Evaluation.includes(:user).order('created_at DESC').paginate(page: params[:page], per_page: 12)
  end

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :sex, :character, :hobby,
                                 :generation, :point, :image, sub_images: [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
