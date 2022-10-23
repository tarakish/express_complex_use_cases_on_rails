class UserRegistrationsController < ApplicationController
  def new
    @user_registraion_form = UserRegistrationForm.new
  end
  
  def create
    @user_registraion_form = UserRegistrationForm.new(user_registraion_form_params)

    if @user_registraion_form.save!
      sign_in(@user_registraion_form)
      redirect_to action: completed
    else
      render :new
    end
  end

  def completed; end

  private

  def user_registraion_form_params
    params.require(:user_registraion_form).permit(
      :email,
      :password,
      :password_confirmation,
      :terms_of_service
    )
  end
end