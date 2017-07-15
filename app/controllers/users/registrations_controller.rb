class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "信息更新成功"
      redirect_to root_path
    else
      render :edit
    end
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

   def user_params
     params.require(:user).permit(:username, :email, :avatar)
   end
end
