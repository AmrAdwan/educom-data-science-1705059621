-- The SQL script to remove and then re-add foreign key constraints would look something like this:

-- SQL script to remove and recreate foreign key constraints

-- Start of transaction
START TRANSACTION;

-- Dropping existing foreign key constraints
ALTER TABLE InvoiceLine DROP FOREIGN KEY IF EXISTS fk_invoiceline_invoice;
ALTER TABLE InvoiceLine DROP FOREIGN KEY IF EXISTS fk_invoiceline_track;

ALTER TABLE PlaylistTrack DROP FOREIGN KEY IF EXISTS fk_playlisttrack_playlist;
ALTER TABLE PlaylistTrack DROP FOREIGN KEY IF EXISTS fk_playlisttrack_track;

ALTER TABLE Track DROP FOREIGN KEY IF EXISTS fk_track_album;
ALTER TABLE Track DROP FOREIGN KEY IF EXISTS fk_track_mediatype;
ALTER TABLE Track DROP FOREIGN KEY IF EXISTS fk_track_genre;

ALTER TABLE Album DROP FOREIGN KEY IF EXISTS fk_album_artist;

ALTER TABLE Invoice DROP FOREIGN KEY IF EXISTS fk_invoice_customer;

ALTER TABLE Customer DROP FOREIGN KEY IF EXISTS fk_customer_supportrep;

-- Recreating foreign key constraints
ALTER TABLE InvoiceLine ADD CONSTRAINT fk_invoiceline_invoice FOREIGN KEY (invoice_id) REFERENCES Invoice(id);
ALTER TABLE InvoiceLine ADD CONSTRAINT fk_invoiceline_track FOREIGN KEY (track_id) REFERENCES Track(id);

ALTER TABLE PlaylistTrack ADD CONSTRAINT fk_playlisttrack_playlist FOREIGN KEY (playlist_id) REFERENCES Playlist(id);
ALTER TABLE PlaylistTrack ADD CONSTRAINT fk_playlisttrack_track FOREIGN KEY (track_id) REFERENCES Track(id);

ALTER TABLE Track ADD CONSTRAINT fk_track_album FOREIGN KEY (Album_id) REFERENCES Album(id);
ALTER TABLE Track ADD CONSTRAINT fk_track_mediatype FOREIGN KEY (MediaType_id) REFERENCES MediaType(id);
ALTER TABLE Track ADD CONSTRAINT fk_track_genre FOREIGN KEY (Genre_id) REFERENCES Genre(id);

ALTER TABLE Album ADD CONSTRAINT fk_album_artist FOREIGN KEY (artist_id) REFERENCES Artist(id);

ALTER TABLE Invoice ADD CONSTRAINT fk_invoice_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);

ALTER TABLE Customer ADD CONSTRAINT fk_customer_supportrep FOREIGN KEY (SupportRep_id) REFERENCES Employee(id);

-- End of transaction
COMMIT;
