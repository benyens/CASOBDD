
-- Tabla Usuario
CREATE TABLE Usuario (
    id INT PRIMARY KEY,
    nombre_usuario VARCHAR(50),
    seguidores INT,
    siguiendo INT,
    id_artistas_principales INT,
    id_canciones_principales INT,
    FOREIGN KEY (id_artistas_principales) REFERENCES Artista(id),
    FOREIGN KEY (id_canciones_principales) REFERENCES Cancion(id)
);

-- Tabla Artista
CREATE TABLE ARTISTA (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(100),
    oyentes_mensuales INT,
    verificado BOOLEAN,
    siguiendo BOOLEAN,
);

-- Tabla Canción
CREATE TABLE Cancion (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    duracion INT,
    veces_escuchada INT,
    me_gusta BOOLEAN,
    id_album INT,
    FOREIGN KEY (id_album) REFERENCES Album(id)
);

CREATE TABLE POPULARES (
    id_cancion INT,
    id_artista INT,
    PRIMARY KEY (id_cancion, id_artista),
    FOREIGN KEY (id_cancion) REFERENCES Cancion(id),
    FOREIGN KEY (id_artista) REFERENCES Artista(id)
);


-- Tabla Álbum
CREATE TABLE ALBUM (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_lanzamiento DATE,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES Artista(id)
);

-- Tabla Playlist 
CREATE TABLE PLAYLIST (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_creacion DATE,
    es_publica BOOLEAN,
    id_usuario INT,
    id_cancion INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_cancion) REFERENCES Cancion(id)
);

-- Tabla Podcast
CREATE TABLE PODCAST (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    seguido BOOLEAN,
    descripcion VARCHAR(255),
    calificacion FLOAT DEFAULT 0.0,
    CHECK (calificacion >= 0 AND calificacion <= 5),
    id_canal INT,
    FOREIGN KEY (id_canal) REFERENCES Canal(id)
);

-- Tabla Canal
CREATE TABLE CANAL (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
);

-- Tabla Episodio
CREATE TABLE EPISODIO (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    duracion INT,
    descripcion VARCHAR(50),
    descargado BOOLEAN,
    agregado BOOLEAN,
    fecha_publicacion DATE,
    id_podcast INT,
    FOREIGN KEY (id_podcast) REFERENCES Podcast(id)
);

-- Tabla Presentador
CREATE TABLE PRESENTADOR (
    id INT PRIMARY KEY,
    id_presentador INT,
    FOREIGN KEY (id_presentador) REFERENCES Artista(id)
);

-- Tabla Genero
CREATE TABLE GENERO (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    id_playlist INT,
    FOREIGN KEY (id_playlist) REFERENCES Playlist(id)
)

CREATE TABLE GENERO_PODCAST (
    id_genero INT,
    id_podcast INT,
    PRIMARY KEY (id_genero, id_podcast),
    FOREIGN KEY (id_genero) REFERENCES Genero(id),
    FOREIGN KEY (id_podcast) REFERENCES Podcast(id)
);

