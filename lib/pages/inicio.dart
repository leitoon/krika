import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:krika/http/fetchProducts.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late Future<List<dynamic>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
        } else {
          return _buildProductsUI(snapshot.data!);
        }
      },
    );
  }

  Widget _buildProductsUI(List<dynamic> products) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        leading: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
        backgroundColor: const Color(0xFFFF009E),
        title: const Text(
          'CAPILAR',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.menu, color: Colors.white),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: (products.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int firstProductIndex = index * 2;
          final int secondProductIndex = firstProductIndex + 1;

          return Padding(
            padding: const EdgeInsets.only(top: 26, left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildProductWidget(products[firstProductIndex]),
                _buildProductWidget(products[secondProductIndex]),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductWidget(dynamic product) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 0.31 * size.height,
      width: 0.408 * size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: const Color(0xffF334A0),
          width: 1.0,
        ),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 0.167487685 * size.height,
                    width: 0.6 * size.width,
                    child: Image.network(
                      product['SkuImageUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite_border, color: Color(0xffF334A0)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                product['ProductName'],
                style: const TextStyle(
                    fontSize: 12, color: Color(0xffF334A0), fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$${NumberFormat("#,##0.00", "en_US").format(35000.0)}',
                style: const TextStyle(
                    fontSize: 15, color: Color(0xff0D0D0D), fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'En stock',
                    style: TextStyle(
                        fontSize: 12, color: Color(0xffF334A0), fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Color(0xff0D0D0D),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
