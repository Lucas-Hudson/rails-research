# Prevent database truncation if the environment is set to production mode
abort("The Rails environment is running in production mode!") if Rails.env.production?

s_time = Time.now

SEED_COUNT = 5000

path = Rails.root.join("db", "seeds")

# load("#{path}/clean_seed.rb")
load("#{path}/place_seed.rb")
load("#{path}/profession_seed.rb")
load("#{path}/sector_seed.rb")
load("#{path}/skill_seed.rb")
load("#{path}/language_seed.rb")
load("#{path}/org_seed.rb")

puts "TOTAL SEED TIME: #{((Time.now - s_time) / 60).round(1)} minutes"
