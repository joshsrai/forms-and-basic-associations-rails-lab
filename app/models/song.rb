class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def notes=(notes)
    notes.each do |note|
      note = Note.create(content: note)
      self.notes << note
    end
  end

  def note_contents
    self.notes.collect(&:content)
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      unless content.empty?
        self.notes << Note.create(content: content)
        self.save
      end
    end
  end

end



# Artist
# has a name attribute (String)
# has many Songs

# Song
# has a title attribute (String)
# belongs to an Artist
# belongs to a Genre
# has many Notes

# Genre
# has a name attribute (String)
# has many songs

# Note
# has content attribute (String)
# belongs to a Song