# Quick Start

## Clonagem
```bash
git clone <url-do-monorepo> android_device_motorola_lima
```

## Estrutura
Veja `README.md` para visão geral completa.

## Para desenvolvimento
1. **Definir base ROM** - Escolha ROM AOSP/derivada
2. **Kernel** - Decida fonte e integre em `kernel/motorola/lima/` ou referencie via manifest
3. **Blobs** - Extraia do firmware do seu aparelho para `vendor/motorola/lima/`
4. **Preencher configs** - Complete BoardConfig/device.mk para variante alvo (comece por `lima_32`)
5. **Recovery** - Mantenha TWRP em `recovery/twrp/` separado
6. **Build** - Siga instruções da ROM base

## Notas importantes
- **Prioridade:** Moto G8 Play (`lima_32`)
- **Sem submódulos** - Tudo incorporado ou via repo manifest
- **Sem blobs commitados** - Estrutura apenas
- **Sem afirmação de build** - Validar em ambiente real
- **Separação rígida** entre `lima` e `lima_32`
