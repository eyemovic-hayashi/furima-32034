class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :from_area
  belongs_to :status

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :from_area_id
      validates :delivery_day_id
    end
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
