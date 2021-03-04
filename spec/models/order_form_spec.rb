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
      expect(@orderform.errors.full_messages).to include("郵便番号を入力してください")
    end

  it '郵便番号でハイフンがないと購入できない' do
    @orderform.postal_code = '0000000'
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("郵便番号はハイフンを含めてください")
  end

  it '都道府県が空では購入できない' do
    @orderform.prefectures_id = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("都道府県を入力してください")
  end

  it '都道府県で１で入力されると購入できない' do
    @orderform.prefectures_id = 1
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("都道府県を入力してください")
  end

  it '市区町村が空では購入できない' do
    @orderform.municipality = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("市区町村を入力してください")
  end

  it '番地が空では購入できない' do
    @orderform.address = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("番地を入力してください")
  end

  it '電話番号が空では購入できない' do
    @orderform.telephone_number = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("電話番号を入力してください")
  end

  it '電話番号でハイフンがあると購入できない' do
    @orderform.telephone_number = "0o00 - 0o000 - 0o000"
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("電話番号は不正な値です")
  end

  it '電話番号でが12桁以上では購入できない' do
    @orderform.telephone_number = "0000000000000"
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("電話番号は不正な値です")
  end

  it '電話番号が全角数字だと登録できない' do
    @orderform.telephone_number = "０００００００００００"
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("電話番号は不正な値です")
  end

  it 'tokenが空では登録できないこと' do
    @orderform.token = ''
    @orderform.valid?
    expect(@orderform.errors.full_messages).to include("カード情報を入力してください")
   end

   it 'user_idがないと購入できない' do
   @orderform.user_id = ''
   @orderform.valid?
   expect(@orderform.errors.full_messages).to include("Userを入力してください")
   end

   it 'item_idがないと購入できない' do
   @orderform.item_id = ''
   @orderform.valid?
   expect(@orderform.errors.full_messages).to include("Itemを入力してください")
   end
 end 
end
