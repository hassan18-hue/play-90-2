import 'package:flutter/material.dart';

void main() {
  runApp(const Play90App());
}

class Play90App extends StatelessWidget {
  const Play90App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PLAY 90',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090D0B),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF19D36B),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PLAY 90',
          style: TextStyle(
            color: Color(0xFF19D36B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF090D0B),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'كرة القدم بين إيديك ⚽',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            '🔴 المباريات المباشرة',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 15),
          matchCard('الفريق الأول', 'الفريق الثاني', 'قريباً'),
          const SizedBox(height: 20),
          const Text(
            'مباريات اليوم',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 15),
          matchCard('الفريق الثالث', 'الفريق الرابع', 'لم تبدأ'),
        ],
      ),
    );
  }

  Widget matchCard(String home, String away, String status) {
    return Card(
      color: const Color(0xFF151B18),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Text(home, textAlign: TextAlign.center)),
            Column(
              children: [
                const Text(
                  'VS',
                  style: TextStyle(
                    color: Color(0xFF19D36B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(status),
              ],
            ),
            Expanded(child: Text(away, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
