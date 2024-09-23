
namespace :db do
  desc "Seeds production data"
  task seed_production_data: :environment do
    if Project.exists?(name: 'London SW1A 1AA')
      warn "Default Project already created, exiting"
      next
    end

    project = Project.create!(name: 'London SW1A 1AA')
    users = [
      { email: "solicitor@example.com", password: "password123", role: :solicitor },
      { email: "agent@example.com", password: "password123", role: :agent },
      { email: "client@test.com", password: "password123", role: :client }
    ]

    users.each do |user_data|
      user = User.find_or_create_by(email: user_data[:email]) do |u|
        u.password = user_data[:password]
        u.password_confirmation = user_data[:password]
        u.role = user_data[:role]
        puts "Created user: #{u.email} (#{u.role})"
      end

      project.users << user
    end
  end
end
