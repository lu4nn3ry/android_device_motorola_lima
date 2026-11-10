# TODO - Motorola Lima Monorepo

## Status Atual
Estrutura organizada, mas **não pronta para compilação**. É um esqueleto inicial. Necessita reorganização e preenchimento com dados do firmware oficial.

## Ordem de Correção (Recomendada)

| Ordem | Tarefa | Prioridade | Status |
|-------|--------|------------|--------|
| 1 | **Reorganizar estrutura da Device Tree** - Mover para `device/motorola/lima/`, `lima_32/`, `lima-common/` conforme convenção Android | Crítica | Pendente |
| 2 | **Corrigir caminhos e referências do BoardConfig** - Remover `TARGET_RECOVERY_FSTAB` até ter fstab validado; usar paths explícitos por variante | Crítica | Pendente |
| 3 | **Obter firmware stock do Moto G8 Play (lima_32)** - Identificar partições, fstab, fingerprint, propriedades, versão Android | Crítica | Pendente |
| 4 | **Extrair informações de partições e boot** - Validar tamanho partições, DTB/DTBO, cmdline, etc. | Alta | Pendente |
| 5 | **Comparar fontes de kernel** - Avaliar Jebaitedneko (pie-9.0.0) vs electimon (branch 12); escolher com justificativa | Alta | Pendente |
| 6 | **Preparar extração de vendor** - Criar/adaptar `extract-files.sh`, `setup-makefiles.sh`, mapear blobs necessários | Alta | Pendente |
| 7 | **Preencher fingerprint e build description** - Usar valores reais do firmware do aparelho, NUNCA inventar | Média | Pendente |
| 8 | **Validar recovery/boot** - Testar montagem, boot, descriptografia se aplicável | Média | Pendente |
| 9 | **Primeiro build (lima_32)** - Compilar e corrigir erros progressivamente | Média | Pendente |
| 10 | **Suporte ao One Macro (lima)** - Apenas após lima_32 inicializar ROM de teste; extrair apenas o realmente compartilhável | Baixa | Pendente |

## Pontos Críticos Identificados

### 1. Descoberta de BoardConfig
- **Problema**: `PRODUCT_DEVICE := lima_32` mas estrutura atual pode não ser reconhecida corretamente pelo build system
- **Solução**: Reorganizar para que cada variante tenha seu próprio diretório em `device/motorola/` com nomes reconhecíveis

### 2. TARGET_RECOVERY_FSTAB
- **Problema**: Definido em `BoardConfigCommon.mk` sem arquivo `recovery.fstab` existir, usando `$(LOCAL_PATH)` de forma insegura
- **Solução**: Remover até ter fstab validado. Definir por variante com caminho explícito quando necessário

### 3. Fingerprint placeholders
- **Problema**: Valores `XX` placeholders em `lineage_lima_32.mk`
- **Solução**: Extrair do firmware oficial do aparelho (ex: `lima_32_retail-user 10 QMDS30.47-33-5`)

### 4. Documentação ausente
- **Problema**: README referencia `docs/extract-blobs.md` e `docs/kernel.md` que não existem
- **Solução**: Criar estes arquivos ou corrigir referências

### 5. Configurações compartilhadas
- **Problema**: Arquitetura/CPU/plataforma em comum sem validação entre variantes
- **Solução**: Só compartilhar após comprovação. Kernel, partições, recovery melhor por variante ou com justificativa documentada

## Estrutura Alvo Recomendada

```text
device/motorola/
├── lima-common/
│   ├── BoardConfigCommon.mk
│   ├── common.mk
│   └── ...
├── lima/
│   ├── AndroidProducts.mk  (se necessário)
│   ├── BoardConfig.mk
│   ├── device.mk
│   └── lineage_lima.mk
└── lima_32/
    ├── AndroidProducts.mk
    ├── BoardConfig.mk
    ├── device.mk
    └── lineage_lima_32.mk
```

**Nota:** Ajustar todos os caminhos de herança ao reorganizar.

## Recomendação Principal
**Não começar pelo One Macro.** Primeiro fazer o `lima_32` inicializar uma ROM de teste. Depois extrair o que for realmente compartilhável entre variantes.

**Objetivo:** Primeiro boot funcional do Moto G8 Play, não apenas compilação bem-sucedida.

## Limitações
Esta revisão foi feita inspecionando arquivos publicados. Problemas de configuração precisam ser confirmados no build system da ROM escolhida.
