class Task < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user

  def to_s
    "#{title} #{created_at.to_s(:short)}"
  end
end
