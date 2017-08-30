class Admin::BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @seminar = Seminar.find(params[:seminar_id])
    @bookings = @seminar.bookings.order('created_at DESC')
  end
end
