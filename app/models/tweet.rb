# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
class Tweet < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { minimum: 2, maximum: 140 }
  validates :content, format: { with: /\A(?!\@)/ }

  has_many_attached :images
  belongs_to :user
end
