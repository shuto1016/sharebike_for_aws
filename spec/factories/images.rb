FactoryBot.define do

  factory :image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/surpport/xjr400r.jpg'), 'image/jpeg') }
    article
  end

end