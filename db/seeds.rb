10.times do
  p = Project.create title: Faker::Book.title,
                  description: Faker::HarryPotter.quote,
                  due_date: Faker::Date.forward(30)
end


projects = Project.all

projects.each do |p|
  rand(0..10).times do
    p.tasks.create({
      title: Faker::Book.title,
      body: Faker::HarryPotter.quote,
      due_date: Faker::Date.forward(30)
      })
  end
end

tasks_count = Task.count


puts Cowsay.say 'Created 10 projects', :elephant
puts Cowsay.say "Created #{tasks_count} tasks", :elephant
