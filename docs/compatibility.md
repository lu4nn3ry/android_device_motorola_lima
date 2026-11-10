# Relatório de Compatibilidade e Pendências

## Status por componente

| Componente | Status | Observações |
|------------|--------|-------------|
| Device Tree (estrutura) | **Criado** | Estrutura monorepo organizada com separação comum/variante. Arquivos Makefiles são esqueletos - requerem valores reais. |
| Device Tree (conteúdo real) | **Pendente** | Nenhum código dos repos auditados foi incorporado cegamente. Requer extração/validação de informações úteis. |
| Kernel | **A investigar** | Dois candidatos (Jebaitedneko pie-9.0.0, electimon branch 12). Comparação necessária. Foco em lima_32. |
| Vendor/Blobs | **Preparado (estrutura)** | Scripts e estrutura prontos; blobs devem vir do firmware do usuário. Não redistribuir. |
| Recovery (TWRP) | **Separado/Referenciado** | 3 árvores auditadas como referência. Úteis para partições/fstab. Não integradas como ROM DT. |
| Manifests | **Preparado** | Estrutura pronta se necessário usar repo. |
| Build | **Não verificado** | Sem compilação executada. Não é possível afirmar que compila. |

## Pendências prioritárias (foco lima_32)
1. **Validar partições/kernel/cmdline** do Moto G8 Play (lima_32) a partir de firmware oficial
2. **Escolher fonte de kernel** com justificativa (comparar Jebaitedneko vs electimon)
3. **Coletar informações de TWRP** (fstab/partições/DTB) para referência
4. **Preparar scripts de extração de blobs** para lima_32
5. **Preencher BoardConfig/device.mk** com valores validados
6. **Testar build em ambiente AOSP real** (quando estrutura estiver populada)

## Riscos
- **lima vs lima_32 diferentes**: Não compartilhar configurações sem prova
- **Repos vazios/desatualizados**: mototek/device_motorola_lima vazio
- **Licenças**: Verificar antes de incorporar código
- **Blobs proprietários**: Nunca commitar

## Checklist de verificação
- [ ] Caminhos e nomes validados
- [ ] Sem duplicação não justificada
- [ ] Referências entre Makefiles corretas
- [ ] Dependências mapeadas
- [ ] Manifests válidos (se usados)
- [ ] lima_32 e lima separados corretamente
- [ ] Recovery isolado
- [ ] Documentação completa
- [ ] Build real executado (pendente)
