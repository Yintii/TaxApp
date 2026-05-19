class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def profile
    @user = Current.user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.expect(user: [:email_address, :password, :password_confirmation])
    end
end
