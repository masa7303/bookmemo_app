class User < ApplicationRecord
  has_many :books, dependent: :destroy

  acts_as_liker

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider] #providerはどのサービスで認証したのかを見分けるもの
    uid = auth_hash[:uid]
    id = auth_hash[:uid]
    # name = auth_hash[:info][:name]
    # image = auth_hash[:info][:image]

    # ()の中の条件のものが見つければ取得し、なければ新しく作成するというメソッド
    self.find_or_create_by(provider: provider,uid: uid) do |user|
      user.name = name
      # user.image = image
    end
  end

end
