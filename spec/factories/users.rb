FactoryBot.define do
  factory :user do
    name              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"aaa000"}
    password_confirmation {password}
    first_name {"亜あア"}
    last_name {"亜あア"}
    first_name_katakana {"カタカナ"}
    last_name_katakana {"カタカナ"}
    birthday {'2019-01-19'}
  end
end