@echo off
REM ═══════════════════════════════════════════════════════════════════════════
REM  Deploy GitHub Pages · SADM 56 BPM · Painel Mobile Público
REM  ═══════════════════════════════════════════════════════════════════════════
REM
REM  PRE-REQUISITOS:
REM  1. Git instalado (git-scm.com)
REM  2. GitHub CLI instalado (cli.github.com) OU repo criado manualmente
REM  3. Logado no GitHub: gh auth login
REM
REM  RESULTADO ESPERADO:
REM  URL canonica: https://sadm-56bpm.github.io/painel/
REM
REM  ═══════════════════════════════════════════════════════════════════════════

cd /d "C:\Users\filli\Desktop\SADM - 56 BPM\_PUBLICACAO_GH_PAGES"

echo.
echo ═══════════════════════════════════════════════════════════════
echo   SADM 56 BPM · Deploy GitHub Pages
echo ═══════════════════════════════════════════════════════════════
echo.
echo Diretorio: %CD%
echo.

REM Verificar git
where git >nul 2>nul
if errorlevel 1 (
  echo [ERRO] git nao encontrado. Instale Git for Windows e tente novamente.
  echo        Download: https://git-scm.com/download/win
  pause
  exit /b 1
)

REM Verificar gh CLI (opcional · cria repo automatico se disponivel)
where gh >nul 2>nul
set HAS_GH=0
if not errorlevel 1 set HAS_GH=1

REM Inicializar repo se necessario
if not exist ".git\config" (
  echo [INFO] Inicializando repositorio git...
  git init -b main
  git config user.email "sadm.56bpm@gmail.com"
  git config user.name "SADM 56 BPM"
)

REM Criar repo GitHub publico automaticamente se gh CLI disponivel
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  if "%HAS_GH%"=="1" (
    echo.
    echo [INFO] Criando repositorio publico GitHub via gh CLI...
    gh repo create sadm-56bpm/painel --public --source=. --remote=origin --description "Painel Institucional SADM 56 BPM · Mobile · Cloud-first · Workspace PMMG"
    if errorlevel 1 (
      echo [AVISO] Falhou criar via gh. Configurando remote manualmente.
      git remote add origin https://github.com/sadm-56bpm/painel.git
    )
  ) else (
    echo.
    echo [AVISO] gh CLI nao instalado.
    echo [ACAO] Crie manualmente o repo publico em https://github.com/new
    echo        Nome sugerido: painel
    echo        Owner: sadm-56bpm
    echo        Publico: SIM
    echo.
    set /p ANSWER="Repo criado? Pressione Enter para configurar remote... "
    git remote add origin https://github.com/sadm-56bpm/painel.git
  )
)

REM Adicionar arquivos
echo.
echo --- adicionando arquivos ---
git add -A
git diff --cached --stat

REM Commit
echo.
echo --- commit ---
git commit -m "deploy: painel mobile publico · onda 28+ · cloud-first Workspace PMMG"

REM Push
echo.
echo --- push origin main ---
git push -u origin main

if errorlevel 1 (
  echo.
  echo [ERRO] Push falhou. Verifique credenciais GitHub:
  echo        - PAT: https://github.com/settings/tokens
  echo        - Ou: gh auth login
  pause
  exit /b 1
)

REM Ativar GitHub Pages se gh disponivel
if "%HAS_GH%"=="1" (
  echo.
  echo --- ativando GitHub Pages ---
  gh api -X POST repos/sadm-56bpm/painel/pages -f source[branch]=main -f source[path]=/ 2>nul
  if errorlevel 1 (
    echo [AVISO] Ativacao via API falhou. Ative manualmente:
    echo        https://github.com/sadm-56bpm/painel/settings/pages
    echo        Source: Deploy from a branch · Branch: main · Folder: / (root)
  ) else (
    echo [OK] GitHub Pages ativado.
  )
) else (
  echo.
  echo --- ATIVAR GITHUB PAGES MANUALMENTE ---
  echo 1. Abra: https://github.com/sadm-56bpm/painel/settings/pages
  echo 2. Source: Deploy from a branch
  echo 3. Branch: main · Folder: / (root)
  echo 4. Save
  echo 5. Aguarde 1-2 minutos para deploy
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo   DEPLOY CONCLUIDO
echo ═══════════════════════════════════════════════════════════════
echo.
echo URL canonica:
echo   https://sadm-56bpm.github.io/painel/
echo.
echo Paginas:
echo   /              ^(Hub Central^)
echo   /tv-mural.html ^(TV Mural^)
echo   /gestao.html   ^(Gestao Estrategica^)
echo   /operacional.html ^(Operacional Live^)
echo.
echo ═══════════════════════════════════════════════════════════════
pause
