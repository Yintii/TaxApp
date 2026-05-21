class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show edit update destroy ]

  def index
    @wallets = Wallet.all
  end

  def show
  end

  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new(wallet_params)
    if @wallet.save
      redirect_to @wallet
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @wallet.update(wallet_params)
      redirect_to @wallet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wallet.destroy
    redirect_to root_path
  end

  private
    def wallet_params
      params.expect(wallet: [:address, :user_id])
    end
    
    def set_wallet
      @wallet = Current.user.wallets.find(params[:id])
    end
end
