class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price,
            presence: true
  validates :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id,
            numericality: { other_than: 0, message: 'must be selected' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end
