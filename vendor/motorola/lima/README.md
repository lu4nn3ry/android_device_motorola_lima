# Vendor - Motorola Lima

## Estrutura
```
vendor/motorola/lima/
├── lima/      # Blobs específicos do Motorola One Macro (se necessário)
├── lima_32/   # Blobs específicos do Moto G8 Play (PRIORITÁRIO)
├── common/    # Blobs compartilhados APENAS se comprovadamente iguais
└── proprietary-files.txt  # Gerado pelos scripts de extração
```

## Extração de blobs

**NUNCA** commite blobs proprietários neste repositório.

Scripts recomendados: `extract-files.sh` e `setup-makefiles.sh`. Podem ser baseados nos padrões encontrados em referências (ex. twrpdtgen tree) mas devem ser adaptados e validados.

### Procedimento
1. Obtenha firmware oficial para a **variante correta** (lima ou lima_32)
2. Configure scripts apontando para o dump do firmware
3. Execute extração
4. Revise `proprietary-files.txt`
5. Adicione apenas blobs necessários
6. Teste build

### Notas
- Verificar se blobs são compartilháveis entre lima/lima_32 antes de mover para `common/`
- Alguns blobs podem ter diferenças por variante
- Siga as licenças e termos do fabricante
