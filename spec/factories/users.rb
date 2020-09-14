FactoryBot.define do
  factory :user do
    name              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    first_name {""}
    last_name {""}
    first_name_katakana {""}
    last_name_katakana {""}
    birthday
  end
end