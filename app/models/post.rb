class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def update_counter(user_id = author_id)
    User.update(:all, id: user_id, postscounter: :postscounter+=1)
  end

  after_save :update_counter

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
