require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "nicknameが空では登録できない" do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが空では登録できない" do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "passwordが空では登録できない" do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordが存在してもpassword_confirmationが空では登録できない" do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

it "passwordが6文字以下では登録できない" do
  @user.password = "000000"
  @user.password_confirmation = "000000"
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
end

it "first_nameが空では登録できない" do
  @user.first_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First_name can't be blank")
end

it "last_nameが空では登録できない" do
  @user.last_name = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last_name can't be blank")
end

it "first_name_kanaが空では登録できない" do
  @user.first_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
end

it "last_name_kanaが空では登録できない" do
  @user.last_name_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
end

it "生年月日が空では登録できない" do
  @user.date = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Date can't be blank")
end

