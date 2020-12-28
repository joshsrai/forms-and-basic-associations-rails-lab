class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song
end


# Note
# has content attribute (String)
# belongs to a Song