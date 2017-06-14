FactoryGirl.define do

  factory :user, class: User do
    email { 'test@tests.com' }
    password { '12345678' }

  end

end
