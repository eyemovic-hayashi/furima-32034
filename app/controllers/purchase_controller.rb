class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :create]
  # before_action :authenticate_user!, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    # binding.pry
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :from_area_id, :municipalities, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
        Payjp.api_key = ENV['PAYJP_SECRET_KEY']
        Payjp::Charge.create(
          amount: @item.price,
          card: purchase_params[:token],
          currency: 'jpy'
        )
  end
end
