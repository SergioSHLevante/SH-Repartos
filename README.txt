SH LEVANTE · CONSULTA DE REPARTOS

QUÉ CONTIENE
- index.html: la aplicación.
- config.json: conexión con Supabase.
- supabase_setup.sql: crea la tabla, permisos y carga todos los clientes actuales.

PARA PROBAR HOY
1. Abre index.html.
2. Funciona en modo local con todos los clientes cargados.
3. En “Administrar repartos” puedes añadir, editar y borrar.
IMPORTANTE: en modo local esos cambios solo quedan en ese navegador.

PARA QUE MAÑANA TODO EL EQUIPO VEA LOS MISMOS DATOS
1. En Supabase, abre SQL Editor.
2. Ejecuta todo el contenido de supabase_setup.sql.
3. En Authentication > Users, crea el usuario administrador que usarás tú.
4. En Project Settings / API, copia:
   - Project URL
   - anon / public key
5. Abre config.json y pega ambos valores.
6. Publica la carpeta completa en Netlify, Vercel, GitHub Pages o tu hosting.
7. Comparte la URL con el equipo.

RESULTADO
- Cualquier empleado puede consultar un código sin iniciar sesión.
- Solo un usuario autenticado puede entrar al panel y modificar repartos.
- Los cambios realizados desde el panel se guardan en Supabase y aparecen para todos.

SEGURIDAD
La anon key de Supabase puede estar en el navegador: está diseñada para eso.
La protección real la hacen las políticas RLS: lectura pública y escritura solo autenticada.
No pongas nunca la service_role key en config.json.
