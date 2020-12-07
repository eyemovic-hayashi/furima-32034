class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :from_area_id, :municipalities, :address_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :from_area_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipalities
    validates :address_number
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'Input only number' }   
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, from_area_id: from_area_id, municipalities: municipalities, address_number: address_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end