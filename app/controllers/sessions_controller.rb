class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(password: params[:user][:password])
      # session[:]
    end
  end

  def destroy

  end
end