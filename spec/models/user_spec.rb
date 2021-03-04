require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できる時' do
    it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'emailは@を含まなければ登録できない' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'passwordが6文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordが英字だけでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'passwordが数字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'passwordが全角では登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it 'first_nameは漢字・平仮名・カタカナ以外では登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字を入力してください')
    end

    it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は不正な値です")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前はカタカナで入力して下さい。")
    end

    it 'first_name_kanaは全角カタカナ以外では登録できない' do
      @user.first_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前はカタカナで入力して下さい。")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字を入力してください')
    end

    it 'last_name_kanaは全角カタカナ以外では登録できない' do
      @user.last_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字はカタカナで入力して下さい。')
    end

    it '生年月日が空では登録できない' do
      @user.date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
