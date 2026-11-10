# Manifests

Caso seja necessário sincronizar dependências externas com `repo`, coloque manifests XML neste diretório.

## Exemplo
Crie um arquivo como `roomservice.xml` ou manifest personalizado. Documente:
- Remote
- Revisão/branch/commit
- Projetos necessários (kernel, vendor, etc.)
- Justificativa

## Nota
Atualmente este monorepo foca em organizar device/kernel/vendor/recovery localmente. Use manifests apenas se houver componentes que não podem ser incorporados diretamente.
