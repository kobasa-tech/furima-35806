class Item < ApplicationRecord
  # バリデーションの設定
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :province_id
    validates :delivery_days_id
  end

  validates :price, presence: true,
  format:       { with: /\A[0-9]+\z/ },
  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  # アソシエーションの設定
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :province
  belongs_to :delivery_days
end
