# Kernel - Motorola Lima

## Fontes avaliadas

| Fonte | Branch | Notas |
|-------|--------|-------|
| [Jebaitedneko/android_kernel_motorola_lima](https://github.com/Jebaitedneko/android_kernel_motorola_lima) | `pie-9.0.0-release-pmd29` | Kernel base Android 9 (Pie), Linux 4.x. Histórico extenso. Candidato para referência; pode precisar de atualizações/port para ROMs mais recentes. |
| [electimon/android_kernel_motorola_lima](https://github.com/electimon/android_kernel_motorola_lima) | `12` | Branch "12" - parece direcionado para Android 12. Requer auditoria detalhada (commits, defconfig, drivers, DT). Potencialmente mais atualizado. |

## Recomendação

**Ação necessária:** Comparar ambas as fontes. Avaliar:
- Defconfigs para lima/lima_32
- Device Tree / DTS
- Suporte a drivers necessários
- Compatibilidade com target ROM
- Toolchain requerida

**Prioridade:** Garantir compatibilidade com **Moto G8 Play (lima_32)** primeiro.

## Estrutura esperada

Ao integrar o kernel, colocar em:
```
kernel/motorola/lima/
├── arch/
├── ...
├── defconfig/ (ou referências)
└── README.md (atualizar com branch/commit exato)
```

## Build (orientativo)
```bash
cd kernel/motorola/lima
# usar defconfig apropriado
make ARCH=arm64 <variant>_defconfig
make ARCH=arm64 -j$(nproc)
```

## Patches
Patches próprios vão em `patches/kernel/` com documentação.

## Licença
Linux kernel é GPLv2. Verificar COPYING no source.
