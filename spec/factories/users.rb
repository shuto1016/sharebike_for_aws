FactoryBot.define do

  factory :user do
    # nickname              {"test"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:nickname) {Faker::Internet.username(specifier: 5..8)
  }
    sequence(:email) {Faker::Internet.email}
    
  end

end