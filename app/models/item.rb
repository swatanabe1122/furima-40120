class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  belongs_to :shipping_cost
  # ユーザーの関連付け
  belongs_to :user
  #商品の画像を投稿
  has_one_attached :image
  # 注文の関連付け
  has_one :order

  validates :item_status_id, numericality: { other_than: 0 } 
  # コメントの関連付け
  #has_many :comments
  
  validates :name, :description, :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, presence: true
  validates :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 0, message: "must be selected" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { only_integer: true }
  validates :item_status_id, presence: true, numericality: { only_integer: true }
  validates :shipping_cost_id, presence: true, numericality: { only_integer: true }
  validates :prefecture_id, presence: true, numericality: { only_integer: true }
  validates :shipping_date_id, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :item_status_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :image, presence: true
end