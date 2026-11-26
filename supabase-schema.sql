-- Nest Cafe database schema (run once in Supabase: SQL Editor > New query)

-- Table bookings: table reservations from the "Book a table" form
create table if not exists bookings (
  id uuid primary key default gen_random_uuid(),
  ref text unique not null,
  name text not null,
  phone text not null,
  booking_date date not null,
  booking_time time not null,
  guests int not null check (guests > 0),
  seating text,
  status text not null default 'requested',
  created_at timestamptz not null default now()
);

-- Table orders: food and drink orders with payment status
create table if not exists orders (
  id uuid primary key default gen_random_uuid(),
  order_no text unique not null,
  booking_ref text,
  name text not null,
  phone text not null,
  items jsonb not null,
  total_inr int not null check (total_inr >= 0),
  status text not null default 'pending_payment',
  created_at timestamptz not null default now()
);

-- Table stamps: loyalty stamp count per phone number
create table if not exists stamps (
  phone text primary key,
  count int not null default 0 check (count between 0 and 10),
  updated_at timestamptz not null default now()
);

-- Table waitlist: customers waiting for a table
create table if not exists waitlist (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone text not null,
  created_at timestamptz not null default now()
);

-- Table contacts: messages from the contact form
create table if not exists contacts (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text not null,
  message text not null,
  created_at timestamptz not null default now()
);

-- Row Level Security: the public website can only INSERT.
-- Nobody on the public site can read other customers' data.
alter table bookings enable row level security;
alter table orders enable row level security;
alter table waitlist enable row level security;
alter table contacts enable row level security;

create policy "public can add bookings" on bookings for insert to anon with check (true);
create policy "public can add orders" on orders for insert to anon with check (true);
create policy "public can join waitlist" on waitlist for insert to anon with check (true);
create policy "public can send contacts" on contacts for insert to anon with check (true);

-- Staff read and update happens from the Supabase dashboard (service role), not from the website.
