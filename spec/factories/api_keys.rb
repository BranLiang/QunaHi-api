FactoryGirl.define do
  factory :api_key do
    key "RandomKey"
    access_key "RandomAccessKey"
    active true
  end
end
