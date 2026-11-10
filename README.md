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
├── device/              # Device trees (comum + por variante)
│   └── motorola/
│       └── lima/
│           ├── BoardConfigCommon.mk
│           ├── device.mk
│           ├── AndroidProducts.mk
│           ├── common/      # Configurações compartilhadas (validar compatibilidade)
│           ├── lima/        # Específico Motorola One Macro
│           └── lima_32/     # Específico Moto G8 Play (PRIORITÁRIO)
├── kernel/              # Kernel source ou documentação de dependência
│   └── motorola/
│       └── lima/
├── vendor/              # Blobs proprietários (estrutura para extração)
│   └── motorola/
│       └── lima/
├── recovery/            # Recovery separado (TWRP)
│   └── twrp/
├── patches/             # Patches locais organizados por componente
│   ├── device/
│   ├── kernel/
│   └── frameworks/
├── manifest/            # Manifests XML para repo (se necessário)
└── docs/                # Documentação técnica adicional
```

## Princípios de organização

- **Separação por variante**: Configurações específicas ficam em `device/motorola/lima/lima/` ou `lima_32/`. Código compartilhado apenas quando comprovadamente compatível.
- **TWRP isolado**: A configuração de recovery fica em `recovery/twrp/`, separada da configuração principal da ROM. Uma tree TWRP não é tratada como device tree completa de ROM.
- **Sem submódulos Git**: Componentes necessários são incorporados diretamente ao monorepo quando viável, preservando histórico original quando possível.
- **Foco em lima_32**: Todas as mudanças devem priorizar estabilidade do Moto G8 Play. Suporte a One Macro não deve introduzir regressões.

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
git clone <repo-url> android_device_motorola_lima
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

### Estrutura preparada
- `vendor/motorola/lima/` - destino dos blobs
- Scripts de extração devem ser colocados conforme necessário (ex: `extract-files.sh`, `setup-makefiles.sh`)

### Procedimento (genérico)
1. Obtenha firmware oficial do seu dispositivo (mesma variante - lima ou lima_32)
2. Copie os scripts de extração para o local apropriado ou use os fornecidos
3. Execute a extração apontando para o dump/firmware
4. Verifique `proprietary-files.txt`
5. Nunca commite blobs proprietários neste repositório público

Consulte `docs/extract-blobs.md` para detalhes específicos assim que disponíveis.

## Compilação do kernel
Consulte `kernel/motorola/lima/README.md` e `docs/kernel.md` para:
- Fonte do kernel recomendada (com justificativa)
- Branch/commit
- Toolchain
- Defconfig por variante
- Patches locais em `patches/kernel/`

## Build da ROM (orientativo)
> **Nota:** Não assumimos que a ROM compila. Verificações reais de build não foram executadas neste estado.

Orientativo genérico:
```bash
source build/envsetup.sh
# Exemplo para lima_32 (prioritário)
lunch <rom>_lima_32-<buildtype>
mka bacon  # ou target específico da ROM
```
Os targets exatos dependem da ROM base utilizada e devem ser validados.

## Limitações conhecidas

- **Repositórios auditados vazios/desatualizados**: Alguns repositórios investigados estão vazios ou desatualizados. Nenhum código foi importado cegamente.
- **Diferenças lima vs lima_32**: Não há comprovação total de paridade de hardware. Configurações não são compartilhadas por padrão.
- **TWRP separado**: Trees TWRP investigadas servem como referência (partições/fstab/boot/recovery/DTB/DTBO/propriedades), mas não substituem device tree de ROM.
- **Blobs necessários**: Vendor proprietário deve vir do firmware do usuário.
- **Sem build verificado**: Build não foi executado; caminhos/referências precisam validação em ambiente AOSP real.

## Tabela de auditoria de repositórios

| Repositório | Branch | Commit | Licença | Finalidade | Compatibilidade |
|-------------|--------|--------|---------|------------|-----------------|
| [mototek/device_motorola_lima](https://github.com/mototek/device_motorola_lima) | N/A (vazio) | N/A | Desconhecida | Device tree (referência) | **Não utilizável** - repositório vazio no momento da auditoria |
| [mototek/recovery_motorola_lima](https://github.com/mototek/recovery_motorola_lima) | `lineage-18.1` | Verificar no repo | Desconhecida | TWRP/Recovery (referência) | **Referência apenas** - TWRP tree; útil para fstab/partições/boot/recovery. Não é device tree de ROM completa. |
| [realaltffour/android_device_motorola_lima_twrp](https://github.com/ayham-1/android_device_motorola_lima_twrp) (fork ayham-1) | `master` | Verificar no repo | Desconhecida | TWRP (referência, fork) | **Referência apenas** - contém fstab/recovery config; revisar diferenças com mototek antes de usar. |
| [twrpdtgen/android_device_motorola_lima](https://github.com/twrpdtgen/android_device_motorola_lima) | `lima_retail-user-10-QMD30.47-19-36205-release-keys` | Verificar no repo | Apache-2.0 (header presente) | Device tree gerado por twrpdtgen (referência) | **Referência apenas** - gerado automaticamente; validar contra hardware real. Pode conter informações úteis. |
| [Jebaitedneko/android_kernel_motorola_lima](https://github.com/Jebaitedneko/android_kernel_motorola_lima) | `pie-9.0.0-release-pmd29` | ~586k+ commits no histórico (kernel base) | GPLv2 (COPYING Linux kernel) | Kernel source (MediaTek/Linux 4.x base) | **Candidato** - kernel base Android Pie para Lima. Precisa avaliação para ROMs modernas; verificar defconfig, DT, drivers. |
| [electimon/android_kernel_motorola_lima](https://github.com/electimon/android_kernel_motorola_lima) | `12` | Verificar no repo | GPLv2 | Kernel source (branch 12) | **Candidato a investigar** - branch mais recente nomeada; comparar com Jebaitedneko (commits, patches, defconfig). Requer auditoria detalhada. |

> *Licenças/commits devem ser verificados diretamente nos repositórios no momento do uso. Esta tabela reflete o estado observado na auditoria.*

## Contribuição e manutenção

- Mantenha alterações isoladas por variante quando possível.
- Documente origem de qualquer código incorporado (URL, branch, commit, licença).
- Não adicione blobs proprietários.
- Priorize `lima_32`. Testes reais são necessários antes de declarar compatibilidade.

## Licença
Este monorepo segue as licenças dos componentes originais. Componentes de terceiros mantêm suas licenças respectivas. Verifique `COPYING`, headers e licenças em cada subdiretório.
