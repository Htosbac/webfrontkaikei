class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'ユーザ内容を更新しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:name, :email, :phonetic, :pstalcode, :address, :tel, :fax, :invoicename1, :invoicename2)
  end
    
  def correct_user
    user = User.find(params[:id])
#    if !current_user?(user)
#      redirect_to root_path, alert: '許可されていないページです'
#    end
  end
end
