```markdown
# Q-Sync (Queuing and Synchronization System)

Documentação Técnica de Arquitetura e Guia de Execução para o ecossistema de sincronização offline-first.

---

## 1. Estrutura de Pastas (Project Tree)

```text
lib/
├── app/
│   ├── core/
│   │   ├── auth/
│   │   │   ├── interfaces/
│   │   │   │   └── i_auth_service.dart
│   │   │   ├── models/
│   │   │   │   └── user_model.dart
│   │   │   └── services/
│   │   │       └── auth_service_impl.dart
│   │   ├── database/
│   │   │   ├── app_database.dart
│   │   │   └── app_database.g.dart
│   │   ├── interfaces/
│   │   │   └── i_auth_service.dart
│   │   ├── network/
│   │   │   ├── api_client.dart
│   │   │   └── result.dart
│   │   └── sync/
│   │       └── q_sync_manager.dart
│   └── modules/
│       ├── auth/
│       │   ├── controllers/
│       │   ├── providers/
│       │   └── views/
│       │       └── login_page.dart
│       ├── dashboard/
│       │   ├── controllers/
│       │   ├── providers/
│       │   └── views/
│       └── synchronization/
│           ├── controllers/
│           ├── providers/
│           └── views/
└── main.dart

```

---

## 2. Pré-requisitos do Ambiente

* **Flutter SDK:** Versão estável (Recomendado >= 3.19.0)
* **Dart SDK:** Versão compatível integrada ao Flutter SDK utilizado
* **Ambiente de Execução:** Terminal configurado (VS Code, Windows Terminal ou WSL)
* **Dispositivo de Teste:** Emulador Android, simulador iOS ou dispositivo físico via ADB

---

## 3. Como Rodar o Projeto (Passo a Passo)

### Passo 1: Clonar o Repositório

Abra o terminal e execute o comando abaixo para clonar o projeto para a sua máquina local:

```bash
git clone [https://github.com/adrielhenry33/Q-sync-Queuing-and-Synchronization-System-.git](https://github.com/adrielhenry33/Q-sync-Queuing-and-Synchronization-System-.git)
cd Q-sync-Queuing-and-Synchronization-System-

```

### Passo 2: Baixar as Dependências

Instale todos os pacotes e dependências listados no arquivo `pubspec.yaml`:

```bash
flutter pub get

```

### Passo 3: Geração de Código Automatizada

Execute o gerador de códigos para criar as tabelas locais do Drift e os arquivos auxiliares de sincronização (`.g.dart`):

```bash
flutter pub run build_runner build --delete-conflicting-outputs

```

### Passo 4: Executar a Aplicação

Inicie o aplicativo no emulador ou dispositivo conectado:

```bash
flutter run

```

---

## 4. Comandos de Utilidade

### Limpeza Completa e Atualização

Use este comando caso sinta necessidade de limpar o cache local de compilação, recriar as tabelas locais ou resolver conflitos de pacotes:

```bash
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

```

### Execução Contínua do Gerador (Watch Mode)

Para manter o gerador de código escutando as suas alterações nos modelos e tabelas locais em tempo real:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs

```

```

```
