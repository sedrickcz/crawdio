desc "Import users Kickstarter badges"
task "import_users" => :environment do

  require 'csv'

  cnt = 0
  CSV.foreach(File.path("all.csv")) do |row|
    unless cnt == 0
      data = row.first.split(";")
      UserBadge.create!(email: data.first, badge_title: data[1], tier_id: data.last, added: false)
    end
    cnt += 1
  end
  puts "=============== DEBUG START ================"
  puts "#{Time.now}: Imported #{cnt} backers"
  puts "================ DEBUG END ================="
end