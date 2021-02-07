class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderform = OrderForm.new(purchase_params)
    # binding.pry
    if @orderform.valid?
      @orderform.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order_form).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :telephone_number, :number, :cvc, :exp_month, :exp_year).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price], # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
