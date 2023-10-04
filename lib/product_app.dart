import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:products_api/model.dart';

class ProductApp extends StatefulWidget {
  const ProductApp({super.key});

  @override
  State<ProductApp> createState() => _ProductAppState();
}

class _ProductAppState extends State<ProductApp> {

 Future<Model> getProductsApi() async{
   final response =await http.get(Uri.parse('https://dummyjson.com/products'))  ;
 var  data =jsonDecode(response.body.toString());
 print(data);
 if(response.statusCode==200)
 {
 return Model.fromJson(data);
 }else{
 return Model.fromJson(data);
 }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
      ),
      body:Column(
        children: [
          Expanded(
            child: FutureBuilder<Model>(future: getProductsApi(),
                builder: (context, snapshot){
              print(snapshot);
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return Text('Loading');
                 }
                 else{
                   return ListView.builder(
                       itemCount: snapshot.data?.products!.length,
                       itemBuilder: (context,index){

                  return Column(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height*.3,
                      width:MediaQuery.of(context).size.width*.4,
                      color:Colors.blueAccent,
                      child: ListView.builder(
                          itemCount:snapshot.data?.products!.length,
                          itemBuilder:(context,joker){
                            print('hello--------------');
                            print ( snapshot.data);
                            var Data = snapshot.data?.products![index];
                            if( Data != Null){
                              Container(
                              height:MediaQuery.of(context).size.height*.2,
                              width:MediaQuery.of(context).size.width*.5,
                              color:Colors.red,



                                   child:Image.network(Data!.images![joker].toString(),
                                   )

                              );

                            }


                          }),
                    ),
                  ],
                  );

                       });
                 }
                }),
          )
        ],
      ),
    );
  }
}
