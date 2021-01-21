class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery
  belongs_to :area
  belongs_to :day

  validates :item_name, :text, :image, :category_id, :state_id, :delivery_id, :area_id, :day_id, :price, presence: true
  validates :category_id, :state_id, :area_id, :delivery_id, :day_id, numericality: { other_than: 1 }

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
