require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  
  end

  describe '商品出品機能' do
    context '新規登録がうまくいくとき' do

      it "全ての値が存在すれば登録できる" do
        expect(@item).to be_valid
      end

    end

    context '新規登録がうまくいかないとき' do
  
      it "画像が空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が空だと出品できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "商品のカテゴリーについての情報が空だと出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態についての情報が空だと出品できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担についての情報が空だと出品できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it "発送元の地域についての情報が空だと出品できない" do
        @item.prefecture_from_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture from must be other than 1")
      end

      it "発送までの日数についての情報が空だと出品できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it "価格についての情報が空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格は半角数字でなければ出品できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end

      it "価格が300円以下だと出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end

      it "価格が1000000円以上だと出品できない" do
        @item.price = "1000000"
        @item.valid?
        expect(@item.errors.full_messages).to include( )
      end      
    end
  end
end
