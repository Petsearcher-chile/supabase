UPDATE storage.buckets
SET
    file_size_limit = 5242880, -- Tamaño en bytes (Ejemplo: 5MB)
    allowed_mime_types = ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/gif', 'image/avif', 'image/bmp' ]::text[]
WHERE id = 'fotos_perdidos';