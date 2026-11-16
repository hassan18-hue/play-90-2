import 'package:flutter/material.dart';

void main() => runApp(const Play90App());

const green = Color(0xFF19D36B);
const background = Color(0xFF090D0B);
const panel = Color(0xFF151B18);

class Play90App extends StatelessWidget {
  const Play90App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLAY 90',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(primary: green, surface: panel),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('PLAY 90', style: TextStyle(
          color: green, fontWeight: FontWeight.w900, letterSpacing: 1.8,
        )),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 18),
            child: Icon(Icons.notifications_none_rounded, color: Colors.white70),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF183D29), Color(0xFF111A15)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: green.withValues(alpha: .25)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عِش أجواء المباراة', style: TextStyle(
                    fontSize: 23, fontWeight: FontWeight.w900,
                  )),
                  SizedBox(height: 7),
                  Text('كل مبارياتك ونتائجك في مكان واحد',
                    style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 14),
                  Row(children: [
                    Icon(Icons.sports_soccer, color: green, size: 20),
                    SizedBox(width: 7),
                    Text('موسم كرة القدم', style: TextStyle(
                      color: green, fontWeight: FontWeight.bold,
                    )),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Icon(Icons.circle, size: 9, color: green),
                SizedBox(width: 8),
                Text('مباشر الآن', style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold,
                )),
                Spacer(),
                Text('عرض الكل', style: TextStyle(color: green, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),
            const MatchCard(
              competition: 'مباراة تجريبية • بيانات للعرض فقط',
              home: 'الأهلي', away: 'الزمالك',
              homeMark: 'أ', awayMark: 'ز',
              score: '0 - 0', status: 'قريباً',
            ),
            const SizedBox(height: 24),
            const Text('مباريات اليوم', style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 12),
            const MatchCard(
              competition: 'مباراة تجريبية • بيانات للعرض فقط',
              home: 'فريق A', away: 'فريق B',
              homeMark: 'A', awayMark: 'B',
              score: 'VS', status: 'لم تبدأ',
            ),
            const SizedBox(height: 12),
            const MatchCard(
              competition: 'مباراة تجريبية • بيانات للعرض فقط',
              home: 'فريق C', away: 'فريق D',
              homeMark: 'C', awayMark: 'D',
              score: 'VS', status: 'لاحقاً',
            ),
            const SizedBox(height: 18),
            const Text(
              'ملاحظة: المباريات الظاهرة تجريبية وليست مواعيد أو نتائج حقيقية. '
              'سنربط التطبيق بمصدر بيانات مرخّص في مرحلة لاحقة.',
              style: TextStyle(color: Colors.white54, height: 1.5, fontSize: 12),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: panel,
        indicatorColor: green.withValues(alpha: .16),
        selectedIndex: selectedTab,
        onDestinationSelected: (index) => setState(() => selectedTab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: green),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'المباريات',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'البطولات',
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
  final String competition, home, away, homeMark, awayMark, score, status;

  const MatchCard({
    super.key,
    required this.competition,
    required this.home,
    required this.away,
    required this.homeMark,
    required this.awayMark,
    required this.score,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFF29352E)),
      ),
      child: Column(
        children: [
          Row(children: [
            Expanded(child: Text(competition, style: const TextStyle(
              color: Colors.white54, fontSize: 11,
            ))),
            Text(status, style: const TextStyle(color: green, fontSize: 11,
              fontWeight: FontWeight.bold)),
          ]),
          const SizedBox(height: 17),
          Row(children: [
            Expanded(child: _Team(name: home, mark: homeMark)),
            Column(children: [
              Text(score, style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900,
              )),
              const SizedBox(height: 3),
              const Text('المباراة', style: TextStyle(
                color: Colors.white38, fontSize: 10,
              )),
            ]),
            Expanded(child: _Team(name: away, mark: awayMark)),
          ]),
        ],
      ),
    );
  }
}

class _Team extends StatelessWidget {
  final String name, mark;
  const _Team({required this.name, required this.mark});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 23,
        backgroundColor: const Color(0xFF26352C),
        child: Text(mark, style: const TextStyle(
          color: green, fontWeight: FontWeight.w900, fontSize: 18,
        )),
      ),
      const SizedBox(height: 8),
      Text(name, textAlign: TextAlign.center, style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 13,
      )),
    ]);
  }
}
