import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:products_api/model.dart';

class ProductApp2 extends StatefulWidget {
  const ProductApp2({super.key});

  @override
  State<ProductApp2> createState() => _ProductApp2State();
}

class _ProductApp2State extends State<ProductApp2> {


  Future<Model> getProductsApi() async{
    final response =await http.get(Uri.parse('https://dummyjson.com/products'))  ;
    var  data =jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode==200)
      {
    return Model.fromJson(data) ;
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
                                width:MediaQuery.of(context).size.width*.2,
                                color:Colors.blueAccent,
                                child: ListView.builder(
                                    itemCount:snapshot.data?.products![index].images!.length,
                                    itemBuilder:(context,joker){
                                      Container(
                                        height:MediaQuery.of(context).size.height*.2,
                                        width:MediaQuery.of(context).size.width*.5,
                                        color:Colors.red,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot.data!. products![index].images![joker].toString()),
                                          ),
                                        ),
                                      );

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
