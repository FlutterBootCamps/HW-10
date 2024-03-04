import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_rest_api/data/fetch_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final provider = Provider.of<FetchData>(context, listen: false);
    provider.getDataFromAPI(); // Fetch data when the widget is initialized
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FetchData>(context);
    return Scaffold(
      appBar: AppBar(
       
        
      ),
      body: provider.error.isEmpty
          ? getBodyUI(provider)
          : getErrorUI(provider.error), // Display error UI if error occurred
    );
  }

  // Widget to display error UI
  Widget getErrorUI(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 22),
      ),
    );
  }

  // Widget to display main content
  Widget getBodyUI(FetchData provider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              provider.search(value); // Search for users based on input
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.serachedPets.data.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                    provider.serachedPets.data[index].petImage),
                backgroundColor: Colors.white,
              ),
              title: Text(provider.serachedPets.data[index].userName),
              trailing: provider.serachedPets.data[index].isFriendly
                  ? const SizedBox()
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
