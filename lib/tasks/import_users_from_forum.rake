desc "Add forum users to forum"
task "import_user_from_forum" => :environment do

  uri = URI.parse("http://localhost:3000/api/users/export")
  req = Net::HTTP::Get.new(uri)

  res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    http.request(req)
  }
  users = ActiveSupport::JSON.decode(res.body)

  users["users"].each do |user|
    if user["badge_title"].present?
      new_user = User.create username: user["username"], email: user["email"], password_hash: user["hash_password"], salt: user["salt"], active: true, approved: true

    
      # Assign user badge
      new_user.title = user["badge_title"]
      new_user.save!
      # Add user to backers group
      GroupUser.create! group_id: 41, user_id: new_user.id
    end
  end
end
