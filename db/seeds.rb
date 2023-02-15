require 'faker'

30.times do

  Post.create!(title: Faker::ChuckNorris.fact, url: Faker::Internet.url)


end
