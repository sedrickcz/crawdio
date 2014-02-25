# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Projects extension
Refinery::Projects::Engine.load_seed

# Added by Refinery CMS Tiers extension
Refinery::Tiers::Engine.load_seed

# Added by Refinery CMS Orders extension
Refinery::Orders::Engine.load_seed

# Added by Refinery CMS UserHistories extension
Refinery::UserHistories::Engine.load_seed
