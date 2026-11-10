# android_device_motorola_lima

Monorepo unificado para desenvolvimento de ROMs Android para a família Motorola Lima, com foco prioritário no **Moto G8 Play (`lima_32`)** e suporte planejado ao **Motorola One Macro (`lima`)**.

## Aparelhos suportados

| Dispositivo | Codinome | Status | Notas |
|-------------|----------|--------|-------|
| Motorola Moto G8 Play | `lima_32` | **Primário - Foco de desenvolvimento** | Prioridade máxima. Deve permanecer estável. |
| Motorola One Macro | `lima` | **Planejado / Experimental** | Suporte sem comprometer a estabilidade do `lima_32`. Configurações não compartilhadas entre variantes sem comprovação. |

## Características (base comum Lima)
- SoC: Mediatek Helio P70 (MT6771)
- Arquitetura: ARM64
- Família: Motorola Lima

## Estrutura do diretório

```text
android_device_motorola_lima/
├── device/
│   └── motorola/
│       ├── lima-common/      # Configurações compartilhadas (apenas se comprovadamente idênticas)
│       │   ├── BoardConfigCommon.mk
│       │   ├── common.mk
│       │   └── AndroidProducts.mk
│       ├── lima/            # Motorola One Macro (suporte planejado)
│       │   ├── BoardConfig.mk
│       │   ├── device.mk
│       │   └── lineage_lima.mk
│       └── lima_32/         # Moto G8 Play (PRIORITÁRIO)
│           ├── BoardConfig.mk
│           ├── device.mk
│           └── lineage_lima_32.mk
├── kernel/
│   └── motorola/
│       └── lima/
├── vendor/
│   └── motorola/
│       └── lima/
├── recovery/
│   └── twrp/
├── patches/
│   ├── device/
│   ├── kernel/
│   └── frameworks/
├── manifest/
├── docs/
└── README.md
```

## Princípios de organização

- **Separação por variante**: Cada variante tem seu diretório próprio sob `device/motorola/`. Código compartilhado apenas quando comprovadamente compatível e justificado.
- **TWRP isolado**: A configuração de recovery fica em `recovery/twrp/`, separada da configuração principal da ROM. Uma tree TWRP não é tratada como device tree completa de ROM.
- **Sem submódulos Git**: Componentes necessários são incorporados diretamente ao monorepo quando viável, preservando histórico original quando possível.
- **Foco em lima_32**: Todas as mudanças devem priorizar estabilidade do Moto G8 Play. Suporte a One Macro não deve introduzir regressões.
- **Placeholders identificados**: Valores como fingerprint/build desc são placeholders - devem ser extraídos do firmware oficial.

## Dependências

