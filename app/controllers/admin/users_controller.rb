class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(page: params[:page], per_page: 5)
    @male = User.where(sex: 1)
    @female = User.where(sex: 0)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:sub_image_ids]
      params[:user][:sub_image_ids].each do |sub_image_id|
        sub_image = @user.sub_images.find(sub_image_id)
        sub_image.purge
      end
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "「#{@user.name}」さんはプロフィールを更新しました。" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  def evaluation
    @evaluations = Evaluation.includes(:user)
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
