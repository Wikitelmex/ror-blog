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
    photo { 'photo.jpg included' }
    postscounter { 1234 }
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    # is_active true
  end
end