Para build AOSP/ROM baseada em AOSP, são necessárias as dependências padrão:
- [repo](https://source.android.com/docs/setup/download#installing-repo)
- Toolchain apropriada para ARM64/MediaTek
- Pacotes de build do AOSP para sua distro Linux
- Kernel source compatível com Lima (ver seção Kernel)

## Sincronização

### Opção 1: Monorepo único (componentes incorporados)
Se os componentes foram incorporados diretamente neste repositório, basta clonar:
```bash
git clone https://github.com/lu4nn3ry/android_device_motorola_lima.git
```

### Opção 2: Usando `repo` com manifest
Caso haja dependências externas necessárias para sincronização AOSP, utilize manifests em `manifest/`.
```bash
mkdir -p ~/android/rom && cd ~/android/rom
repo init -u <manifest-url> -b <branch>
repo sync -c -j$(nproc) --force-sync --no-clone-bundle
```
Documente branch/revisão exata no `manifest/` e em `docs/`.

## Extração de blobs proprietários

**ATENÇÃO**: Não redistribua blobs proprietários sem autorização. Blobs devem ser extraídos do firmware original do seu aparelho.

Consulte [docs/extract-blobs.md](docs/extract-blobs.md) para o procedimento completo.

## Compilação do kernel
Consulte [docs/kernel.md](docs/kernel.md) e `kernel/motorola/lima/README.md` para fontes, defconfig, toolchain e patches.

## Build da ROM (orientativo)
> **Nota:** Não assumimos que a ROM compila. Sem build verificado. Corrija estrutura e obtenha dados do firmware antes de tentar compilar.

Orientativo genérico:
```bash
source build/envsetup.sh
# Exemplo para lima_32 (prioritário)
lunch lineage_lima_32-userdebug
mka bacon  # ou target específico da ROM
```

## Limitações conhecidas

- **Estrutura reestruturada**: Nova organização seguindo convenções Android; caminhos de herança atualizados.
- **Sem fstab/recovery validado**: `TARGET_RECOVERY_FSTAB` não definido em comum; adicionar por variante quando validado.
- **Placeholders**: Fingerprint/build desc são placeholders - obter do firmware stock.
- **Repos auditados vazios/desatualizados**: Alguns repositórios investigados estão vazios ou desatualizados. Nenhum código foi importado cegamente.
- **Diferenças lima vs lima_32**: Não há comprovação total de paridade de hardware. Configurações não são compartilhadas por padrão.
- **TWRP separado**: Trees TWRP investigadas servem como referência, mas não substituem device tree de ROM.
- **Blobs necessários**: Vendor proprietário deve vir do firmware do usuário.
- **Sem build verificado**: Build não foi executado; priorize obter firmware e corrigir descobertas antes de compilar.

## Tabela de auditoria de repositórios

| Repositório | Branch | Commit | Licença | Finalidade | Compatibilidade |
|-------------|--------|--------|---------|------------|-----------------|
| [mototek/device_motorola_lima](https://github.com/mototek/device_motorola_lima) | N/A (vazio) | N/A | Desconhecida | Device tree (referência) | **Não utilizável** - repositório vazio no momento da auditoria |
| [mototek/recovery_motorola_lima](https://github.com/mototek/recovery_motorola_lima) | `lineage-18.1` | Verificar no repo | Desconhecida | TWRP/Recovery (referência) | **Referência apenas** - TWRP tree; útil para fstab/partições/boot/recovery. Não é device tree de ROM completa. |
| [ayham-1/android_device_motorola_lima_twrp](https://github.com/ayham-1/android_device_motorola_lima_twrp) | `master` | Verificar no repo | Desconhecida | TWRP (referência, fork) | **Referência apenas** - contém fstab/recovery config; revisar diferenças. |
| [twrpdtgen/android_device_motorola_lima](https://github.com/twrpdtgen/android_device_motorola_lima) | `lima_retail-user-10-QMD30.47-19-36205-release-keys` | Verificar no repo | Apache-2.0 | Device tree gerado (referência) | **Referência apenas** - gerado automaticamente; validar. Útil para scripts extract-files/setup-makefiles. |
| [Jebaitedneko/android_kernel_motorola_lima](https://github.com/Jebaitedneko/android_kernel_motorola_lima) | `pie-9.0.0-release-pmd29` | Verificar no repo | GPLv2 | Kernel source (referência) | **Candidato** - base Android Pie/Linux 4.x. Avaliar para lima_32. |
| [electimon/android_kernel_motorola_lima](https://github.com/electimon/android_kernel_motorola_lima) | `12` | Verificar no repo | GPLv2 | Kernel source (referência) | **Candidato** - branch 12, requer comparação detalhada com Jebaitedneko. |

## Ver também
- [TODO.md](TODO.md) - Plano de correção e próximos passos
- [docs/compatibility.md](docs/compatibility.md) - Relatório de compatibilidade
- [docs/audit.md](docs/audit.md) - Auditoria detalhada
- [docs/extract-blobs.md](docs/extract-blobs.md) - Extração de blobs
- [docs/kernel.md](docs/kernel.md) - Kernel

## Licença
Este monorepo segue as licenças dos componentes originais. Componentes de terceiros mantêm suas licenças respectivas.
