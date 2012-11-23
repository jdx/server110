class User < ActiveRecord::Base
  attr_accessible :twitter_id, :username

  validates :twitter_id, presence: true
  validates :username, presence: true

  has_many :tasks

  def self.from_omniauth(info)
    user = User.find_or_create_by_twitter_id(info[:uid])
    user.username = info[:info][:nickname]
    user.save!

    user
  end
end
