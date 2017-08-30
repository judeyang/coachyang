class BookingsController < ApplicationController
  before_action :authenticate_user!

    def new
      @seminar = Seminar.find(params[:seminar_id])
      @booking = Booking.new
    end

    def create
      @seminar = Seminar.find(params[:seminar_id])
      @booking = Booking.new(booking_params)
      @booking.seminar = @seminar
      @booking.user = current_user

      if @booking.save
        flash[:notice] = "成功提交履历"
        redirect_to seminar_path(@seminar)
      else
        render :new
      end
    end

    private

    def booking_params
      params.require(:booking).permit(:content)
    end
end
