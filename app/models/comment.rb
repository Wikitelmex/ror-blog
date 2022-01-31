class Comment < ApplicationRecord
  validates :text, presence: true, length: { minimum: 10 }

  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_counter
    post = Post.find(post_id)
    post.increment!(:comments_counter)
    post.save
  end

  after_save :update_counter
end
