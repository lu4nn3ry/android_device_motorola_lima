# TODO - Motorola Lima Monorepo

## Status Atual
Estrutura reorganizada conforme convenções Android. Ainda **não pronta para compilação**. Faltam arquivos de herança e validação com firmware/ROM base.

**ROM Base (planejada):** hackiosx.dev/porting (a definir versão Android exata)

## Checklist da Próxima Etapa

| Ordem | Tarefa | Prioridade | Status |
|-------|--------|------------|--------|
| 1 | Criar/corrigir heranças - garantir `device/motorola/lima/device.mk` existe e referências corretas | Crítica | **Feito** - `device/motorola/lima/device.mk` criado |
| 2 | Corrigir `LOCAL_PATH` em `lima-common/common.mk` | Crítica | **Feito** - corrigido para `device/motorola/lima-common` |
| 3 | Validar `AndroidProducts.mk` e descoberta de produtos pelo build system (`lunch`) | Crítica | Pendente |
| 4 | Atualizar TODO.md e documentação antiga | Crítica | **Feito** - este arquivo atualizado |
| 5 | Definir ROM-base exata e versão Android (hackiosx.dev/porting) | Crítica | Pendente - confirmar versão |
| 6 | Obter firmware stock do Moto G8 Play (lima_32) | Crítica | **Feito** - `boot.img`, `dtb.img` e `dtbo.img` extraídos |
| 7 | Extrair propriedades e informações de partições/fstab/boot | Alta | **Feito** - `fstab.mt6771` e `recovery.fstab` integrados |
| 8 | Comparar e escolher fonte de kernel válida para a ROM base | Alta | Pendente |
| 9 | Preparar extração de vendor/blobs (lima_32 primeiro) | Alta | **Feito** - Dump completo de todas as 64 partições (incluindo `vendor_a.img` e `system_a.img`) extraído e verificado com SHA-256 |
| 10 | Validar VNDK/configs conforme versão Android da ROM base | Média | Pendente |
| 11 | Primeiro build do `lima_32` e correção progressiva | Média | Pendente |
| 12 | Suporte ao One Macro (`lima`) apenas após boot funcional do lima_32 | Baixa | Pendente |

## Problemas Conhecidos e Correções

### Críticos (corrigidos nesta iteração)
- [x] Estrutura reorganizada para `lima-common/`, `lima/`, `lima_32/`
- [x] Extraído e validado `recovery.fstab` e `fstab.mt6771` a partir do `boot.img` oficial
- [x] Configurado `TARGET_RECOVERY_FSTAB` em `device/motorola/lima_32/BoardConfig.mk`
- [x] Identificados offsets e parâmetros reais de boot: Base `0x40000000`, Header v2, Page 2048, Partition 32MB
- [x] Substituídos placeholders de fingerprint e build desc pelos valores reais (`QMDS30.47-33-5 7e278`)
- [x] Criado `device/motorola/lima/device.mk` (faltava)
- [x] Corrigido `LOCAL_PATH` em `device/motorola/lima-common/common.mk`

### Pendentes
- [ ] Validar descoberta de produtos (`lineage_lima_32`, `lineage_lima`) via `lunch`
- [ ] Definir configs VNDK conforme versão Android da ROM base (evitar `BOARD_VNDK_VERSION := current` genérico sem confirmação)
- [ ] Revisar `TARGET_CPU_VARIANT_RUNTIME` conforme plataforma/ROM

## Estrutura Atual (Correta)

```text
device/motorola/
├── lima-common/
│   ├── BoardConfigCommon.mk
│   ├── common.mk
│   └── AndroidProducts.mk
├── lima/
│   ├── AndroidProducts.mk  (opcional/validar)
│   ├── BoardConfig.mk
│   ├── device.mk
│   └── lineage_lima.mk
└── lima_32/
    ├── AndroidProducts.mk  (opcional/validar)
    ├── BoardConfig.mk
    ├── device.mk
    └── lineage_lima_32.mk
```

## Recomendação Principal
**Não começar pelo One Macro.** Primeiro fazer o `lima_32` inicializar uma ROM de teste com a ROM base escolhida (hackiosx.dev/porting). Depois extrair o que for realmente compartilhável.

**Objetivo:** Primeiro boot funcional do Moto G8 Play, não apenas compilação bem-sucedida.

## Limitações
Esta revisão foi feita inspecionando arquivos publicados. Problemas de configuração precisam ser confirmados no build system da ROM escolhida.
