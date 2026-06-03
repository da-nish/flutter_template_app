import 'package:flutter/material.dart';

class DynamicSearchScreen extends StatelessWidget {
  final String title;
  final String placeholder;
  final String endpoint;


  const DynamicSearchScreen({
    super.key,
    required this.title,
    required this.placeholder,
    required this.endpoint,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SearchScreen(),
      // body: Column(children: [
      //   TextButton(
      //   child: const Text('Click Here'),
      //   onPressed: () async {
      //     print("title: $title");
      //     print("placeholder: $placeholder");
      //     print("endpoint: $endpoint");
      //     print("==========================");

      //     return Navigator.pop<String>(context, "Addddd");
      //   },
      //   ),
      // ],)
      // DynamicSearchView(
      //   placeholder: placeholder,
      //   endpoint: endpoint,
      // ),
    );
  }
}


class SearchScreen extends StatefulWidget {

  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  late List<String> filteredItems;

  final List<String> items = [
    'Chennai',
    'Bangalore',
    'Mumbai',
    'Delhi',
    'Hyderabad',
    'Pune',
    'Kolkata',
    'Ahmedabad',
    'Coimbatore',
    'Hosur',
  ];


  String? selectedItem;


  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterItems(String query) {
    setState(() {
      filteredItems =items
          .where(
            (item) =>
                item.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: filterItems,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filteredItems.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = filteredItems[index];

                return ListTile(
                  title: Text(item),
                  onTap: () {
                    Navigator.pop(context, item);
                  },
                );
              },
            ),
          ),
        ],
    );
  }
}