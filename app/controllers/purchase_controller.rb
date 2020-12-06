class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
