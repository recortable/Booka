
FactoryGirl.define do
  factory :user do
    name 'User'
  end

  factory :booka_line do
    user
    title 'BookaLine Title'
    slug { "#{title}".downcase.gsub(/[^a-z0-9\-_]+/, '-')}
  end

  factory :project do
    user
    booka_line
    title 'Project Title'
    slug { "#{title}".downcase.gsub(/[^a-z0-9\-_]+/, '-')}
  end

  factory :content do
    project
    user
    title 'Content Title'
    content_type 'text/markdown'
    body 'Content body.'
  end
end