import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReciterDropdown extends StatefulWidget {
  final Function(String itemApiUrl) onReciterSelected;

  const ReciterDropdown({super.key, required this.onReciterSelected});

  @override
  State<ReciterDropdown> createState() => _ReciterDropdownState();
}

class _ReciterDropdownState extends State<ReciterDropdown> {
  List<dynamic> authors = [];
  String? selectedAuthor;
  String? selectedApiUrl;

  @override
  void initState() {
    super.initState();
    fetchAuthors();
  }

  Future<void> fetchAuthors() async {
    final url = Uri.parse(
            'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-authors-data/showall/showall/countdesc/ar/1/20/json')
        .toString();

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        setState(() {
          authors = response.data['data'];
        });
      } else {
        debugPrint('Failed to fetch authors: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching authors: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return authors.isEmpty
        ? const CircularProgressIndicator()
        : DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              label: Text("اختر القارئ"),
              border: OutlineInputBorder(),
            ),
            items: authors.map<DropdownMenuItem<String>>((author) {
              return DropdownMenuItem<String>(
                value: author['title'],
                child: Text(author['title']),
              );
            }).toList(),
            value: selectedAuthor,
            onChanged: (value) {
              setState(() {
                selectedAuthor = value;
                selectedApiUrl = authors.firstWhere(
                    (author) => author['title'] == value)['item_api_url'];
                widget.onReciterSelected(selectedApiUrl!);
              });
            },
          );
  }
}
