
FactoryGirl.define do
  factory :user do
    name 'User'
  end

  factory :project do
    user
    title 'Project Title'
    slug 'project_slug'
  end

  factory :content do
    project
    user
    title 'Content Title'
    content_type 'text/markdown'
    body 'Content body.'
  end
end