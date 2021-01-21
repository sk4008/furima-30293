require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品出来るとき' do
    it '全ての項目が存在すれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '新規登録できない時' do
    it '出品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end

  it '商品名が空では出品できない' do
    @item.item_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end

  it '商品の説明が空では出品できない' do
    @item.text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end

  it 'カテゴリーが空では出品できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'カテゴリーで1が入力されると登録できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end


  it '商品の状態が空では出品できない' do
    @item.state_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("State can't be blank")
  end

  it '商品の状態で1が入力されると登録できない' do
    @item.state_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("State must be other than 1")
  end


  it '配送料の負担が空では出品できない' do
    @item.delivery_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery can't be blank")
  end

  it '配送料の負担で1が入力されると登録できない' do
    @item.delivery_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery must be other than 1")
  end


  it '発送元の地域が空では出品できない' do
    @item.area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Area can't be blank")
  end

  it '配送元の地域で1が入力されると登録できない' do
    @item.area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Area must be other than 1")
  end


  it '発送までの日数が空では出品できない' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Day can't be blank")
  end

  it '発送までの日数で1を入力されると登録できない' do
    @item.day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Day must be other than 1")
  end

  it '価格が空では出品できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格の範囲が、¥300~¥9,999,999の間でないと出品できない(大きい場合)' do
    @item.price = 10,000,000
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '価格の範囲が、¥300~¥9,999,999の間でないと出品できない(小さい場合)' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '価格が全角文字では登録できないこと' do
    @item.price = '１００'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '価格が半角英数混合では登録できないこと' do
    @item.price = 'test100'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '価格が半角英語だけでは登録できないこと' do
    @item.price = 'test'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '販売価格は半角数字以外では出品できない' do
    @item.price = 'テスト'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end
end
