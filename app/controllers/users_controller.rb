class UsersController < ApplicationController

  def index
    @users = User.all
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

  private
    def user_params
      params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :sex, :character, :hobby, :generation, :point)
    end

    def point_param
      params.require(:user).permit(:point)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      redirect_to(root_url) unless @user == current_user || current_user.admin?
    end

    def gain_point
      current_user.point += 1
      current_user.update(point_param)
      flash[:notice] = "1ポイント獲得。(所持ポイント#{current_user.point})"
    end
  
    def lose_point
      if @point > 5
        @point -= 5
      else
        @point = 0
      end
    end
end
