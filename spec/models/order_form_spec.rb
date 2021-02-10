require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @orderform = FactoryBot.build(:order_form, item_id:@item.id, user_id:@item.id)
  end

  context '購入できる時' do
    it '全ての項目が存在すれば購入できる' do
      expect(@orderform).to be_valid
    end

  it '建物名はなくても保存できる' do
    @orderform.building_name = ''
   expect(@orderform).to be_valid
  end
end

  context '購入できない時' do
    it '郵便番号が空では購入できない' do
      @orderform.postal_code = ''
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Postal code can't be blank",
                                                         'Postal code is invalid. Include hyphen(-)')
    end

  it '郵便番号でハイフンがないと購入できない' do
    @orderform.postal_code = '0000000'
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end

  it '都道府県が空では購入できない' do
    @orderform.prefectures_id = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("Prefectures can't be blank")
  end

  it '都道府県で１で入力されると購入できない' do
    @orderform.prefectures_id = 1
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("Prefectures can't be blank")
  end

  it '市区町村が空では購入できない' do
    @orderform.municipality = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("Municipality can't be blank")
  end

  it '番地が空では購入できない' do
    @orderform.address = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("Address can't be blank")
  end

  it '電話番号が空では購入できない' do
    @orderform.telephone_number = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("Telephone number can't be blank", 'Telephone number is invalid')
  end

  it '電話番号でハイフンがあると購入できない' do
    @orderform.telephone_number = 0o00 - 0o000 - 0o000
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include('Telephone number is invalid')
  end

  it '電話番号でが12桁以上では購入できない' do
    @orderform.telephone_number = 0000000000000
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include('Telephone number is invalid')
  end

  it 'tokenが空では登録できないこと' do
    @orderform.token = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("Token can't be blank")
   end

   it 'user_idがないと購入できない' do
   @orderform.user_id = ''
   @orderform.valid?
   expect(@orderform.errors.full_messages).to include("User can't be blank")
   end

   it 'item_idがないと購入できない' do
   @orderform.item_id = ''
   @orderform.valid?
   expect(@orderform.errors.full_messages).to include("Item can't be blank")
   end
 end 
end