class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id,
                :token

  validates :postal_code, :prefectures_id, :municipality, :address, :telephone_number, :token, :user_id, :item_id, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めてください' }
  validates :prefectures_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address,
                   building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
