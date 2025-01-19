//list.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lists Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists Example'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Basic List'),
            leading: const Icon(Icons.list),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasicList()),
              );
            },
          ),
          ListTile(
            title: const Text('Grid List'),
            leading: const Icon(Icons.grid_on),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GridList()),
              );
            },
          ),
          ListTile(
            title: const Text('Horizontal List'),
            leading: const Icon(Icons.swap_horiz),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HorizontalList()),
              );
            },
          ),
          ListTile(
            title: const Text('Long List'),
            leading: const Icon(Icons.more_vert),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LongList()),
              );
            },
          ),
          ListTile(
            title: const Text('Mixed List'),
            leading: const Icon(Icons.category),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MixedList()),
              );
            },
          ),
          ListTile(
            title: const Text('Spaced Items List'),
            leading: const Icon(Icons.space_bar),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SpacedItemsList()),
              );
            },
          ),
          ListTile(
            title: const Text('Floating App Bar List'),
            leading: const Icon(Icons.view_list),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FloatingAppBarList()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BasicList extends StatelessWidget {
  const BasicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic List'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid List'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal List'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(
              width: 160,
              color: Colors.blue,
            ),
            Container(
              width: 160,
              color: Colors.green,
            ),
            Container(
              width: 160,
              color: Colors.yellow,
            ),
            Container(
              width: 160,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class LongList extends StatelessWidget {
  const LongList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}

class MixedList extends StatelessWidget {
  const MixedList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mixed List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

class SpacedItemsList extends StatelessWidget {
  const SpacedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaced Items List'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  items, (index) => ItemWidget(text: 'Item $index')),
            ),
          ),
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}

class FloatingAppBarList extends StatelessWidget {
  const FloatingAppBarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Floating App Bar'),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
