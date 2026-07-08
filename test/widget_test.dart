import 'package:flutter_test/flutter_test.dart';
import 'package:tela_login_u2_e1/src/modules/login/external/datasources/login_datasource_impl.dart';
import 'package:tela_login_u2_e1/src/modules/products/external/datasource/product_datasource_impl.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/models/product_model.dart';
import 'package:tela_login_u2_e1/src/services/interfaces/interface_http_service.dart';

void main() {
  group('ProductModel', () {
    test('reads Fake Store image field', () {
      final product = ProductModel.fromJson({
        'id': 1,
        'title': 'Backpack',
        'price': 109.95,
        'description': 'A product description',
        'category': 'bags',
        'image': 'https://fakestoreapi.com/img/backpack.png',
      });

      expect(product.id, 1);
      expect(product.title, 'Backpack');
      expect(product.price, 109.95);
      expect(product.image, 'https://fakestoreapi.com/img/backpack.png');
    });

    test('uses DummyJSON thumbnail as image fallback', () {
      final product = ProductModel.fromJson({
        'id': 2,
        'title': 'Essence Mascara Lash Princess',
        'price': 9.99,
        'description': 'A product description',
        'category': 'beauty',
        'thumbnail': 'https://cdn.dummyjson.com/product-thumbnail.webp',
        'images': ['https://cdn.dummyjson.com/product-image.webp'],
      });

      expect(product.id, 2);
      expect(product.title, 'Essence Mascara Lash Princess');
      expect(product.price, 9.99);
      expect(product.image, 'https://cdn.dummyjson.com/product-thumbnail.webp');
    });

    test('uses first DummyJSON image when thumbnail is missing', () {
      final product = ProductModel.fromJson({
        'id': 3,
        'title': 'Product without thumbnail',
        'price': 19.99,
        'description': 'A product description',
        'category': 'beauty',
        'images': ['https://cdn.dummyjson.com/product-image.webp'],
      });

      expect(product.image, 'https://cdn.dummyjson.com/product-image.webp');
    });
  });

  group('ProductDatasourceImpl', () {
    test('reads products list from DummyJSON response envelope', () async {
      final httpService = _FakeHttpService(
        getData: {
          'products': [
            {
              'id': 1,
              'title': 'Essence Mascara Lash Princess',
              'price': 9.99,
              'description': 'A product description',
              'category': 'beauty',
              'thumbnail': 'https://cdn.dummyjson.com/product-thumbnail.webp',
            },
          ],
          'total': 1,
          'skip': 0,
          'limit': 30,
        },
      );
      final datasource = ProductDatasourceImpl(httpService);

      final products = await datasource.getProducts();

      expect(httpService.getEndpoint, '/products');
      expect(products, hasLength(1));
      expect(products.first.id, 1);
      expect(
        products.first.image,
        'https://cdn.dummyjson.com/product-thumbnail.webp',
      );
    });
  });

  group('LoginDatasourceImpl', () {
    test('returns DummyJSON accessToken from login response', () async {
      final httpService = _FakeHttpService(
        postData: {'accessToken': 'dummy-access-token'},
      );
      final datasource = LoginDatasourceImpl(httpService);

      final token = await datasource.login(
        username: 'emilys',
        password: 'emilyspass',
      );

      expect(httpService.postEndpoint, '/auth/login');
      expect(httpService.postBody, {
        'username': 'emilys',
        'password': 'emilyspass',
      });
      expect(token, 'dummy-access-token');
    });
  });
}

class _FakeHttpService implements IHttpService {
  _FakeHttpService({this.getData, this.postData});

  final dynamic getData;
  final dynamic postData;

  String? getEndpoint;
  String? postEndpoint;
  Object? postBody;

  @override
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    getEndpoint = endpoint;

    return _HttpResponse(getData);
  }

  @override
  Future<dynamic> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
  }) async {
    postEndpoint = endpoint;
    postBody = data;

    return _HttpResponse(postData);
  }

  @override
  Future<dynamic> delete({
    required String endpoint,
    Map<String, dynamic>? extraHeaders,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }
}

class _HttpResponse {
  _HttpResponse(this.data);

  final dynamic data;
}
