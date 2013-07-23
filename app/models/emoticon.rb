class Emoticon < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  validates :user_id, presence: true
  default_scope order: 'emoticons.created_at DESC'
end
