import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  final url = 'https://krika.vtexcommercestable.com.br/api/catalog/pvt/collection/149/products';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'X-VTEX-API-AppKey': 'vtexappkey-krika-XUCLKS', 
        'X-VTEX-API-AppToken': 'AJSGRSGDIVXEFJPQQSSMSQRQIYBRSRXFMQRXJFOLLCBCDIWDCCPMAHQUAKJDWVIFCBLDUKVLAGOOUOCBITYBTOOIZFRJTYTKTUSZWXEPJSHBPFTKOKRLCTITKSWNGBYI'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData.containsKey('Data') && responseData['Data'] is List) {
        final List<dynamic> newProducts = List.from(responseData['Data']);

        print('Tamaño de la lista de productos: ${newProducts.length}');
        print(newProducts);

        return newProducts;
      } else {
        print('Error: Respuesta del servidor no contiene datos válidos.');
        return []; // Devuelve una lista vacía en caso de error.
      }
    } else {
      // Errores si la solicitud no fue exitosa.
      print('Error al obtener los productos. Código de estado: ${response.statusCode}');
      return []; // Devuelve una lista vacía en caso de error.
    }
  } catch (error) {
    print('Error al decodificar la respuesta JSON: $error');
    return []; // Devuelve una lista vacía en caso de error.
  }
}
