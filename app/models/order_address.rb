class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :province_id, :city, :address_line, :building, :phone_number, :token

  # バリデーションの設定
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :province_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
  end

  # 複数のデータベースへの保存処理
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, province_id: province_id, city: city, address_line: address_line,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end