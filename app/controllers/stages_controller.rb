class StagesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_user, only: %i(new create show join)
    before_action :get_comedian, only: %i(show join)

    def new
      @stage = @user.stages.build
    end

    def create
      logger.debug('▼')
      logger.debug(stage_params)
      logger.debug('▼')
      stage = @user.stages.new(stage_params)

      if stage.save
        redirect_to root_path, notice: '新しいライブ情報を登録しました'
      else
        render :new
      end
    end

    def show_all
      @stages = Stage.all.order(created_at: :desc)

      render :all
    end

    def show
      @stage = Stage.find(params[:id])
    end

    def join
      stage = Stage.find(params[:id])
      @comedian.stages << stage
      redirect_to user_comedian_path(@user, @comedian), notice: stage.title + 'に参加しました'
    end


    # private
    def stage_params
    params.require(:stage).permit(:title, :performance_date, :starting_time, :closing_time, :venue, :price, :comment)
    end

    def get_user
      @user = User.find(params[:user_id])
    end

    def get_comedian
      @comedian = Comedian.where(user_id: params[:user_id]).first
    end
end
