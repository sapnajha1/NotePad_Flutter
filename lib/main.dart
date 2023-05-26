// import 'dart.io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(NotesApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> notes = [];
  List<String> notestittle =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: Text(
          "Notes",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.cyan,
      ),
      body: notes.length > 0
          ? Padding(padding: const EdgeInsets.all(4.0),
            child: MasonryGridView.builder(
              itemCount:notes.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              itemBuilder: (context,index){
                return Padding(padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notes[index],style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),
                        ),
                        const SizedBox(height: 5,),
                        Text(notestittle[index],style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                );
              },
            ),
      )
      : const SizedBox(),




      floatingActionButton: FloatingActionButton(backgroundColor: Colors.cyan,
      child: Icon(Icons.add,color: Colors.black,),
      onPressed: (){
        openAlertbox();
      },),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Sapna",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),), accountEmail: Text("sapnaaccountemail",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20,),),
            decoration: BoxDecoration(color: Colors.cyan),
            ),

            ListTile(leading: Icon(Icons.star,color: Colors.cyan,),
            title:
              Text("Important",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),) ,
            ),
            ListTile(leading: Icon(Icons.draw_outlined,color: Colors.cyan,),
            title:
              Text("Draft",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),
              ),
            ),
            ListTile(leading: Icon(Icons.file_copy_outlined,color: Colors.cyan,),
            title:
              Text("Documents",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20),),),
            ]
            ),
            ),

    );
  }

  openAlertbox(){
    return showDialog(context: context, builder: (BuildContext Context){
      String newNoteTitle = "";
      String newNoteContext = "";
      return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0),),),
        contentPadding: const EdgeInsets.only(top:10.0),
        content: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text("Add Note",style: GoogleFonts.poppins(color: Colors.black,fontSize: 24,
              fontWeight: FontWeight.bold),
              ),
              ),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 50,
                child: Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: (value){
                        newNoteTitle=value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: false,
                        contentPadding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          bottom: 10,
                          right: 10,),
                        hintText: 'Tittle',
                        hintStyle: GoogleFonts.poppins(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                  child: Expanded(
                    flex: 2,
                    child: Container(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (value){
                          newNoteContext=value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: false,
                          contentPadding: const EdgeInsets.only(
                            left: 10,top: 10,bottom: 10,right: 10,),
                          hintText: 'Notes',
                          hintStyle: GoogleFonts.poppins(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                  ),
              ),
              InkWell(
                onTap:(){
                  setState(() {
                    String newNote = '$newNoteTitle';
                    notes.add(newNote);
                  });
                  setState(() {
                    String newNotetittle = '$newNoteContext';
                    notestittle.add(newNotetittle);
                  });
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)
                    )
                  ),
                  child: Text("Add",style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
                  textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
