class Comment < ApplicationRecord
  belongs_to :title, class_name: "Book", foreign_key: "book_id"

  validates :body, presence: true

  acts_as_likeable

  # 今日投稿された Comment を取得
  scope :created_today, -> { where(posted_at: Time.zone.now.beginning_of_day) }

  # 昨日投稿された Comment を取得
  scope :created_yesterday, -> { where(posted_at: 1.day.ago.all_day) }

  # 3日前に投稿された Comment を取得
  scope :created_three_days_ago, -> { where(posted_at: 3.days.ago.all_day) }

  # 一週間前に投稿された Comment を取得
  scope :created_a_week_ago, -> { where(posted_at: 1.week.ago.all_day) }

  # 一ヶ月前に投稿された Comment を取得
  scope :created_a_month_ago, -> { where(posted_at: 1.month.ago.all_day) }

end
