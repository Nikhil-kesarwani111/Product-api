return Column(
children: [
Container(
height:MediaQuery.of(context).size.height*.3,
width:MediaQuery.of(context).size.width*.9,
color:Colors.blueAccent,
child: ListView.builder(
itemCount:snapshot.data!.products![index].images!.length,
itemBuilder:(context,joker){
print('hello--------------');
print ( snapshot.data);

Container(
height:MediaQuery.of(context).size.height*.2,
width:MediaQuery.of(context).size.width*.5,
color:Colors.red,
decoration: BoxDecoration(
image: DecorationImage(

image: NetworkImage(snapshot.data!.products![index].images![joker].toString()),
),
),
);

}),
),
],
);