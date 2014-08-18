class RegistrationsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create

    @user = User.new(email: params[:user][:email],
                     username: params[:user][:username],
                     password: params[:user][:password],
                     uscf: params[:user][:uscf])

    if @user.save
      redirect_to signin_path, notice: "Successfully Registered!"
    else
      render :new
    end
  end

  def edit

  end

  def destroy

  end
end