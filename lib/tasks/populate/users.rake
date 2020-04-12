unless Rails.env.production?
    namespace :populate do
        desc 'Populate Users'
        task users: :environment do
            total_users = 10
            users = Array.new(total_users) do |i|
                user = {
                    email: 'vipul'+ (i+1).to_s + '@gmail.com' ,
                    password:  '12345678'
                }
                user
            end
            User.create!(users)

            puts 'Users Created'
        end
    end
end