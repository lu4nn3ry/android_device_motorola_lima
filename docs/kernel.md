# Kernel - Documentação

## Candidatos Avaliados

| Fonte | Branch | Kernel Base | Status | Notas |
|-------|--------|-------------|--------|-------|
| [Jebaitedneko/android_kernel_motorola_lima](https://github.com/Jebaitedneko/android_kernel_motorola_lima) | `pie-9.0.0-release-pmd29` | Linux 4.x (Android Pie) | Candidato | Histórico extenso, GPLv2. Base sólida, mas pode precisar de atualizações para ROMs mais recentes. |
| [electimon/android_kernel_motorola_lima](https://github.com/electimon/android_kernel_motorola_lima) | `12` | Linux 4.x | Candidato a investigar | Branch nomeado "12", possivelmente mais atualizado. Requer auditoria detalhada. |

## Critérios de Avaliação
- [ ] Defconfig compatível com lima_32 (prioritário)
- [ ] Suporte a hardware correto (display, touchscreen, câmera, etc.)
- [ ] Drivers necessários presentes
- [ ] Device Tree/DTS adequado
- [ ] Toolchain compatível
- [ ] Estável para uso em ROM custom
- [ ] Sem regressões conhecidas

## Integração
Ao integrar, colocar em `kernel/motorola/lima/` ou referenciar via `manifest/`. Documentar:
- URL da fonte
- Branch exato
- Commit hash
- Toolchain utilizada
- Defconfig por variante
- Patches aplicados (`patches/kernel/`)

## Build Orientativo
```bash
export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-  # ajustar conforme toolchain
make <defconfig_variante>
make -j$(nproc)
```

## Notas
- **Prioridade:** Validar para lima_32 primeiro
- Comparação detalhada necessária antes de escolher
- Patches locais documentados
- Licença GPLv2 (Linux kernel)
