import 'package:api_flutter/data/data.dart';
import 'package:api_flutter/widgets/list_tile.dart';
import 'package:api_flutter/model/picsum.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  List<Picsum> data = [];
  
   @override
  void initState() {
    super.initState();
    fetchData();  
  }

  Future<void> fetchData() async {
    try {
      final networking = Networking();
      final result = await networking.fetchDataApp();
      setState(() {
        data = result;
      });
    } catch (error) {
      print("Error fetching data: $error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('image/Screenshot 2024-03-03 224905.png'),
            const Text("Lorem Picsum")
          ],
        ),
        titleSpacing: .1,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 214, 224, 208),
              Color.fromARGB(255, 21, 126, 86),
              Color.fromARGB(255, 45, 117, 3),
              Color.fromARGB(255, 21, 126, 86),
              Color.fromARGB(255, 214, 224, 208),
            ],
          ),
        ),
        child: data.isNotEmpty ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: CustomContainer(
                  title: data[index].author,
                  imageUrl: data[index].url,
                ),
              );
            }) : const Center(
                  child: Text(
                  "The Lorem Ipsum for photos.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
      ),
    );
  }
}
