# Forms2 — Análise de Financiamento (recebimento de leads)

Landing page (formulário multi-etapas) que calcula uma estimativa de juros
abusivos e **salva o lead no Supabase** ao concluir — mesma ideia do Forms1.

## Setup local

1. Rode o schema no Supabase (mesmo projeto do Forms1):
   Dashboard → SQL Editor → cole o conteúdo de `supabase_schema.sql` → Run.
2. Crie o `config.js` a partir do modelo:
   ```
   copy config.example.js config.js   (Windows)
   cp   config.example.js config.js   (Linux/Mac)
   ```
   e preencha com a Project URL e a anon key (Project Settings → API).
3. Abra o `index.html` (HTML puro, sem dependências de framework).

## Deploy (Cloudflare Pages)

- Build command: `sh build.sh`
- Variáveis: `SUPABASE_URL` e `SUPABASE_ANON_KEY` (geram o `config.js` no build).

## Onde os leads ficam

Tabela `public.leads_financiamento`. Leitura só pelo painel do Supabase (RLS
permite apenas inserção pela anon key). Campos: nome, telefone, banco,
parcelas, valor_parcela, em_atraso, estimativa_abusiva.
