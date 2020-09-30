class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_from_id, :city, :house_number, :building_name, :telephone_number, :item_id, :token, :user_id, :order_id

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture_from_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :telephone_number
  end
  

  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_code: post_code, prefecture_from_id: prefecture_from_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)

  end

end