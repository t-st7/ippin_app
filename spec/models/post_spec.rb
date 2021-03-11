require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'ippin投稿' do
    context 'ippin登録できない時'do
      it 'title空欄の場合投稿できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("IPPINの名称を入力してください")
      end

      it '説明欄が空欄の場合投稿できない' do
        @post.description = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("説明欄を入力してください")
      end

      it '画像が空欄の場合投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end

      it '調理時間が、１を選択した場合の場合投稿できない' do
        @post.cooking_time_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("調理時間は1以外の値にしてください")
      end
    end

    context '投稿できる時' do
      it '全てが入力されていれば登録出来る' do
        expect(@post).to be_valid
      end
      
    end
  end
end