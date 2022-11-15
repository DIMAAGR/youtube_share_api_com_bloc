import 'package:flutter/material.dart';

class FutureListViewBuilder extends StatelessWidget {
  const FutureListViewBuilder({super.key, required this.onTap, this.future});

  final Function(String) onTap;
  final Future<List<dynamic>>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: future,
      builder: (context, snapshot) => !snapshot.hasData
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data![index]),
                onTap: () => onTap(snapshot.data![index]),
              ),
            ),
    );
  }
}
