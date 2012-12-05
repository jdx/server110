class Task < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  before_create :set_date

  def to_s
    "#{title} #{created_at.to_s(:short)}"
  end

  private

  def set_date
    self.date = Time.zone.today
  end

end
