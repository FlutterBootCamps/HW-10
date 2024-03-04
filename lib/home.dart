import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAligmentAnimation;
  late Animation<Alignment> _bottomAligmentAnimation;

  List<dynamic> universities = [];
  List<dynamic> filteredUniversities = [];

  @override
  void initState() {
    super.initState();
    fetchUniversities();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _topAligmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
      ],
    ).animate(_controller);
    _bottomAligmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
      ],
    ).animate(_controller);
    _controller.repeat();
  }

//fetch
  Future<void> fetchUniversities() async {
    final url = Uri.parse(
        // used Api
        'http://universities.hipolabs.com/search?name=middle&country=');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        universities = json.decode(response.body);
        filteredUniversities = universities;
      });
    } else {
      throw Exception('Failed to load universities');
    }
  }

  void filterUniversities(String keyword) {
    setState(() {
      filteredUniversities = universities
          .where((university) => university['country']
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.transparent,
  title: Center(child: const Text('Universities API')),
),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context,_) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 16, 12, 3), const Color.fromARGB(255, 251, 20, 20)],
              begin: _topAligmentAnimation.value,
              end: _bottomAligmentAnimation.value,
              
            )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterUniversities(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search by country',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      
                    ),
                  ),
                ),
                Expanded(
                  child: filteredUniversities.isEmpty
                      ? const Center(
                          child: Text('No universities found.'),
                        )
                      : ListView.builder(
                          itemCount: filteredUniversities.length,
                          itemBuilder: (context, index) {
                            final university = filteredUniversities[index];
                            return          
                                Card(
                              elevation: 3,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: ListTile(
                                title: Text(
                                  university['name'],
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('Country: ${university['country']}'),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
