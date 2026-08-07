-- ============================================================
-- LandOfDraft — مخطط قاعدة بيانات Supabase
-- نفّذ هذا الملف أولاً، ثم نفّذ seed_data.sql بعده
-- ============================================================

create table heroes (
  slug        text primary key,
  ar          text not null,
  role        text not null,
  lane        text not null,
  tier        text,
  img         text,
  pop         integer not null default 34,
  overview    text,
  notes       jsonb,
  combos      jsonb,
  skill_order jsonb,
  build       jsonb
);

create table counters (
  id      bigserial primary key,
  subject text not null references heroes(slug) on delete cascade,
  counter text not null references heroes(slug) on delete cascade,
  score   integer not null,
  delta   numeric,
  reason  text not null
);

-- القراءة عامة للجميع (الموقع نفسه يعرضها للزوار بلا تسجيل دخول)
alter table heroes   enable row level security;
alter table counters enable row level security;

create policy "public_read_heroes"   on heroes   for select using (true);
create policy "public_read_counters" on counters for select using (true);

-- الكتابة (إضافة/تعديل/حذف) مسموحة فقط لمستخدم مسجَّل دخول فعلياً عبر Supabase Auth
-- هذا هو الفرق الجوهري عن لوحة الإدارة السابقة: لا أحد يستطيع الكتابة بمجرّد معرفة
-- كلمة سر مكتوبة في الكود — يحتاج حساباً حقيقياً تتحقّق منه Supabase على خادمها.
create policy "auth_write_heroes" on heroes
  for all to authenticated using (true) with check (true);
create policy "auth_write_counters" on counters
  for all to authenticated using (true) with check (true);
