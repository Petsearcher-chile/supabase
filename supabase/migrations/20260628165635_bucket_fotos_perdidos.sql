-- 1) Crear bucket privado (public = false)
insert into storage.buckets (id, name, public)
values ('fotos_perdidos', 'fotos_perdidos', false)
    on conflict (id) do nothing;

-- 2) Política: solo autenticados pueden subir (INSERT)
create policy "auth_can_upload_documentos_privados_publicaciones"
on storage.objects
for insert
to authenticated
with check (bucket_id = 'fotos_perdidos');
