import 'package:flutter/material.dart';

void main() => runApp(const RewardVerseApp());

class RewardVerseApp extends StatelessWidget {
  const RewardVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REWARDVERSE',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750E8),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF10111A),
        cardTheme: CardThemeData(
          color: const Color(0xFF1B1D2A),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selected = 0;
  final pages = const [
    HomePage(),
    EarnPage(),
    PartnersPage(),
    WalletPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.bolt_rounded), label: 'Earn'),
          NavigationDestination(icon: Icon(Icons.hub_rounded), label: 'Partners'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_rounded), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

class PageShell extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  const PageShell({super.key, required this.title, required this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w800)),
      const SizedBox(height: 5),
      Text(subtitle, style: TextStyle(color: Colors.white.withValues(alpha: .62))),
      const SizedBox(height: 22),
      child,
    ]),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => PageShell(
    title: 'REWARDVERSE ✦',
    subtitle: 'One app. Many opportunities.',
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF6554E8), Color(0xFF9B55D9)]),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('DEMO COIN BALANCE', style: TextStyle(letterSpacing: 1.2, fontSize: 12)),
          const SizedBox(height: 8),
          const Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('2,450', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
            Padding(padding: EdgeInsets.only(bottom: 7, left: 8), child: Text('RV coins')),
          ]),
          const SizedBox(height: 14),
          const Text('Prototype balance — not redeemable for cash.'),
          const SizedBox(height: 15),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bolt),
            label: const Text('Explore earning tasks'),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white70)),
          ),
        ]),
      ),
      const SizedBox(height: 22),
      const SectionTitle('Quick overview'),
      const Row(children: [
        Expanded(child: StatCard(icon: Icons.task_alt, label: 'Tasks done', value: '08')),
        SizedBox(width: 12),
        Expanded(child: StatCard(icon: Icons.local_fire_department, label: 'Daily streak', value: '03 days')),
      ]),
      const SizedBox(height: 22),
      const SectionTitle('Featured opportunities'),
      const OfferCard(title: 'Daily discovery', detail: 'Explore new tasks in the demo marketplace', reward: '+50 coins', icon: Icons.explore),
      const OfferCard(title: 'Survey zone', detail: 'Survey provider slots will appear here after approval', reward: 'Varies', icon: Icons.poll),
      const SizedBox(height: 12),
      const NoticeBox(),
    ]),
  );
}

class EarnPage extends StatelessWidget {
  const EarnPage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Earn coins',
    subtitle: 'A single place to discover available opportunities.',
    child: Column(children: const [
      OfferCard(title: 'Surveys', detail: 'CPX Research / BitLabs integration placeholder', reward: 'Partner-based', icon: Icons.assignment),
      OfferCard(title: 'Tasks', detail: 'Timewall / Wannads integration placeholder', reward: 'Partner-based', icon: Icons.checklist),
      OfferCard(title: 'Offerwalls', detail: 'Approved offer partners will appear here', reward: 'Partner-based', icon: Icons.widgets),
      OfferCard(title: 'Game offers', detail: 'Only eligible, approved game campaigns', reward: 'Partner-based', icon: Icons.sports_esports),
      NoticeBox(),
    ]),
  );
}

class PartnersPage extends StatelessWidget {
  const PartnersPage({super.key});
  static const partners = [
    ('Timewall', 'Tasks & offerwall'),
    ('CPX Research', 'Surveys'),
    ('BitLabs', 'Surveys & offers'),
    ('Wannads', 'Offerwall'),
    ('ayet Studios', 'Offerwall'),
    ('AdGem', 'Game & app offers'),
    ('Lootably', 'Offers'),
    ('AdGate Media', 'Offerwall'),
  ];
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Partner hub',
    subtitle: 'Proposed providers — none are connected yet.',
    child: Column(children: [
      for (final p in partners)
        Card(child: ListTile(
          leading: const CircleAvatar(backgroundColor: Color(0xFF34304F), child: Icon(Icons.hub_outlined)),
          title: Text(p.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(p.$2),
          trailing: const Chip(label: Text('Planned')),
        )),
      const SizedBox(height: 10),
      const NoticeBox(),
    ]),
  );
}

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'My wallet',
    subtitle: 'Demo ledger for interface testing.',
    child: Column(children: const [
      Card(child: ListTile(title: Text('Available demo coins'), trailing: Text('2,450', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))),
      SectionTitle('Recent activity'),
      ActivityTile(title: 'Welcome bonus (sample)', amount: '+500', date: 'Demo transaction'),
      ActivityTile(title: 'Survey task (sample)', amount: '+150', date: 'Demo transaction'),
      ActivityTile(title: 'Daily check-in (sample)', amount: '+50', date: 'Demo transaction'),
      NoticeBox(),
    ]),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => PageShell(
    title: 'Your profile',
    subtitle: 'Account features will be added in the next phase.',
    child: Column(children: const [
      Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('Guest User'), subtitle: Text('Prototype account'))),
      Card(child: ListTile(leading: Icon(Icons.verified_user_outlined), title: Text('Account security'), subtitle: Text('Firebase authentication — planned'))),
      Card(child: ListTile(leading: Icon(Icons.support_agent), title: Text('Help & support'), subtitle: Text('Support centre — planned'))),
      NoticeBox(),
    ]),
  );
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Align(alignment: Alignment.centerLeft, child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800))),
  );
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const StatCard({super.key, required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Card(child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: const Color(0xFFB7A8FF)),
      const SizedBox(height: 12),
      Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
      Text(label, style: TextStyle(color: Colors.white.withValues(alpha: .6))),
    ]),
  ));
}

class OfferCard extends StatelessWidget {
  final String title, detail, reward;
  final IconData icon;
  const OfferCard({super.key, required this.title, required this.detail, required this.reward, required this.icon});
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(backgroundColor: const Color(0xFF34304F), child: Icon(icon)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(detail)),
      trailing: Text(reward, style: const TextStyle(color: Color(0xFFB7A8FF), fontWeight: FontWeight.w700)),
    ),
  );
}

class ActivityTile extends StatelessWidget {
  final String title, amount, date;
  const ActivityTile({super.key, required this.title, required this.amount, required this.date});
  @override
  Widget build(BuildContext context) => Card(child: ListTile(
    leading: const Icon(Icons.currency_exchange, color: Color(0xFFB7A8FF)),
    title: Text(title),
    subtitle: Text(date),
    trailing: Text(amount, style: const TextStyle(color: Color(0xFF83D9A8), fontWeight: FontWeight.bold)),
  ));
}

class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: const Color(0xFF29263B), borderRadius: BorderRadius.circular(16)),
    child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(Icons.info_outline, color: Color(0xFFB7A8FF)),
      SizedBox(width: 10),
      Expanded(child: Text('DEMO ONLY: No real surveys, partner accounts, cash balance, or withdrawals are connected. Partner integrations require approval and verified server-side callbacks.')),
    ]),
  );
}
