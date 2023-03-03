import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final items=[];
  final GlobalKey<AnimatedListState> key=GlobalKey();

  addItem(){
    items.insert(0,"Item ${items.length+1}");
    key.currentState!.insertItem(0,duration: const Duration(seconds: 1));
  }
  removeItem(int i){
    key.currentState!.removeItem(i,
        (context,animation)=>SizeTransition(sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Colors.redAccent,
          child: ListTile(
            title: Text('Deleted',style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),),
          ),
        ),
        ),
        duration: const Duration(seconds: 1));
    items.removeAt(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.purple,
              width: double.infinity,
              height: 150,
              child:const  Center(child: Text('Flutter Mapp',
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
              )
                ,)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(onPressed: (){
                addItem();
              }, icon: const Icon(Icons.add,size: 50,)),
            ),
            Expanded(
              child: AnimatedList(
                  key: key,
                  itemBuilder: (conext,index,animation)=>SizeTransition(
                    key:UniqueKey() ,
                    sizeFactor: animation,
                    child:Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 10,
                      color: Colors.purple,
                      child: ListTile(
                        title: Text(items[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete,
                            color: Colors.white,),
                          onPressed: (){
                            removeItem(index);
                          },
                        ),
                      ),
                    )
                    ,)
              ),
            )
          ],
        ),
      ),
    );
  }
}
