-- SH Levante · Repartos
create table if not exists public.delivery_routes (
  code text primary key,
  name text not null,
  days text not null,
  route text default '',
  updated_at timestamptz not null default now()
);

alter table public.delivery_routes enable row level security;

drop policy if exists "Public can read delivery routes" on public.delivery_routes;
create policy "Public can read delivery routes"
on public.delivery_routes for select
to anon, authenticated
using (true);

drop policy if exists "Authenticated can insert delivery routes" on public.delivery_routes;
create policy "Authenticated can insert delivery routes"
on public.delivery_routes for insert
to authenticated
with check (true);

drop policy if exists "Authenticated can update delivery routes" on public.delivery_routes;
create policy "Authenticated can update delivery routes"
on public.delivery_routes for update
to authenticated
using (true)
with check (true);

drop policy if exists "Authenticated can delete delivery routes" on public.delivery_routes;
create policy "Authenticated can delete delivery routes"
on public.delivery_routes for delete
to authenticated
using (true);


insert into public.delivery_routes (code,name,days,route)
values
('C831','BP CASTELLÓN','L-X',''),
('C832','DANONE ALDAYA','L-J',''),
('C833','COCA´COLA QUART DE POBLET','L-J',''),
('C834','ESMALGLASS VILLARREAL','L-X',''),
('C835','HEINEKEN QUART DE POBLET','L-J',''),
('C836','ITACA POBLA TORNESA','L-X',''),
('C837','YOUNEXA VALL D''ALBA','L-X',''),
('C838','AMAZON ONDA','L-X',''),
('C850','BALLESOL PATERNA','L-J',''),
('C851','BALLESOL SERRERIA','L-J',''),
('C852','MAKRO SAD ALCIRA','M-V','Ruta A5'),
('C853','CHECKIN ALAQUAS','M-V',''),
('C854','CHECKIN CISCAR PICANYA','M-V',''),
('C900','COLEGIO FUENTEBLANCA MURCIA','M-J',''),
('C901','C. E. CONCERT. SEVERO OCHOA','M-J',''),
('C902','LAS CLARAS DE LA FLOTA','M-J',''),
('C903','LAS CLARAS DEL MAR MENOR','M-J',''),
('C904','LICEO FRANCES MURCIA','M-J',''),
('C905','AMAZON RMU1','M-J',''),
('C906','BALLESOL MURCIA','M-J',''),
('C907','RESIDENCIA HOGAR DE BETANIA','M-J',''),
('C908','CASTILLO ROSA PEÑAS','M-J',''),
('C909','CASTILLO EL ALJIBE SANTOMERA','M-J',''),
('C910','COLEGIO RINCON DE BONANZA','M-J',''),
('C911','CEIP VIRGEN DE MONSERRATE','M-J',''),
('C912','CEIP NUESTRA SEÑORA DEL PILAR','M-J',''),
('C913','ASPANIAS | FUTURE FOLLOW-UP OP','M-J',''),
('C914','EL CASTILLO H.P.M. ALMENARA','M-J',''),
('C915','EUROPA HOUSE','M-J',''),
('C916','BALLESOL VILLAJOYOSA','M-J',''),
('C917','MORENICA VILLENA','M-J',''),
('C918','CASTILLO LAS VIRTUDES','M-J',''),
('C919','BALLESOL VIA PARQUE SAN JUAN','M-J',''),
('C920','BAKOUR LA MANGA SPLASH','M-J',''),
('C921','PROMETEO MURCIA','M-J',''),
('C922','B&B CC THADER','M-J',''),
('C923','RESIDENCIA MURO ALCOI','M-J',''),
('C924','EL MOLINO ALBACETE','L-M-V',''),
('C925','6 HERMANOS ALBACETE','L-M-V',''),
('C926','EL VOLANTE ALBACETE','L-M-V',''),
('C927','LOS GABRIELES ALBACETE','L-M-V',''),
('C928','EL JUANITO ALBACETE','L-M-V',''),
('C929','LA FLOR DE LA MANCHA ALBACETE','L-M-V',''),
('C930','LA LAGUNA ALBACETE','L-M-V','')
on conflict (code) do update set
  name=excluded.name,
  days=excluded.days,
  route=excluded.route,
  updated_at=now();
