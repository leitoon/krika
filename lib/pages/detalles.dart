
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:krika/widgets/widgets.dart';

class Detalles extends StatelessWidget {
 final dynamic product;

  const Detalles({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(onPressed: (){Navigator.pop(context);}, 
        icon: const Icon(Icons.arrow_back_ios_outlined, 
        color: Colors.white)),
        backgroundColor: const Color(0xFFFF009E),
        title: const Text(
          'Detalles del Producto',
          style: TextStyle(color: Colors.white),
        ),
    
      ),
      body: Column(
        children: [
          Image.network(
            product['SkuImageUrl'],
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 0.35*size.height,         
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductText(product: product, tamfuen: 18,),
                    const SizedBox(height: 10,),
                    const PrecioText(tamfuen: 22,),
                    const SizedBox(height: 10,),
                     Row
                    (
                      children: 
                      [
                        TextoNormal(color: Color.fromARGB(255, 0, 0, 0), 
                        fontWeight: FontWeight.w300, 
                        texto: 'Disponibilidad: ', 
                        sizefont: 15,),
                        const TextStock(tamfuen: 15)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    TextoNormal(color: Colors.black, 
                        fontWeight: FontWeight.w100, 
                        texto: 'Title ', sizefont: 20,),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xffF334A0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radio de los bordes
                      ),
                    ),
                    child: const Text(
                      'Default Title',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 15,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: 
                    [
                      TextoNormal(color: Color.fromARGB(255, 0, 0, 0), 
                        fontWeight: FontWeight.w300, 
                        texto: 'Seleccione la cantidad: ', 
                        sizefont: 15,),
                        CounterWidget()
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xffF334A0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Radio de los bordes
                          ),
                        ),
                        child: const Text(
                          'Compra ahora',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Radio de los bordes
                          ),
                        ),
                        child: const Text(
                          'Añadir al carro',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(height: 10,),
                   DescriptionWidget(),
                   const SizedBox(height: 20,),
                  
                  ],
                ),
              ),
            ),
          ),]));
          }}

// Incrementador
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}
class _CounterWidgetState extends State<CounterWidget> {
  int cantidad = 0;

  void incrementar() {
    setState(() {
      cantidad++;
    });
  }

  void decrementar() {
    setState(() {
      if (cantidad > 0) {
        cantidad--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: decrementar,
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xffF334A0),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          '$cantidad',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: incrementar,
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xffF334A0),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpansionTile(
          backgroundColor: Color(0xffF334A0),
          iconColor: Colors.white,
          collapsedIconColor:Colors.white,
          textColor: Colors.white,
          collapsedBackgroundColor:Color(0xffF334A0),
          title: Text('DESCRIPCIÓN',style: TextStyle(color: Colors.white),),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Información del producto',
                style: TextStyle(fontSize: 16,color:Colors.white ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}