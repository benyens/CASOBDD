CREATE VIEW INICIO_VIEW AS 
SELECT 
    USUARIO.id,
    USUARIO.nombre_usuario,
    GENERO.id,
    GENERO.nombre,
    CANCION.id,
    CANCION.nombre,
    CANCION.duracion,
    CANCION.veces_escuchada,
    CANCION.me_gusta,
    CANCION.descargado,
    ARTISTA.id,
    ARTISTA.nombre,
    ARTISTA.descripcion,
    ARTISTA.oyentes_mensuales,
    ARTISTA.verificado,
    ARTISTA.siguiendo,
    PLAYLIST.id,
    PLAYLIST.nombre,
    PLAYLIST.fecha_creacion,
    PLAYLIST.es_publica,
    PLAYLIST.USUARIO_id
FROM 
    USUARIO 
LEFT JOIN 
    PLAYLIST  ON USUARIO.id = PLAYLIST.USUARIO_id
LEFT JOIN 
    CANCION  ON PLAYLIST.id = CANCION.PLAYLIST_id AND PLAYLIST.USUARIO_id = CANCION.PLAYLIST_USUARIO_id
LEFT JOIN 
    ARTISTA  ON CANCION.USUARIO_id = ARTISTA.USUARIO_id AND CANCION.ALBUM_id = ARTISTA.id
LEFT JOIN 
    GENERO  ON PLAYLIST.id = GENERO.PLAYLIST_id AND PLAYLIST.USUARIO_id = GENERO.PLAYLIST_USUARIO_id;