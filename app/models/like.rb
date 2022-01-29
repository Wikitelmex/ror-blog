class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_counter
    Post.update_counters post_id, likes_counter: 1
  end

  after_create :update_counter
end
