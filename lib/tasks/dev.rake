namespace :dev do 

  task fetch_user: :environment do

    User.destroy_all

    url = "https://uinames.com/api/?ext&region=england"

    15.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)

      user = User.create!(
        name: data["name"],
        email: data["email"],
        password: data["password"],
        gender: data["gender"],
        age: data["age"],
        region: data["region"],
        phone: data["phone"],
        avatar: data["photo"]
        )

      puts "create user #{user.name}"
    end

    puts "now have #{User.count} users data."
  end
end