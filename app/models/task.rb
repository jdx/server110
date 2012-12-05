class Task < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user

  def to_s
    "#{title} #{created_at.to_s(:short)}"
  end

  scope :on_day, ->(day) { where created_at: day.beginning_of_day..day.end_of_day }
end
