---
documento: GUIA_DEPLOY_PUBLICACAO.md
versao: 1.0
data: 2026-05-18
status: ★ resolução definitiva · mobile public full
---

# 🚀 Guia de Deploy · Painel Público SADM 56 BPM

> **Problema resolvido:** Drive app no celular renderiza HTML como texto e não navega entre arquivos.
> **Solução:** GitHub Pages · domínio público real · abre como webpage normal em qualquer navegador.

---

## ⚡ 5 minutos para publicar · 3 opções

### OPÇÃO A · ★ MAIS RÁPIDA · GitHub via gh CLI (1 comando)

**Pré-req:** instalar **GitHub CLI** uma vez · https://cli.github.com/

```bash
# 1) Login (apenas 1ª vez)
gh auth login

# 2) Deploy automático
deploy_gh_pages.bat
```

Pronto. URL final: `https://sadm-56bpm.github.io/painel/`

---

### OPÇÃO B · GitHub Web · sem CLI

1. Abra **https://github.com/new** logado como `sadm-56bpm`
2. **Repository name:** `painel`
3. **Public** · ✓
4. **NÃO** marque "Add a README"
5. Clique **Create repository**
6. Volte aqui e execute: `deploy_gh_pages.bat`
7. Após push, abra: **https://github.com/sadm-56bpm/painel/settings/pages**
8. **Source:** `Deploy from a branch` · **Branch:** `main` · **Folder:** `/ (root)` · **Save**
9. Aguarde 1-2 min · acesse `https://sadm-56bpm.github.io/painel/`

---

### OPÇÃO C · Netlify Drop · ainda mais simples (sem GitHub)

1. Abra **https://app.netlify.com/drop**
2. Arraste a pasta `_PUBLICACAO_GH_PAGES` inteira na zona de drop
3. URL gerada na hora · tipo `https://random-name-12345.netlify.app/`
4. Clique "Claim site" se quiser personalizar (opcional)

**Vantagem:** zero configuração, zero CLI, instantâneo.
**Desvantagem:** URL com nome random (pode personalizar depois grátis).

---

## URLs públicas finais (após deploy)

### Via GitHub Pages

```
https://sadm-56bpm.github.io/painel/               ← Hub
https://sadm-56bpm.github.io/painel/tv-mural.html  ← TV Mural
https://sadm-56bpm.github.io/painel/gestao.html    ← Gestão
https://sadm-56bpm.github.io/painel/operacional.html ← Operacional
```

### Via Netlify (alternativa)

```
https://[nome-escolhido].netlify.app/              ← Hub
https://[nome-escolhido].netlify.app/tv-mural.html ← TV Mural
...
```

---

## Por que isso resolve o problema do celular

| Aspecto | Drive (atual) | GitHub Pages (novo) |
|---|---|---|
| Abre no Drive app? | ❌ sim (renderiza como texto) | ✅ não · abre browser |
| JavaScript funciona? | ⚠ parcial em web preview | ✅ 100% |
| Navegação entre páginas? | ❌ leva ao Drive app | ✅ navega normalmente |
| Precisa de login? | ❌ sometimes | ✅ nunca |
| Domínio público real? | ❌ drive.google.com | ✅ github.io |
| HTTPS automático? | ✅ sim | ✅ sim |
| Custo? | R$ 0 | R$ 0 |

---

## Atualização dos painéis depois de publicar

Para atualizar conteúdo · edite o HTML local · re-execute o `.bat` · push automatico.

```bash
# atualizar 1 arquivo
git add tv-mural.html
git commit -m "update: TV Mural · novos KPIs"
git push
```

GitHub Pages re-deploya automaticamente em ~1 minuto.

---

## Conformidade institucional

- **DA-049** · GitHub é stack canônica (versionado + auditável)
- **DA-052** · publicação institucional autorizada
- **DA-066** · arquivos sanitizados (zero Claude/Anthropic)
- **DA-020/021** · zero PII · zero R$
- **Custo:** R$ 0,00 · GitHub Pages é gratuito para repos públicos

---

## Próximos passos · após URL pública gerada

1. **Atualizar comunicado WhatsApp** · trocar Drive URLs por GH Pages URLs
2. **Imprimir QR Code** apontando para `https://sadm-56bpm.github.io/painel/`
3. **TV física da sala SADM** · `02_iniciar_tv_mural_kiosque.bat` com nova URL
4. **Custom domain** (futuro · onda 29): apontar `painel.56bpm.pmmg.mg.gov.br` via DNS

---

> Resolução definitiva · Onda 28+ Mobile Public · 2026-05-18
