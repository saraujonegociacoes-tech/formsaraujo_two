-- ============================================================
-- Tabela de leads da landing page "Análise de Financiamento"
-- (formulário multi-etapas — Forms2)
-- Rode isto no Supabase: Dashboard -> SQL Editor -> New query
--
-- Use o MESMO projeto Supabase do Forms1.
-- ============================================================

create table if not exists public.leads_financiamento (
  id                  uuid          primary key default gen_random_uuid(),
  created_at          timestamptz   not null    default now(),
  nome                text          not null,
  telefone            text          not null,
  banco               text,
  parcelas            integer,
  valor_parcela       numeric(12,2),
  em_atraso           boolean,
  estimativa_abusiva  numeric(14,2)
);

-- Habilita Row Level Security (sem isso, ninguém acessa nada)
alter table public.leads_financiamento enable row level security;

-- Permite que o público (anon key, usada no navegador) APENAS insira.
-- Não permite ler/editar/excluir — os leads ficam protegidos.
-- A leitura você faz pelo painel do Supabase ou com a service_role key.
create policy "leads_financiamento_insert_anon"
  on public.leads_financiamento
  for insert
  to anon
  with check (true);
