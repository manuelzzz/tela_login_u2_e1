# Tela Login U2 E1

Aplicativo Flutter com arquitetura modular para autenticao e listagem de produtos de e-commerce.

## Visao Geral

Este projeto utiliza:

- Flutter + Material
- [Flutter Modular](https://pub.dev/packages/flutter_modular) para injecao de dependencia e rotas
- [Dio](https://pub.dev/packages/dio) para requisicoes HTTP
- [Provider](https://pub.dev/packages/provider) (Para utilizar o ChangeNotifier para gerenciamento de estado)

A listagem de produtos consome dados da API publica Fake Store API.

Base URL:

`https://fakestoreapi.com`

Endpoint utilizado:

`GET /products`

## Requisitos

- Flutter SDK compativel com `sdk: ^3.9.2`
- Dart SDK compativel com o Flutter instalado

## Como Executar

1. Instale as dependencias:

```bash
flutter pub get
```

2. Rode o app:

```bash
flutter run
```

3. (Opcional) Rode analise estatica:

```bash
flutter analyze
```

## Arquitetura

O projeto segue uma separacao por modulos e camadas:

- `domain`: entidades, contratos de repositorio e casos de uso
- `infra`: modelos e implementacoes de repositorio
- `external`: acesso externo (datasource HTTP)
- `presenter`: views e view models

## Exemplo de mvvm: Fluxo de Carregamento de Produtos

1. A `ProductsView` inicia e chama `loadProducts()` no `ProductViewModel`.
2. O `ProductViewModel` aciona o caso de uso `IGetProducts`.
3. `GetProductsImpl` consulta o repositorio `IProductRepository`.
4. `ProductRepositoryImpl` delega ao datasource `IProductDatasource`.
5. `ProductDatasourceImpl` realiza `GET /products` usando `IHttpService`.
6. O JSON retornado e convertido em `ProductModel` e exibido em grid.

Estados tratados na tela (utilizando ChangeNotifier):

- Carregando
- Erro de requisicao
- Lista vazia
- Lista com dados

## Estrutura Resumida

```text
lib/
	main.dart
	src/
		app.dart
		app_module.dart
		config/
		core/
		modules/
			login/
			products/
				domain/
				infra/
				external/
				presenter/
		services/
```

## Dependencias Principais

- `flutter_modular`
- `dio`
- `provider` (disponivel no projeto)

## Observacoes

- O projeto utiliza `IAuthConfig` para montar headers HTTP, inclusive token quando autenticado.
- A API de produtos atual é publica e nao requer autenticacao para leitura.


## Acesso ao app

- Login: johnd
- Senha: m38rmF$