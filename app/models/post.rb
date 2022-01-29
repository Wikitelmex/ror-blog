class Post < ApplicationRecord
  # validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 10 }

  # associations
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  # callbacks
  def update_counter
    User.update_counters author_id, postscounter: 1
  end

  after_create :update_counter

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
