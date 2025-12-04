class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = current_user.reservations.new(room: @room)
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:room_id, :check_in, :check_out, :guest_count))
    @reservation.user = current_user
  end

  def create
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:room_id, :check_in, :check_out, :guest_count, :image))
    @room = @reservation.room

    if @reservation.save
      flash[:notice] = "予約完了しました"
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end
  
  def edit
    @reservation = current_user.reservations.find(params[:id])
  end
  
  def update
    @reservation = current_user.reservations.find(params[:id])

    if @reservation.update(params.require(:reservation).permit(:room_id, :check_in, :check_out, :guest_count))
      flash[:notice] = "再予約しました"
      redirect_to reservations_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を取り消しました"
    redirect_to reservations_path
  end
end
