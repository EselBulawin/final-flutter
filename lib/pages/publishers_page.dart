import 'package:flutter/material.dart';
import '../models/publisher.dart';
import '../widgets/publisher_card.dart';
import '../services/api_service.dart';

class PublishersPage extends StatefulWidget {
  @override
  _PublishersPageState createState() => _PublishersPageState();
}

class _PublishersPageState extends State<PublishersPage> {
  List<Publisher> publishers = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPublishers();
  }

  // Fetch publishers using ApiService
  Future<void> fetchPublishers() async {
    try {
      final apiService = ApiService();
      final fetchedPublishers = await apiService.fetchPublishers();
      setState(() {
        publishers = fetchedPublishers;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  void editPublisher(Publisher publisher) {
    TextEditingController nameController =
        TextEditingController(text: publisher.name);
    TextEditingController emailController =
        TextEditingController(text: publisher.email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Publisher'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  publisher.name = nameController.text;
                  publisher.email = emailController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void deletePublisher(int id) {
    setState(() {
      publishers.removeWhere((publisher) => publisher.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Publishers')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : ListView.builder(
                  itemCount: publishers.length,
                  itemBuilder: (context, index) {
                    final publisher = publishers[index];
                    return PublisherCard(
                      publisher: publisher,
                      onEdit: () => editPublisher(publisher),
                      onDelete: () => deletePublisher(publisher.id),
                    );
                  },
                ),
    );
  }
}
