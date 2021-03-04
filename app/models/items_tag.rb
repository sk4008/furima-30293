class ItemsTag

  include ActiveModel::Model
  attr_accessor :item_name, :text, :category_id, :state_id, :delivery_id, :area_id, :day_id, :price, :user_id, :name, :image

  with_options presence: true do
    validates :item_name
    validates :text
    validates :category_id
    validates :state_id
    validates :delivery_id
    validates :area_id
    validates :day_id
    validates :price
    validates :user_id
    validates :image
  end

  validates :category_id, :state_id, :area_id, :delivery_id, :day_id, numericality: { other_than: 1, message: 'を入力してください'}

  def save
    item = Item.create(item_name: item_name, text: text, category_id: category_id, state_id: state_id, delivery_id: delivery_id, area_id: area_id, day_id: day_id, price: price, user_id: user_id, image: image)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end