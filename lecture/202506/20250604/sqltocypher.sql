
select 'CREATE ('||'MEDIA'||MediaTypeId||':MediaType {name:'''||name||''', mediaTypeId:' || MediaTypeId || '})'
from media_types
;

select 'CREATE ('||'TRACK'||trackId||':Track {name:'''||name||''', composer:''' || composer || '''})'
from tracks
where composer is not null
and instr(name, '''') == 0
and instr(composer, '''') == 0
;

select 'CREATE'
union all
select '(TRACK'||trackid||')-[:MEDIATYPE_OF]->(MEDIA'||mediatypeid||'),'
from tracks as tt
where composer is not null
and instr(name, '''') == 0
and instr(composer, '''') == 0
;


select 'CREATE ('||replace(replace(replace(name,'&','AND'),' ',''), '/', '')||':GenreType {name:'''||name||''', genreId:' || genreId || '})'
from genres

;


select 'CREATE'
union all
select '(TRACK'||trackid||')-[:GENRE_OF]->('||replace(replace(replace(gg.name,'&','AND'),' ',''), '/', '')||'),'
from tracks as tt, genres as gg
where tt.composer is not null
and instr(tt.name, '''') == 0
and instr(tt.composer, '''') == 0
and tt.genreid = gg.genreid
;



select 'CREATE ('||name||playlistid||':Playlist {name:'''||name||''', playListId:' || playlistid || '})'
from playlists
where instr(name, '''') = 0
and instr(name, ' ') = 0
;

select 'CREATE (play_track_'||pt.playlistid||'_'||pt.trackid||':Play_Track {songName:'''||tt.name||'''})'
from playlist_track as pt, tracks as tt, playlists pp
where tt.composer is not null
and instr(tt.name, '''') == 0
and instr(tt.composer, '''') == 0
and pt.trackid = tt.trackid
and pp.playlistid = pt.playlistid
and instr(pp.name, '''') = 0
and instr(pp.name, ' ') = 0
;



select 'CREATE'
union all
select '(play_track_'||pt.playlistid||'_'||pt.trackid||')-[:PLAYTRACK_OF]->('||pp.name||pp.playlistid||'),'
from playlist_track as pt, tracks as tt, playlists pp
where tt.composer is not null
and instr(tt.name, '''') == 0
and instr(tt.composer, '''') == 0
and pt.trackid = tt.trackid
and pp.playlistid = pt.playlistid
and instr(pp.name, '''') = 0
and instr(pp.name, ' ') = 0
;


select 'CREATE'
union all
select '(play_track_'||pt.playlistid||'_'||pt.trackid||')-[:TRACK_OF]->(TRACK'||tt.trackId||'),'
from playlist_track as pt, tracks as tt, playlists pp
where tt.composer is not null
and instr(tt.name, '''') == 0
and instr(tt.composer, '''') == 0
and pt.trackid = tt.trackid
and pp.playlistid = pt.playlistid
and instr(pp.name, '''') = 0
and instr(pp.name, ' ') = 0
;
