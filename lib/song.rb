require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    @@all.find do |song|
     if song.name == title
      title
     else
       false
     end
    end
  end
  
  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end
  
  def self.alphabetical()
    @@all.sort_by do |t|
      t.name
    end
  end
  
  def self.new_from_filename(file_name)
    row = file_name
    data = row.split(" - ")
    data[1] = (data[1].chomp(".mp3"))
    
    song = self.new
    song.name = data[1]
    song.artist_name = data[0]
    
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
end
