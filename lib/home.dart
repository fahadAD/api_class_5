import 'package:e_shop_api_project/repo.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.image_search,size: 40),
            tooltip: 'Open Image',
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog();
              },);
            },
          ),
        ],
      ),
 body: FutureBuilder(future: getEshopRepo(),
   builder: (context, snapshot) {
 if(snapshot.hasData){
   return ListView.builder(
     primary: false,
     shrinkWrap:  true,
     itemCount: snapshot.data?.data?.length,
     itemBuilder: (BuildContext context, int index) {

       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           height: 200,
            width: double.infinity,
           decoration: BoxDecoration(
             color: Colors.blue.shade50,
          borderRadius: BorderRadius.only( 
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
            
          ),
           ),
           child: Row(
             children: [
               Container(
                 width: 170,
                 height: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),


                      ),
                      child: Image.network("${snapshot.data?.data![index].categories?.image}",fit: BoxFit.fill)),
               ),
SizedBox(width: 4,),
               Column(children: [
                 Text("${snapshot.data!.data?[index].title}"),
                 Text("${snapshot.data!.data?[index].categories?.name}"),
                 Text("${snapshot.data!.data?[index].categories?.type}"),
                 Icon(snapshot.data!.data?[index].inWishlist ==true? Icons.favorite:Icons.favorite_border),

                   ],)

             ],
           ),
         ),
       );

     },

   );
 }else{
   return Center(child: CircularProgressIndicator());
 }
 },),
    );
  }
}
