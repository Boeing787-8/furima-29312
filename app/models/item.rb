class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :genre_category
  belongs_to_active_hash :genre_condition
  belongs_to_active_hash :genre_day
  belongs_to_active_hash :genre_fee

  has_one_attached :image

    with_options presence: true do

      validates :image
      validates :name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
      validates :explanation, format: { with: /\A[ぁ-んァ-ン一-龥]/}
      validates :category_id, numericality: { other_than: 1 }
      validates :condition_id, numericality: { other_than: 1 }
      validates :delivery_fee_id, numericality: { other_than: 1 }
      validates :shipping_day_id, numericality: { other_than: 1 }
      validates :prefecture_from_id, numericality: { other_than: 1 }
      validates :price, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 299, less_than: 999999 }

    end

    has_many :comments
    belongs_to :user
    has_one :purchase

end
