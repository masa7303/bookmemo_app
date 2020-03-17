require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'バリデーションのテスト' do
    # before do
    #   user_a = Factory_Bot.create(:user)
    # end

    context 'バリデーションが全て正しいとき' do
      # 正常ケース
      it "エラーではない" do
        book = FactoryBot.create(:book)
        expect(book).to be_valid
      end
    end

    context 'タイトルが空のとき' do
      # 異常ケース
      it "エラーになる" do
        book = FactoryBot.build(:book, title: '')
        expect(book.valid?).to eq(false)
        expect(book.errors.messages[:title]).to include('を入力してください')
      end
    end

    context '著者が空のとき' do
      # 異常ケース
      it "エラーになる" do
        book = FactoryBot.build(:book, author: '')
        expect(book.valid?).to eq(false)
        expect(book.errors.messages[:author]).to include('を入力してください')
      end
    end

  end
end
