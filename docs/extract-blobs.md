# Extração de Blobs Proprietários

## Importante
**NUNCA** commite blobs proprietários neste repositório. Extraia apenas do firmware oficial do seu aparelho.

## Pré-requisitos
- Firmware stock da **variante correta** (lima_32 para Moto G8 Play, ou lima para One Macro)
- Scripts `extract-files.sh` e `setup-makefiles.sh`
- Ambiente Linux com ferramentas necessárias

## Estrutura
```
vendor/motorola/lima/
├── lima/       # Blobs específicos do One Macro
├── lima_32/    # Blobs específicos do Moto G8 Play (prioritário)
├── common/     # Apenas se comprovadamente idênticos entre variantes
└── proprietary-files.txt
```

## Procedimento
1. Obtenha o firmware oficial para sua variante exata
2. Extraia o firmware para um diretório (system, vendor, etc.)
3. Configure os scripts de extração apontando para o dump
4. Execute `./extract-files.sh <caminho-do-firmware>`
5. Execute `./setup-makefiles.sh` para gerar makefiles
6. Revise `proprietary-files.txt` - mantenha apenas o necessário
7. Verifique se algum blob pode ser compartilhado entre variantes (comprovar!)

## Dicas
- Comece pelo **lima_32** primeiro
- Compare checksums/hashes entre variantes antes de mover para `common/`
- Documente blobs específicos de cada variante
- Siga os termos de uso do fabricante
