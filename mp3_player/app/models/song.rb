class Song < ActiveRecord::Base
    belongs_to :user
    	attr
  	def self.create_music(upload, song, artist, iduser)
		name =  upload['datafile'].original_filename
		directory = "audios"
		path = File.join(directory, name)

		new_music = Song.create(title: song, artist: artist, location: path, user_id: iduser)
		new_music

		directory = "public/audios"
		path = File.join(directory, name)
    	# write the file
   		File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
	end
end
