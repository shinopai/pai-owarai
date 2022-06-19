class ComediansController < ApplicationController
  before_action :authenticate_user!
  before_action :build_comedian, only: %i(new create)
  before_action :get_comedian, only: %i(show edit update destroy)

  def new
  end

  def create
    user = User.find(params[:user_id])
    comedian = user.build_comedian(comedian_params)

    if comedian.save
      redirect_to root_path, notice: '芸人登録が完了しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if @comedian.delete
      redirect_to root_path, notice: '芸人情報を削除しました'
    else
      render :show
    end
  end

  def update
    if @comedian.update(comedian_params)
      redirect_to user_comedian_path(params[:user_id], params[:id]), notice: '芸人情報を更新しました'
    else
      render :edit
    end
  end

  def show_all
    @comedians = Comedian.all.order(created_at: :desc)

    render :all
  end

  # private
  def comedian_params
    params.require(:comedian).permit(:stage_name, :comment, :genre_id, :image)
  end

  def build_comedian
    @comedian = current_user.build_comedian
  end

  def get_comedian
    @comedian = Comedian.where(user_id: params[:user_id]).first
  end
end
