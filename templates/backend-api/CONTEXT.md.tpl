# {{PROJECT_NAME}} — Contexto

> Linguagem ubíqua do domínio. Mantenha atualizado conforme o projeto evolui.

## Linguagem

**Endpoint**:
Um ponto de entrada da API que expõe uma funcionalidade específica.
_Avoid_: Rota, URL

**Service**:
Uma classe que contém lógica de negócio orquestrando repositórios e outras dependências.
_Avoid_: Helper, Utils

**Repository**:
Uma abstração sobre a camada de dados que provê uma interface de coleção para entidades.
_Avoid_: DAO (prefira Repository)

**DTO** (Data Transfer Object):
Um objeto que carrega dados entre processos, tipicamente na camada de controller.
_Avoid_: Entity exposta, modelo bruto

## Regras

- Adicione termos específicos do domínio do projeto
- Evite conceitos genéricos de programação
- Seja opinativo: escolha o termo correto e liste sinônimos a evitar

---

_Gerado por 🎭 Facehugger. Preencha os termos do seu domínio._
