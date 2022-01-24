class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_counter
    Post.update(:all, id: post_id, comments_counter: :comments_counter +=1)
  end

  after_save :update_counter
end
