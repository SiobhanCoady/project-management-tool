10.times do
  p = Project.create title: Faker::Book.title,
                  description: Faker::HarryPotter.quote,
                  due_date: Faker::Date.forward(30)
end

puts Cowsay.say 'Created 10 projects', :elephant
