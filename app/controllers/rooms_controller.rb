class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  def index
    @rooms = current_user.rooms.all
    # 並び替え
    @rooms = current_user.rooms.order(:name)
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: '部屋データを登録しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to @room, notice: "内容が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
     redirect_to @room, notice: "削除しました。"
    else
      render :index
    end
#    respond_to rooms_path
  end

  private

    def set_room
      @room = Room.find_by(user_id: params[:user_id])
    end

    def room_params
      params.require(:room).permit(:name, :price1, :price2, :price3, :price4, :price5, :price6, :peoplenb, :roomtype_id, :user_id)
    end

    def correct_user
        room = Room.find_by(user_id: params[:user_id])
#      if !current_user?(product.user)
#        redirect_to root_path, alert: '許可されていないページです'
#      end
    end

end
