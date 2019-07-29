class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        #email:    User.dummy_email(auth),
        #password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        location: auth.info.location
        )
    end

    user
  end

  private

  #def self.dummy_email(auth)
    #{}"#{auth.uid}-#{auth.provider}@example.com"
  #end
end
