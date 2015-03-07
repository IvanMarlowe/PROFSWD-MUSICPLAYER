# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
i = 0

$(document).ready ->
	while i < gon.songList.length
	  table = document.getElementById('tableSongers').getElementsByTagName('tbody')[0]
	  row = table.insertRow(0)
	  cell1 = row.insertCell(0)
	  cell2 = row.insertCell(1)
	  cell1.innerHTML = gon.songList[i].title
	  cell2.innerHTML = gon.songList[i].artist
	  i++
i = 0

$(document).ready ->
	while j < gon.playlistList.length
	  table = document.getElementById('tablePlaylist').getElementsByTagName('tbody')[0]
	  row = table.insertRow(0)
	  cell1 = row.insertCell(0)
	  cell1.innerHTML = gon.playlistList[j].title
	  j++
j = 0

$(document).ready ->
    while k < gon.playlist_songs_titles_artists.length
        table = document.getElementById('tablePlaylistSongs').getElementsByTagName('tbody')[0]
        row = table.insertRow(0)
        cell1 = row.insertCell(0)
        cell2 = row.insertCell(1)
        cell1.innerHTML = gon.playlist_songs_titles_artists[k].title
        cell2.innerHTML = gon.playlist_songs_titles_artists[k].artist
        k++
k = 0

  
$(document).ready ->
    $('#tablePlaylist tr').each ->
        $(this).click ->
            selectedTd = $(this).children('td:first-child').text()
            $('#playlist_selected').text(selectedTd)
            $('#loaded_playlist').val selectedTd
            #insert code to load play list songs in play list table
    
$(document).ready ->
    $('#tableAddSongToPlaylist tr').each ->
        $(this).click ->
            selectedTd = $(this).children('td:first-child').text()
            $('#add_song_to_playlist_playlist').text(selectedTd)

            #insert code to load play list songs in play list table

$(document).ready ->
    $('#tableSongers tr').each ->
        $(this).click ->
            selectedTd = $(this).children('td:first-child').text()
            $('#add_song_to_playlist_song').text(selectedTd)
            $('#song_title').val selectedTd
            
            
$(document).ready ->
    $('#tableSongers tr').attr 'data-toggle', 'modal'
    $('#tableSongers tr').attr 'data-target', '#myModal'
            
$(document).ready ->
    $('#tablePlaylistSongs tr').each ->
        $(this).mousedown (event) ->
              switch event.which
                when 1
                  deinfe = 0
                when 2
                  define = 0
                when 3
                  selectedTd = $(this).children('td:first-child').text()
                  alert selectedTd
                else
                  alert 'You have a strange Mouse!'
              return
            
$(document).ready ->
  $('#nextSong').on 'click', ->
    #fileName = gon.songList[gon.musicIndex%gon.songList.length].location
    fileName = gon.playlist_songs_List[gon.musicIndex%gon.playlist_songs_List.length].location
    #alert gon.musicIndex
    
    gon.musicIndex++
    audio = $('#mp3_src')
    $('#player').attr 'src', fileName
    #alert fileName
    audio[0].pause()
    audio[0].load()
    #suspends and restores all audio element
    audio[0].play()
    return
  return

  $('#songStop').on 'click', ->
   #fileName = gon.songList[gon.musicIndex%gon.songList.length].location
    fileName = gon.playlist_songs_List[gon.musicIndex%gon.playlist_songs_List.length].location
    #alert gon.musicIndex
    audio = $('#mp3_src')
    #alert fileName
    audio.pause()
    audio.currentTime = 0
    audio[0].play()
    return


$(document).ready ->
  $('#songStop').on 'click', ->
    #fileName = gon.songList[gon.musicIndex%gon.songList.length].location
    fileName = gon.playlist_songs_List[gon.musicIndex%gon.playlist_songs_List.length].location
    #alert gon.musicIndex
    
    gon.musicIndex++
    audio = $('#mp3_src')
    $('#player').attr 'src', fileName
    #alert fileName
    audio[0].pause()
    audio[0].load()
    #suspends and restores all audio element
    audio[0].play()
    return
  return


$(document).ready ->
  $('#prevSong').on 'click', ->
    audio = undefined
    fileName = undefined
    gon.musicIndex--
    if gon.musicIndex < 0
      #gon.musicIndex = gon.songList.length - 1
      gon.musicIndex = gon.playlist_songs_List.length - 1
    if gon.musicIndex == -1
      gon.musicIndex = 0
    #alert gon.musicIndex
    #fileName = gon.songList[gon.musicIndex % gon.songList.length].location
    fileName = gon.playlist_songs_List[gon.musicIndex % gon.playlist_songs_List.length].location
    audio = $('#mp3_src')
    $('#player').attr 'src', fileName
    audio[0].pause()
    audio[0].load()
    audio[0].play()
    return
  return


$(document).ready ->
  $('#player').bind "ended", ->
    fileName = undefined
    #fileName = gon.songList[gon.musicIndex%gon.songList.length].location
    fileName = gon.playlist_songs_List[gon.musicIndex%gon.playlist_songs_List.length].location
    
    audio = $('#mp3_src')
    $('#player').attr 'src', fileName
    audio[0].pause()
    audio[0].load()
    #suspends and restores all audio element
    audio[0].play()
    return
  return


$(document).ready ->
    $('#begin_playlist').on 'click', ->
    audio = undefined
    fileName = undefined
    if gon.playlist_songs_List.length > 0
        fileName = gon.playlist_songs_List[0].location
        audio = $('#mp3_src')
        $('#player').attr 'src', fileName
        audio[0].pause()
        audio[0].load()
        audio[0].play()
    return
  return
