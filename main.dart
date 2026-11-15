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
          secondary: Color(0xFF19D36B),
          surface: Color(0xFF151B18),
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
        backgroundColor: const Color(0xFF090D0B),
        title: const Text(
          'PLAY 90',
          style: TextStyle(
            color: Color(0xFF19D36B),
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.sports_soccer, color: Color(0xFF19D36B)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF151B18),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF26332B)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'كرة القدم بين إيديك',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'تابع المباريات والنتائج من مكان واحد.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              Icon(Icons.circle, size: 10, color: Color(0xFF19D36B)),
              SizedBox(width: 8),
              Text(
                'المباريات المباشرة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const MatchCard(
            home: 'الفريق الأول',
            away: 'الفريق الثاني',
            status: 'قريباً',
          ),
          const SizedBox(height: 20),
          const Text(
            'مباريات اليوم',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const MatchCard(
            home: 'الفريق الثالث',
            away: 'الفريق الرابع',
            status: 'لم تبدأ',
          ),
          const SizedBox(height: 24),
          const Text(
            'هذه واجهة تجريبية أولية، وسيتم ربط المباريات ومصادر البث لاحقاً.',
            style: TextStyle(color: Colors.white54, height: 1.5),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF151B18),
        indicatorColor: const Color(0x3319D36B),
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF19D36B)),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'المباريات',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String home;
  final String away;
  final String status;

  const MatchCard({
    super.key,
    required this.home,
    required this.away,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF151B18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF26332B)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(home, textAlign: TextAlign.center),
          ),
          Column(
            children: [
              const Text(
                'VS',
                style: TextStyle(
                  color: Color(0xFF19D36B),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                status,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
          Expanded(
            child: Text(away, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
