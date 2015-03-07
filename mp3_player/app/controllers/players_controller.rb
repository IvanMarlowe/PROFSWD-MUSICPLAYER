class PlayersController < ApplicationController
        
    def mp3
        if current_user.present?
            @sessionemail = current_user.email
            @sessionid = current_user.id
           
            loaded_playlist = params[:loaded_playlist]
            
            if loaded_playlist.present?
                loaded_playlist_id = Playlist.where(title: loaded_playlist).first
                if loaded_playlist_id.present?
                    loaded_playlist_id = loaded_playlist_id.id
                end
            end
            
            @playlist_name = loaded_playlist
            
            gon.songList = Song.where(user_id: current_user.id).order(title: :desc)
            gon.playlistList = Playlist.where(user_id: current_user.id).order(title: :desc)
            gon.playlist_songs_List = Song.where(id: Playlistsong.select('song_id').where(playlist_id: loaded_playlist_id)).order(title: :asc)
            gon.playlist_songs_titles_artists = Song.where(id: Playlistsong.select('song_id').where(playlist_id: loaded_playlist_id)).select(:title, :artist).order(title: :desc)
            gon.musicIndex = 0
            gon
        else
            redirect_to action: :home
        end
    end
    
    def upload
        upload = params[:upload]

        song = params[:songtitle]
        song = song.to_s
        song = song.gsub!(/[^0-9A-Za-z]/, ' ')

        artist = params[:artisttitle]
        artist = artist.to_s
        artist = artist.gsub!(/[^0-9A-Za-z]/, ' ')

        iduser = current_user.id
        cm = Song.create_music(upload, song, artist, iduser)

        redirect_to action: :mp3
    end
    
    def new_playlist
        playlist_name = params[:new_playlist_name]
        iduser = current_user.id
        Playlist.create(title: playlist_name, user_id: iduser)
        
        redirect_to action: :mp3
    end
    
    def add_song_playlist        
        pid = params[:song_id][:playlist]
        sid = params[:song_title]
        playlist_id = Playlist.find(pid).id
        song_id = Song.select(:id).where(title: sid).first.id
        
        temp_size = Playlistsong.where(id: playlist_id).size
        if  temp_size == 0
            Playlistsong.create(playlist_id: playlist_id, song_id: song_id, tracknumber: 1)
        else
            temp_size_1 = temp_size + 1
            Playlistsong.create(playlist_id: playlist_id, song_id: song_id, tracknumber: temp_size_1)
        end
        
        redirect_to action: :mp3
        
    end
    
    def load_playlist
        loaded_playlist = params[:loaded_playlist]
        redirect_to action: :mp3, :loaded_playlist => loaded_playlist
    end
end
