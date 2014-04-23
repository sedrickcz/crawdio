desc "Add forum users to forum"
task "import_user_from_forum" => :environment do
  
  uri = URI.parse("http://localhost:3000/api/users/export")
  req = Net::HTTP::Get.new(uri)

  res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    http.request(req)
    }
  users = res.body

  puts "#{ActiveSupport::JSON.decode(users).inspect}"

end