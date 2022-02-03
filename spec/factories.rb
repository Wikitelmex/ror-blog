FactoryBot.define do
  factory :user do
    id { 999 }
    email { 'test123@example.com' }
    password { 'f4k3p455w0rd' }
    encrypted_password { 'f4k3p455w0rd' }
    confirmed_at { DateTime.now }
    created_at { DateTime.now }
    updated_at { DateTime.now }
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
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end

# recent_posts { [
#   {author_id: 999, id: 991, title: 'title1', text: 'text1', created_at: DateTime.now, updated_at: DateTime.now},
#   {author_id: 999, id: 992, title: 'title2', text: 'text2', created_at: DateTime.now, updated_at: DateTime.now},
#   {author_id: 999, id: 993, title: 'title3', text: 'text3', created_at: DateTime.now, updated_at: DateTime.now}
# ] }