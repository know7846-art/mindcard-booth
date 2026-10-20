-- Supabase SQL Editor에서 이 전체를 한 번 실행하세요.

create table mindcard_log (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  card_id text not null,
  card_title text not null,
  type_key text not null,
  type_name text not null
);

alter table mindcard_log enable row level security;

-- 참가자 화면이 익명으로 기록을 쓸 수 있도록 허용
create policy "public can insert" on mindcard_log
  for insert to anon
  with check (true);

-- 관리자 화면이 익명으로 기록을 읽을 수 있도록 허용
create policy "public can read" on mindcard_log
  for select to anon
  using (true);
