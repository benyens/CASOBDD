CREATE VIEW ALBUM_VIEW AS
SELECT 
    ALBUM.id, 
    ALBUM.nombre, 
    ALBUM.fecha_lanzamiento, 
    ARTISTA.id,
    ARTISTA.nombre AS artista,
    CANCION.id,
    CANCION.nombre AS cancion,
    CANCION.duracion,
    CANCION.me_gusta,
    CANCION.descargado
FROM ALBUM
JOIN ARTISTA ON ALBUM.artista_id = ARTISTA.id
JOIN CANCION ON ALBUM.id = CANCION.album_id
    
