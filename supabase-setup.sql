-- MaxiTech database setup. Run ONCE in Supabase > SQL Editor.
-- STEP 1: change the email below to YOUR owner login email, then run everything.

create or replace function public.is_owner() returns boolean
language sql stable as $$ select (auth.jwt()->>'email') = 'CHANGE-ME@example.com' $$;

create table if not exists public.products(id text primary key, data jsonb not null, created_at timestamptz default now());
create table if not exists public.orders(id bigint generated always as identity primary key, data jsonb not null, created_at timestamptz default now());
create table if not exists public.events(id bigint generated always as identity primary key, data jsonb not null, created_at timestamptz default now());

alter table public.products enable row level security;
alter table public.orders   enable row level security;
alter table public.events   enable row level security;

-- Everyone can see products; only the owner can change them
create policy "products read"   on public.products for select to anon, authenticated using (true);
create policy "products insert" on public.products for insert to authenticated with check (public.is_owner());
create policy "products update" on public.products for update to authenticated using (public.is_owner()) with check (public.is_owner());
create policy "products delete" on public.products for delete to authenticated using (public.is_owner());

-- Customers can send an order / a visit; only the owner can read them
create policy "orders add"  on public.orders for insert to anon, authenticated with check (true);
create policy "orders read" on public.orders for select to authenticated using (public.is_owner());
create policy "events add"  on public.events for insert to anon, authenticated with check (true);
create policy "events read" on public.events for select to authenticated using (public.is_owner());
