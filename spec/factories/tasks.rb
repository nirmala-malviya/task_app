# spec/factories/tasks.rb
FactoryBot.define do
  factory :task do
    title { "Test Task" }
    description { "This is a test task." }
    status { "To Do" }
  end
end
