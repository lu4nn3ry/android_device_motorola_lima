# Recovery (TWRP) - Separado da ROM

TWRP é mantido **separado** da configuração principal da ROM. 

## Referências auditadas
- [mototek/recovery_motorola_lima (lineage-18.1)](https://github.com/mototek/recovery_motorola_lima) - TWRP tree com foco em Lima; útil para partições, fstab, boot/recovery.
- [ayham-1/android_device_motorola_lima_twrp (fork)](https://github.com/ayham-1/android_device_motorola_lima_twrp) - Fork com variações (custombootimg.mk, fstab antigo/novo).
- [twrpdtgen/android_device_motorola_lima](https://github.com/twrpdtgen/android_device_motorola_lima) - Gerado automaticamente; bom ponto de partida para informações de partições/DTB, mas validar.

## O que aproveitar
- Partições
- `recovery.fstab`
- Configurações de boot/recovery
- DTB/DTBO
- Propriedades específicas

## Importante
- **Não** tratar tree TWRP como device tree completa de ROM
- Manter em `recovery/twrp/` isolado
- Validar diferenças entre lima e lima_32 (se TWRP for unificado, precisa comprovação)

## Estrutura
```
recovery/twrp/
├── lima/      # TWRP específico One Macro (se necessário)
└── lima_32/   # TWRP específico Moto G8 Play (prioritário)
```
*(Inicialmente vazio - incorporar apenas após revisão e validação.)*
