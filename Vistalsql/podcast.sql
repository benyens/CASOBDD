CREATE VIEW PODCAST_VIEW AS
SELECT
    PODCAST.id,
    PODCAST.nombre,
    PODCAST.seguido ,
    PODCAST.calificacion ,
    PODCAST.descripcion ,
    CANAL.id,
    CANAL.nombre,
    EPISODIO.id,
    EPISODIO.nombre,
    EPISODIO.descripcion,
    EPISODIO.descargado,
    EPISODIO.agregado,
    EPISODIO.fecha_publicacion,
    EPISODIO.duracion,
    GENERO_PODCAST.id,
    GENERO_PODCAST.nombre
FROM PODCAST
LEFT JOIN CANAL ON PODCAST.id = CANAL.PODCAST_id
LEFT JOIN EPISODIO ON PODCAST.id = EPISODIO.PODCAST_id
LEFT JOIN GENERO_PODCAST ON PODCAST.id = GENERO_PODCAST.PODCAST_id
LEFT JOIN GENERO ON GENERO_PODCAST.nombre_genero = GENERO.id;