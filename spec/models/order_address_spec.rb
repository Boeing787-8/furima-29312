require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品注文情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'post_codeが空だと保存できないこと' do
      @order_address.post_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_from_id = "1"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture from can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end

    it 'telephone_numberが空だと保存できないこと' do
      @order_address.telephone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが11桁以上だと保存できないこと' do
      @order_address.telephone_number = "123412341234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include()
    end

    it 'telephone_numberにハイフンは不要であること' do
      @order_address.telephone_number = "090-123-456"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include()
    end

  end
end