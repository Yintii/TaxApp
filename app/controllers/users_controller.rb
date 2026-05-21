class UsersController < ApplicationController
  before_action :require_authentication
  before_action :set_user, only: %i[show edit update destroy]

  # ── Profile (current user) ──────────────────────────────────────────────

  def profile
    @user = Current.user
    @wallet = Wallet.new
  end

  def edit_profile
    @user = Current.user
  end

  def update_profile
    @user = Current.user
    if @user.update(profile_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :edit_profile, status: :unprocessable_entity
    end
  end

  # ── Admin CRUD (resources :users) ───────────────────────────────────────

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Params for the /profile inline edit (no password change here)
  def profile_params
    params.require(:user).permit(
      :first_name, :last_name, :email_address,
      :phone_number,
      :address_1, :address_2, :city, :state, :zip_code
    )
  end

  # Full params for admin user management
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email_address,
      :password, :password_confirmation,
      :phone_number,
      :address_1, :address_2, :city, :state, :zip_code
    )
  end
end
