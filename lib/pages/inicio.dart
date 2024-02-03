import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:krika/http/fetchProducts.dart';
import 'package:krika/pages/detalles.dart';
import 'package:krika/widgets/widgets.dart';

import '../widgets/preciotext.dart';

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
      floatingActionButton: ElevatedButton(onPressed: (){},
      child: const Icon(Icons.shopping_bag,
      color: Color(0xffF334A0),
      size: 30,)),
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
        onPressed: () 
        {
          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detalles(product: product),
      ));
        },
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
              ProductText(product: product, tamfuen: 12,),
              const FittedBox(
                fit: BoxFit.contain,
                child: PrecioText(tamfuen: 15,),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStock(tamfuen: 12,),
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




