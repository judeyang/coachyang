class SeminarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @seminars = Seminar.where(:is_hidden => false)..order("created_at DESC")
  end

  def show
      @seminar = Seminar.find(params[:id])
  end

  def new
     @seminar = Seminar.new
   end

   def create
     @seminar = Seminar.new(seminar_params)

     if @seminar.save
       redirect_to seminars_path
     else
       render :new
     end
   end

   def edit
  @seminar = Seminar.find(params[:id])
end

def update
  @seminar = Seminar.find(params[:id])
  if @seminar.update(seminar_params)
    redirect_to seminars_path
  else
    render :edit
  end
end

def destroy
  @seminar = Seminar.find(params[:id])

  @seminar.destroy

  redirect_to seminars_path
end

   private

   def seminar_params
     params.require(:seminar).permit(:title, :description, :is_hidden)
   end
end
