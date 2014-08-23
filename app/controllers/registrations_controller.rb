class RegistrationsController < ApplicationController
  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create

    @user = User.new(email: params[:user][:email].downcase,
                     username: params[:user][:username].downcase,
                     password: params[:user][:password],
                     uscf: params[:user][:uscf])

    if @user.save
      GameList.create!(user_id: @user.id, title: "My Games")
      redirect_to signin_path, notice: "Thanks for registering!"
    else
      render :new
    end
  end

  def edit

  end

  def destroy

  end
end