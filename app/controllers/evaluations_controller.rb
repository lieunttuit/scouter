class EvaluationsController < ApplicationController
  before_action :evaluatee_id, only: [:new, :create, :destroy]
  def new
    @user = User.find_by(id: @id)
    @evaluation = Evaluation.new
  end

  def create
    @user = User.find_by(id: @id)
    @evaluation = Evaluation.create!(evaluation_params.merge(user_id: current_user.id, evaluatee_id:@user.id))

    if @evaluation.save!
      gain_point
      redirect_to users_path, notice: "「#{@user.name}さん」を評価(#{@evaluation.evaluation_point}/10)しました。"
    else
      render :new
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to users_url
  end

private
  def evaluation_params
    params.require(:evaluation).permit(:user_id, :evaluatee_id, :evaluation_point)
  end

  private def evaluatee_id
    @id = params[:evaluatee_id]
  end
end
