# 🎭 FACEHUGGER — SETUP ATIVO: {{PROJECT_NAME}}

> Este projeto está em configuração inicial.
> **Execute cada fase em ordem e relate o progresso.**
> Este bloco será removido ao final do setup pela Fase 3.

---

## 📋 Fase 1: Análise do Código Fonte

Explore o projeto e gere conhecimento sobre ele antes de configurar.

### 1A. Estrutura
- [ ] Liste os diretórios e arquivos de configuração principais
- [ ] Identifique as ferramentas usadas (Nginx, Docker, Terraform, Ansible, etc.)
- [ ] Mapeie os serviços upstream e downstream

### 1B. Domínio
- [ ] Identifique o propósito do serviço de infra (proxy, gateway, monitoria, CI/CD)
- [ ] Mapeie os fluxos de tráfego e balanceamento
- [ ] Gere/atualize `CONTEXT.md` com a terminologia REAL da infraestrutura

### 1C. Arquitetura
- [ ] Identifique o padrão de implantação (single server, cluster, cloud)
- [ ] Mapeie dependências entre serviços
- [ ] Verifique health checks, monitoring e alertas existentes

---

## 📋 Fase 2: Configuração

### 2A. Regras de Engenharia

Aplique estas regras ao projeto (já incorporadas neste documento):

{{INJECTED_RULES}}

### 2B. Skills do Matt Pocock

Skills recomendadas para este projeto:

{{AGENT_SKILLS_BLOCK}}

### 2C. Issue Tracker

Configure o issue tracker conforme o manifesto do projeto:

{{TRACKER_CONFIG}}

### 2D. MCP Servers

Baseado na análise da Fase 1, identifique e configure MCP Servers para:
- Provedores de cloud (AWS, GCP, Azure)
- Ferramentas de orquestração (Docker, Kubernetes)
- Monitoramento (Datadog, Grafana, Prometheus)

---

## 📋 Fase 3: Finalização

- [ ] Remova **este bloco de setup** do `CLAUDE.md` (tudo entre o primeiro `---` e o último `---`, inclusive)
- [ ] Resuma o que foi configurado em um parágrafo
- [ ] Aponte os próximos passos recomendados

{{FOOTER}}
