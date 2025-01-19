//Navigation.dart
import 'package:flutter/material.dart';

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Animar un widget entre pantallas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeroFirstScreen()),
                );
              },
              child: const Text('Animate Widget Across Screens'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar usando rutas nombradas
                Navigator.pushNamed(context, '/namedRoute');
              },
              child: const Text('Navigate with Named Routes'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a una nueva pantalla y regresar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewScreen()),
                );
              },
              child: const Text('Navigate to a New Screen and Back'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar con argumentos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PassArgumentsScreen(
                      title: 'Custom Title',
                      message: 'This is a message passed as an argument.',
                    ),
                  ),
                );
              },
              child: const Text('Pass Arguments to a Screen'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Navegar y esperar datos de regreso
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectionScreen()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Result: $result')),
                );
              },
              child: const Text('Return Data from a Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// Ruta nombrada (para "Navigate with Named Routes")
class NamedRouteScreen extends StatelessWidget {
  const NamedRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Named Route Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

// Nueva pantalla (para "Navigate to a new screen and back")
class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

// Animación entre pantallas con Hero
class HeroFirstScreen extends StatelessWidget {
  const HeroFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero First Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HeroSecondScreen()),
            );
          },
          child: Hero(
            tag: 'hero-tag',
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSecondScreen extends StatelessWidget {
  const HeroSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Second Screen')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: 'hero-tag',
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

// Pantalla de detalles
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: const Center(
        child: Text('This is the Details Screen'),
      ),
    );
  }
}

// Pantalla con argumentos
class PassArgumentsScreen extends StatelessWidget {
  final String title;
  final String message;

  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

// Pantalla para devolver datos
class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Option 1');
              },
              child: const Text('Option 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Option 2');
              },
              child: const Text('Option 2'),
            ),
          ],
        ),
      ),
    );
  }
}
