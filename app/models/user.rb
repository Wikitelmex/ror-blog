class User < ApplicationRecord
  require 'jwt'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # validates :name, presence: true, length: { minimum: 1 }
  # validates :postscounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def self.allow_unconfirmed_access_for
    1.days
  end

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 1.day.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
