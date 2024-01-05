import 'package:flutter/material.dart';
import '../../utils/global.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total=0;
  @override
  void initState() {
    super.initState();
    count();
  }
  void count()
  {
    for(int i =0;i<cartList.length;i++)
    {
      total = total + cartList[i]['price'] as double;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(" My Cart",style: TextStyle(color: Colors.white60),
            ),
            leading: InkWell(
              onTap: (){
                Navigator.pushNamed(context, 'home');
              },
                child: Icon(Icons.arrow_back_ios_new,color: Colors.white60,),
            ),
            actions: [
              Container(
                width: 50,
                height: 30,
                decoration: (
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    )
                ),
                child: Image.asset("assets/images/women.jpg"),
              ),
            ],

          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: List.generate(cartList.length, (index) => Container(
                    height: 100,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin:  EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 1,
                          )
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                            "${cartList[index]['image']}",
                            height: 80,
                            width: 80
                        ),
                        const SizedBox(
                          width:10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cartList[index]['name']}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "${cartList[index]['country']}",
                              style: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.black),
                            ),
                            Text(
                              "\$${cartList[index]['price']}",
                              style: const TextStyle(
                                  fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                            onTap:()
                            {
                              setState((){
                                cartList.removeAt(index);
                                total=0;
                                count();
                              });
                            },
                            child: Icon(Icons.delete)
                        ),
                      ],

                    ),
                  ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(color: Colors.black12,blurRadius: 2,spreadRadius: 5)
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("\$$total",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      SizedBox(
                          width: 10
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Checkout",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],


          )

      ),
    );

  }
}