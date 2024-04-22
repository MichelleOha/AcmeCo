# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    first_name { 'test' }
    last_name { 'employee' }
    # FactoryBot sequence method will automatically increment n for each generated email, ensuring that each email address is unique.
    sequence(:email) { |n| "#{n}_test.employee@acmeco.com" }
  end
end
