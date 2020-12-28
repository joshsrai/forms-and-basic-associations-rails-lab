class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
end

# Artist
# has a name attribute (String)
# has many Songs
