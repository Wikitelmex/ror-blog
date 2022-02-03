FactoryBot.define do
  factory :user do
    id { 999 }
    email { 'test123@example.com' }
    password { 'f4k3p455w0rd' }
    confirmed_at { DateTime.now }
    name { 'alex user name' }
    role { 'admin' }
    photo { 'include_photo.jpg' }
    postscounter { 1234 }
    bio { 'long bio description' }
  end

  factory :post do
    id { 991 }
    author_id { 999 }
    title { 'post title' }
    text { 'post text 1234' }
    comments_counter { 1234 }
    likes_counter { 1234 }
  end

  factory :comment do
    id { 992 }
    post_id { 991 }
    author_id { 999 }
    text { 'comment text' }
  end
end
