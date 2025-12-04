class RoomsController < ApplicationController
  def index
    @area =  params[:area]
    @keyword = params[:keyword]
    @rooms = Room.serch_area(@area)
                 .serch_keyword(@keyword)
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(params.require(:room).permit(:name, :introduction, :price_per_night, :address, :image))
    if @room.save
      flash[:notice] = "施設を新規登録しました"
      redirect_to rooms_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :introduction, :price_per_night, :address, :image))
      flash[:notice] = "施設情報を更新しました"
      redirect_to rooms_own_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :rooms
  end

  def own
    @rooms = current_user.rooms
  end
end
