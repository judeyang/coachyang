class Admin::SeminarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
    def show
      @seminar = Seminar.find(params[:id])
    end

    def index
      @seminars = Seminar.all
    end

    def new
      @seminar = Seminar.new
    end

    def create
      @seminar = Seminar.new(seminar_params)

      if @seminar.save
        redirect_to admin_seminars_path
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
        redirect_to admin_seminars_path
      else
        render :edit
      end
    end

    def destroy
      @seminar = Seminar.find(params[:id])

      @seminar.destroy

      redirect_to admin_seminars_path
    end

    private

    def seminar_params
      params.require(:seminar).permit(:title, :description, :is_hidden)
    end
end
