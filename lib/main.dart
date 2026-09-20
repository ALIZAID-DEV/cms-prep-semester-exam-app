import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'content_repository.dart';
import 'past_papers.dart';

final ValueNotifier<ThemeMode> cmsThemeMode = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const CmsPrepApp());
}

class CmsPrepApp extends StatefulWidget {
  const CmsPrepApp({super.key});

  @override
  State<CmsPrepApp> createState() => _CmsPrepAppState();
}

class _CmsPrepAppState extends State<CmsPrepApp> {
  void toggleTheme() {
    cmsThemeMode.value = cmsThemeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: cmsThemeMode,
      builder: (context, mode, _) => MaterialApp(
        title: 'CMS Prep',
        debugShowCheckedModeBanner: false,
        themeMode: mode,
        theme: buildTheme(Brightness.light),
        darkTheme: buildTheme(Brightness.dark),
        home: StudentHome(onToggleTheme: toggleTheme),
      ),
    );
  }

  ThemeData buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = isDark
        ? const ColorScheme.dark(
            primary: Color(0xFF00F5D4),
            onPrimary: Color(0xFF001512),
            secondary: Color(0xFFFF2BD6),
            onSecondary: Colors.white,
            tertiary: Color(0xFF9B5CFF),
            surface: Color(0xFF0D1426),
            surfaceContainerHighest: Color(0xFF18223A),
          )
        : ColorScheme.fromSeed(seedColor: const Color(0xFF197A62), brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme.copyWith(
        surface: isDark ? const Color(0xFF0D1426) : const Color(0xFFFFFFFF),
        surfaceContainerHighest: isDark ? const Color(0xFF18223A) : const Color(0xFFEAF2EF),
      ),
      scaffoldBackgroundColor: isDark ? const Color(0xFF050812) : const Color(0xFFF6F8F7),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: isDark ? const Color(0xFF070B18) : const Color(0xFFF6F8F7),
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        elevation: isDark ? 2 : 0,
        shadowColor: isDark ? const Color(0xFF000000) : Colors.transparent,
        color: isDark ? const Color(0xFF0D1426) : Colors.white,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: isDark ? const Color(0xFF22365B) : const Color(0xFFE2ECE8))),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class Subject {
  final String code;
  final String title;
  final IconData icon;
  final Color color;

  const Subject(this.code, this.title, this.icon, this.color);
}

const subjects = <Subject>[
  Subject('ICT', 'Application and Information Technology', Icons.computer, Color(0xFF2D8A72)),
  Subject('PF', 'Programming Fundamentals', Icons.code, Color(0xFF5B6FF5)),
  Subject('FE', 'Functional English', Icons.menu_book, Color(0xFFA855C7)),
  Subject('QURAN', 'Understanding of Holy Quran', Icons.auto_stories, Color(0xFFB7791F)),
  Subject('PAK', 'Ideology and Constitution of Pakistan', Icons.account_balance, Color(0xFF32915E)),
  Subject('FA', 'Financial Accounting', Icons.calculate, Color(0xFFE0772E)),
  Subject('DA', 'Digital Arts', Icons.palette, Color(0xFFD94686)),
  Subject('HISTORY', 'History', Icons.history_edu, Color(0xFF8B5E3C)),
];

class CmsLogo extends StatelessWidget {
  final double size;
  const CmsLogo({this.size = 54, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 1.55,
      height: size,
      child: Image.asset('assets/branding/cms_logo_icon.png', fit: BoxFit.contain),
    );
  }
}

class RoleSelectionScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const RoleSelectionScreen({required this.onToggleTheme, super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 28),
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF050812),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: const Color(0xFF8C2DFF).withValues(alpha: .18), blurRadius: 20, offset: const Offset(0, 8))],
              ),
              child: Image.asset('assets/branding/cms_logo_transparent.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 14),
            Row(children: [
              const CmsLogo(size: 58),
              const SizedBox(width: 13),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('CMS Prep', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                Text('Your semester, your comeback.', style: TextStyle(fontSize: 13)),
                Text('Concept & Content by MICKEY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700)),
              ])),
              const ThemeToggleButton(),
            ]),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 22),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [primary, Color.lerp(primary, const Color(0xFF102F2A), .65)!], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [BoxShadow(color: primary.withValues(alpha: .22), blurRadius: 22, offset: const Offset(0, 10))],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [const Icon(Icons.auto_awesome, color: Color(0xFFFFD166)), const SizedBox(width: 8), Text('BSCS • SEMESTER 1', style: TextStyle(color: Colors.white.withValues(alpha: .78), fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.2))]),
                const SizedBox(height: 17),
                const Text('Ready to level up\nyour preparation?', style: TextStyle(color: Colors.white, fontSize: 30, height: 1.08, fontWeight: FontWeight.w900)),
                const SizedBox(height: 12),
                Text('Learn concepts. Practice smart. Walk into finals with confidence.', style: TextStyle(color: Colors.white.withValues(alpha: .82), fontSize: 14, height: 1.4)),
                const SizedBox(height: 20),
                Row(children: [
                  _HeroStat(value: '08', label: 'Subjects'),
                  const SizedBox(width: 10),
                  _HeroStat(value: '24/7', label: 'Offline access'),
                  const SizedBox(width: 10),
                  _HeroStat(value: 'A+', label: 'Mindset'),
                ]),
              ]),
            ),
            const SizedBox(height: 28),
            const Text('Choose your space', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 6),
            Text('Start where you need to be today.', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            const SizedBox(height: 14),
            RoleCard(icon: Icons.school_rounded, title: 'Student space', subtitle: 'Lectures, notes, MCQs and progress', color: const Color(0xFF2D8A72), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StudentHome(onToggleTheme: onToggleTheme)))),
            const SizedBox(height: 12),
            RoleCard(icon: Icons.admin_panel_settings_rounded, title: 'Admin space', subtitle: 'Manage subjects, lectures and MCQs', color: const Color(0xFF5B6FF5), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AdminHome(onToggleTheme: onToggleTheme)))),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.lock_outline, size: 15, color: Theme.of(context).colorScheme.onSurfaceVariant), const SizedBox(width: 6), Text('Offline first • Secure foundation for future Firebase', style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.onSurfaceVariant))]),
          ],
        ),
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;
  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), decoration: BoxDecoration(color: Colors.white.withValues(alpha: .12), borderRadius: BorderRadius.circular(14)), child: Column(children: [Text(value, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w900)), const SizedBox(height: 2), Text(label, style: TextStyle(color: Colors.white.withValues(alpha: .75), fontSize: 10), textAlign: TextAlign.center)])));
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon; final String title; final String subtitle; final Color color; final VoidCallback onTap;
  const RoleCard({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(padding: const EdgeInsets.all(18), child: Row(children: [
          CircleAvatar(radius: 27, backgroundColor: color.withValues(alpha: .14), foregroundColor: color, child: Icon(icon, size: 28)),
          const SizedBox(width: 15),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)), const SizedBox(height: 4), Text(subtitle, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant))])),
          const Icon(Icons.arrow_forward_ios_rounded, size: 17),
        ])),
      ),
    );
  }
}

class StudentHome extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const StudentHome({required this.onToggleTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leadingWidth: 58, leading: const Padding(padding: EdgeInsets.only(left: 10), child: CmsLogo(size: 34)), title: const Text('CMS Prep', style: TextStyle(fontWeight: FontWeight.w900)), actions: [const ThemeToggleButton(), const Padding(padding: EdgeInsets.only(right: 12), child: CircleAvatar(child: Icon(Icons.person_outline)))]),
      body: ListView(padding: const EdgeInsets.fromLTRB(18, 10, 18, 28), children: [
        const Text('Assalam-o-Alaikum!', style: TextStyle(fontSize: 15)),
        const SizedBox(height: 4),
        const Text('Ready for your finals?', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
        const SizedBox(height: 18),
        Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1E8068), Color(0xFF164E42)]), borderRadius: BorderRadius.circular(24)), child: const Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Preparation glow', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w900)), SizedBox(height: 7), Text('Small steps today, confident exams tomorrow.', style: TextStyle(color: Colors.white70, height: 1.35))])), Icon(Icons.auto_awesome, color: Colors.white, size: 45)])),
        const SizedBox(height: 18),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudyRoadmapScreen())),
            child: Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(gradient: LinearGradient(colors: [const Color(0xFF101A38), const Color(0xFF281340)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(children: [
                const Icon(Icons.route_rounded, color: Color(0xFF00F5D4), size: 30),
                const SizedBox(width: 13),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Passing-focused roadmap', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)), SizedBox(height: 4), Text('Daily plan, high-yield topics aur revision order', style: TextStyle(color: Colors.white70, fontSize: 12))])),
                const Icon(Icons.arrow_forward_rounded, color: Color(0xFFFF2BD6)),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Your subjects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), Text('${subjects.length} subjects', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700))]),
        const SizedBox(height: 12),
        GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: subjects.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .98), itemBuilder: (context, index) => SubjectCard(subject: subjects[index])),
        const MickeyFooter(),
      ]),
    );
  }
}

class StudyRoadmapScreen extends StatelessWidget {
  const StudyRoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final steps = <Map<String, String>>[
      {'day': 'Days 1–3', 'title': 'Financial Accounting foundation', 'body': 'Accounting equation, debit/credit, journal, ledger, trial balance. Har topic ke examples solve karo.'},
      {'day': 'Days 4–6', 'title': 'Programming Fundamentals', 'body': 'Problem solving, algorithms, flowcharts, variables, conditions, loops, arrays aur functions.'},
      {'day': 'Days 7–9', 'title': 'ICT + History', 'body': 'ICT definitions/differences aur History ki chronology: Sindh, Sultanate, Mughals, 1857.'},
      {'day': 'Days 10–11', 'title': 'Functional English + Quran', 'body': 'Grammar, tenses, paragraph structure, comprehension aur Quran ke themes/practical lessons.'},
      {'day': 'Day 12', 'title': 'MCQ and important-question day', 'body': 'Har subject ke MCQs attempt karo. Wrong answers ki separate mistake list banao.'},
      {'day': 'Day 13', 'title': 'Past-paper writing practice', 'body': 'Timed answers likho: introduction, headings, examples, conclusion. Sirf reading par depend mat karo.'},
      {'day': 'Day 14', 'title': 'Final revision', 'body': 'Formulae, definitions, dates, diagrams aur mistake list revise karo. Neend aur exam stationery ready rakho.'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Passing Roadmap', style: TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: ListView(padding: const EdgeInsets.fromLTRB(18, 10, 18, 28), children: [
        Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF101A38), Color(0xFF281340)]), borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFF00F5D4).withValues(alpha: .35))), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Supply se bachne ka smart plan', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)), SizedBox(height: 8), Text('Guarantee koi app nahi de sakti, lekin daily active practice, writing aur revision se passing chance strong hota hai.', style: TextStyle(color: Colors.white70, height: 1.4))])),
        const SizedBox(height: 18),
        Text('Two-week high-yield sequence', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: scheme.onSurface)),
        const SizedBox(height: 10),
        for (final step in steps)
          Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF00F5D4).withValues(alpha: .13),
                foregroundColor: const Color(0xFF00A98F),
                child: const Icon(Icons.check_rounded),
              ),
              title: Text('${step['day']} • ${step['title']}', style: const TextStyle(fontWeight: FontWeight.w900)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(step['body'] ?? '', style: const TextStyle(height: 1.35)),
              ),
            ),
          ),
        const SizedBox(height: 10),
        Card(child: Padding(padding: const EdgeInsets.all(17), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Daily rule', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)), const SizedBox(height: 8), Text('3 study blocks rakho: 90 minutes concept lecture, 60 minutes written practice, 30 minutes MCQs and mistake review. Har raat next day ke 3 targets likho.', style: TextStyle(color: scheme.onSurfaceVariant, height: 1.45))]))),
        const SizedBox(height: 10),
        Card(child: Padding(padding: const EdgeInsets.all(17), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Exam-answer checklist', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)), const SizedBox(height: 8), Text('Question ko underline karo, short introduction do, headings use karo, examples/diagrams add karo, aur conclusion se answer close karo. Blank na chhoro; jo relevant concept aata ho usay organized way mein explain karo.', style: TextStyle(color: scheme.onSurfaceVariant, height: 1.45))]))),
        const MickeyFooter(),
      ]),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final Subject subject;
  const SubjectCard({required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SubjectScreen(subject: subject))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(radius: 23, backgroundColor: subject.color.withValues(alpha: .14), foregroundColor: subject.color, child: Icon(subject.icon)),
            const Spacer(),
            Text(subject.code, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: subject.color)),
            const SizedBox(height: 5),
            Text(subject.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            const Row(children: [Text('Open subject', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)), Spacer(), Icon(Icons.arrow_outward_rounded, size: 16)]),
          ]),
        ),
      ),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final Subject subject;
  const SubjectScreen({required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    final lectureCount = lectureAssets[subject.code]?.length ?? 0;
    final primary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(title: Text(subject.code, style: const TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [subject.color, Color.lerp(subject.color, Colors.black, .35)!], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                CircleAvatar(radius: 27, backgroundColor: Colors.white.withValues(alpha: .18), foregroundColor: Colors.white, child: Icon(subject.icon, size: 28)),
                const Spacer(),
                Text('$lectureCount lectures', style: TextStyle(color: Colors.white.withValues(alpha: .82), fontWeight: FontWeight.w700)),
              ]),
              const SizedBox(height: 22),
              Text(subject.title, style: const TextStyle(color: Colors.white, fontSize: 22, height: 1.15, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              Text('Semester 1 • Study zone', style: TextStyle(color: Colors.white.withValues(alpha: .8))),
            ]),
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(padding: const EdgeInsets.all(17), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [const Text('Your progress', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)), const Spacer(), Text('0%', style: TextStyle(color: primary, fontWeight: FontWeight.w900))]),
              const SizedBox(height: 11),
              ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: 0, minHeight: 9, backgroundColor: primary.withValues(alpha: .12), color: primary)),
              const SizedBox(height: 9),
              Text('Start your first lecture to build momentum.', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ])),
          ),
          const SizedBox(height: 22),
          const Text('Study actions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 11),
          SubjectActionCard(number: '01', icon: Icons.play_lesson_rounded, title: 'Learn with lectures', subtitle: 'Read organized chapters and key concepts', color: subject.color, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LectureScreen(subject: subject)))),
          SubjectActionCard(number: '02', icon: Icons.style_rounded, title: 'Flashcards', subtitle: 'Quick revision: tap a card to reveal the answer', color: const Color(0xFFA855C7), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardsScreen(subject: subject)))),
          SubjectActionCard(number: '03', icon: Icons.quiz_rounded, title: 'Practice MCQs', subtitle: 'Subject-wise quiz with instant explanations', color: primary, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(subject: subject)))),
          SubjectActionCard(number: '04', icon: Icons.history_edu_rounded, title: 'Past papers & important questions', subtitle: 'Prepare the questions most likely to matter', color: const Color(0xFF8B5E3C), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ExamPrepScreen(subject: subject)))),
          SubjectActionCard(number: '05', icon: Icons.insights_rounded, title: 'Review progress', subtitle: 'Find weak topics and revise smarter', color: const Color(0xFFE0772E), onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Progress tracking will be enabled with your study activity.')))),
          const MickeyFooter(),
        ],
      ),
    );
  }
}

class SubjectActionCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  const SubjectActionCard({required this.number, required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 11),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(15), child: Row(children: [
          Text(number, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: color)),
          const SizedBox(width: 13),
          CircleAvatar(radius: 23, backgroundColor: color.withValues(alpha: .13), foregroundColor: color, child: Icon(icon)),
          const SizedBox(width: 13),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)), const SizedBox(height: 4), Text(subtitle, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant))])),
          Icon(Icons.arrow_forward_rounded, color: color),
        ])),
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  final IconData icon; final String title; final String subtitle; final Color color; final VoidCallback onTap;
  const ActionTile({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: .14), foregroundColor: color, child: Icon(icon)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }
}

class LectureScreen extends StatefulWidget {
  final Subject subject;
  const LectureScreen({required this.subject, super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  String language = 'Roman Urdu + English';

  @override
  Widget build(BuildContext context) {
    final subject = widget.subject;
    final files = lectureAssets[subject.code] ?? const <String>[];
    final videos = videoAssets[subject.code] ?? const <Map<String, String>>[];
    return Scaffold(
      appBar: AppBar(title: Text('${subject.code} Lectures', style: const TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: subject.color.withValues(alpha: .12), borderRadius: BorderRadius.circular(22)),
            child: Row(children: [
              Icon(Icons.auto_awesome, color: subject.color, size: 35),
              const SizedBox(width: 13),
              Expanded(child: Text(files.isNotEmpty || videos.isNotEmpty ? 'Offline lectures ready hain' : 'Source notes required', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
            ]),
          ),
          const SizedBox(height: 8),
          Text(files.isNotEmpty || videos.isNotEmpty ? '${files.length} notes • ${videos.length} narrated videos available offline' : 'Is subject ke handwritten notes ya PDFs abhi source folder mein available nahi hain.', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12, height: 1.35)),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  CircleAvatar(backgroundColor: subject.color.withValues(alpha: .13), foregroundColor: subject.color, child: const Icon(Icons.translate_rounded)),
                  const SizedBox(width: 12),
                  const Expanded(child: Text('Lecture format', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900))),
                  Chip(label: Text(language, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700))),
                ]),
                const SizedBox(height: 10),
                Text('Available narration: Roman Urdu + English. Voice is embedded in each prepared video; there are no fake voice options.', style: TextStyle(fontSize: 12, height: 1.4, color: Theme.of(context).colorScheme.onSurfaceVariant)),
                if (videos.isNotEmpty) ...[
                  const SizedBox(height: 13),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: subject.color, foregroundColor: Colors.white),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OfflineVideoScreen(title: videos.first['title'] ?? 'Video lecture', assetPath: videos.first['path'] ?? '', color: subject.color))),
                    icon: const Icon(Icons.play_circle_fill_rounded),
                    label: Text('Play first video • ${videos.length} available'),
                  ),
                ],
              ]),
            ),
          ),
          const SizedBox(height: 20),
          Text('${files.length} lecture files', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          if (files.isEmpty)
            const Card(child: Padding(padding: EdgeInsets.all(20), child: Text('Is subject ka content abhi add nahi hua.')))
          else
            ...files.asMap().entries.map((entry) => LectureFileTile(index: entry.key + 1, assetPath: entry.value, color: subject.color)),
          if ((videoAssets[subject.code] ?? const []).isNotEmpty) ...[
            const SizedBox(height: 22),
            const Text('Video lectures', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
            const SizedBox(height: 10),
            ...videoAssets[subject.code]!.map((video) => VideoLectureTile(video: video, color: subject.color)),
          ],
          const MickeyFooter(),
        ],
      ),
    );
  }
}

class LectureFileTile extends StatelessWidget {
  final int index;
  final String assetPath;
  final Color color;
  const LectureFileTile({required this.index, required this.assetPath, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    final fileName = prettyLectureTitle(assetPath);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: .14), foregroundColor: color, child: Text('$index', style: const TextStyle(fontWeight: FontWeight.w900))),
        title: Text(fileName, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: const Text('Lecture explanation, exam points aur MCQs'),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ContentReaderScreen(title: fileName, assetPath: assetPath, color: color))),
      ),
    );
  }
}

String prettyLectureTitle(String assetPath) {
  var name = assetPath.split('/').last.replaceAll('.md', '');
  name = name.replaceFirst(RegExp(r'^Archive-'), '');
  name = name.replaceFirst(RegExp(r'^\d+[-_]?'), '');
  name = name.replaceAll('_', ' ').replaceAll('-', ' ');
  name = name.replaceAll(RegExp(r'\s+'), ' ').trim();
  return name.split(' ').map((word) => word.isEmpty ? word : '${word[0].toUpperCase()}${word.substring(1)}').join(' ');
}

class ContentReaderScreen extends StatelessWidget {
  final String title;
  final String assetPath;
  final Color color;
  const ContentReaderScreen({required this.title, required this.assetPath, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: FutureBuilder<String>(
        future: rootBundle.loadString(assetPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return const Center(child: Text('Content load nahi ho saka.'));
          final content = snapshot.data ?? '';
          final sectionCount = content.split('\n').where((line) {
            final value = line.trim();
            if (value.isEmpty) return false;
            if (value.startsWith('#')) return true;
            final letters = value.replaceAll(RegExp(r'[^A-Za-z]'), '');
            return letters.length >= 4 && letters == letters.toUpperCase();
          }).length.clamp(1, 99);
          final wordCount = content.trim().isEmpty ? 1 : content.trim().split(' ').where((word) => word.trim().isNotEmpty).length;
          final readingMinutes = (wordCount / 170).ceil().clamp(1, 99);
          final compact = MediaQuery.sizeOf(context).width < 700;
          return ListView(
            padding: EdgeInsets.fromLTRB(compact ? 14 : 24, compact ? 10 : 18, compact ? 14 : 24, 34),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [color.withValues(alpha: .22), color.withValues(alpha: .06)]),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: color.withValues(alpha: .35)),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: color.withValues(alpha: .18), borderRadius: BorderRadius.circular(30)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.auto_awesome_rounded, size: 14, color: color), const SizedBox(width: 6), Text('STUDY MODE', style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.1))])),
                    const Spacer(),
                    Icon(Icons.menu_book_rounded, size: 17, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ]),
                  const SizedBox(height: 14),
                  Text(title, style: TextStyle(fontSize: compact ? 23 : 27, fontWeight: FontWeight.w900, height: 1.12, letterSpacing: -.2)),
                  const SizedBox(height: 9),
                  Text('Exam-focused lecture • Roman Urdu + English', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12.5, height: 1.3)),
                  const SizedBox(height: 16),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    _StudyMetaChip(icon: Icons.timer_outlined, label: '$readingMinutes min read', color: color),
                    _StudyMetaChip(icon: Icons.view_agenda_outlined, label: '$sectionCount sections', color: color),
                    const _StudyMetaChip(icon: Icons.offline_bolt_outlined, label: 'Offline ready', color: null),
                  ]),
                ]),
              ),
              const SizedBox(height: 16),
              StudyMarkdownBody(markdown: snapshot.data ?? 'No content', accent: color),
              const SizedBox(height: 12),
              const MickeyFooter(),
            ],
          );
        },
      ),
    );
  }
}

class _StudyMetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _StudyMetaChip({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final tint = color ?? Theme.of(context).colorScheme.onSurfaceVariant;
    return Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7), decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface.withValues(alpha: .52), borderRadius: BorderRadius.circular(30), border: Border.all(color: tint.withValues(alpha: .18))), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 14, color: tint), const SizedBox(width: 6), Text(label, style: TextStyle(fontSize: 11, color: tint, fontWeight: FontWeight.w700))]));
  }
}

class StudyMarkdownBody extends StatelessWidget {
  final String markdown;
  final Color accent;
  const StudyMarkdownBody({required this.markdown, required this.accent, super.key});

  @override
  Widget build(BuildContext context) {
    final pillarMatch = RegExp(r'FOUR PILLARS OF[\s\S]*?\f').firstMatch(markdown);
    if (pillarMatch != null && markdown.contains('ALGORITHM DESIGN')) {
      final remaining = markdown.replaceRange(pillarMatch.start, pillarMatch.end, '');
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ComputationalThinkingCard(accent: accent),
        if (remaining.trim().isNotEmpty) StudyMarkdownBody(markdown: remaining, accent: accent),
      ]);
    }
    final lines = markdown.replaceAll('\r', '').replaceAll('\f', '\n\n').split('\n');
    final widgets = <Widget>[];
    final paragraph = <String>[];
    final compact = MediaQuery.sizeOf(context).width < 700;
    final bodySize = compact ? 14.5 : 15.5;
    final bodyHeight = compact ? 1.55 : 1.62;
    String cleanLine(String value) => value
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'^\s*[|]+\s*'), '')
        .trim();

    bool isHeading(String value) {
      if (value.startsWith('#')) return true;
      if (value.length < 4 || value.length > 90) return false;
      final letters = value.replaceAll(RegExp(r'[^A-Za-z]'), '');
      if (letters.isEmpty) return false;
      final upper = letters.replaceAll(RegExp(r'[A-Z]'), '').isEmpty;
      final looksLikeLabel = value.endsWith(':') && value.split(' ').length <= 9;
      return upper || value.endsWith('?') || looksLikeLabel;
    }
    void flushParagraph() {
      if (paragraph.isEmpty) return;
      widgets.add(Container(margin: const EdgeInsets.only(bottom: 16), padding: EdgeInsets.symmetric(horizontal: compact ? 14 : 18, vertical: compact ? 13 : 16), decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: .30), borderRadius: BorderRadius.circular(16)), child: Text(paragraph.join(' '), style: TextStyle(fontSize: bodySize, height: bodyHeight, letterSpacing: .1))));
      paragraph.clear();
    }
    void addBullet(String text) {
      flushParagraph();
      widgets.add(Container(margin: const EdgeInsets.only(bottom: 10), padding: EdgeInsets.symmetric(horizontal: compact ? 13 : 16, vertical: compact ? 11 : 13), decoration: BoxDecoration(color: accent.withValues(alpha: .08), borderRadius: BorderRadius.circular(14), border: Border.all(color: accent.withValues(alpha: .20))), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('•', style: TextStyle(color: accent, fontSize: compact ? 19 : 21, fontWeight: FontWeight.w900)), const SizedBox(width: 10), Expanded(child: Text(text.trim(), style: TextStyle(fontSize: compact ? 14 : 14.8, height: 1.5)))])));
    }
    for (final raw in lines) {
      final line = cleanLine(raw);
      if (line.isEmpty) { flushParagraph(); continue; }
      // Extracted slide decks often use indentation to represent columns.
      // Never merge those visual rows into one long paragraph.
      final hasColumnSpacing = RegExp(r'\s{5,}').hasMatch(raw.trimRight());
      if (hasColumnSpacing && paragraph.isNotEmpty) flushParagraph();
      if (isHeading(line)) {
        flushParagraph();
        final level = line.startsWith('###') ? 3 : line.startsWith('##') ? 2 : 1;
        final text = line.replaceFirst(RegExp(r'^#+\s*'), '').trim();
        widgets.add(Container(margin: EdgeInsets.only(top: level == 1 ? 14 : 18, bottom: 10), padding: EdgeInsets.fromLTRB(compact ? 13 : 17, compact ? 12 : 15, compact ? 11 : 15, compact ? 12 : 15), decoration: BoxDecoration(color: accent.withValues(alpha: .11), borderRadius: BorderRadius.circular(16), border: Border(left: BorderSide(color: accent, width: compact ? 4 : 5))), child: Text(text, style: TextStyle(fontSize: level == 1 ? (compact ? 21 : 24) : level == 2 ? (compact ? 18 : 20) : (compact ? 15.5 : 17), fontWeight: FontWeight.w900, height: 1.25, letterSpacing: .1))));
      } else if (line.startsWith('- ') || line.startsWith('* ') || line.startsWith('•') || line.startsWith('Ø') || line.startsWith('') || line.startsWith('▪') || line.startsWith('●') || line.startsWith('➢')) {
        addBullet(line.replaceFirst(RegExp(r'^[-*•Ø▪●➢]\s*'), ''));
      } else if (RegExp(r'^\d+[.)]\s*').hasMatch(line)) {
        flushParagraph();
        final match = RegExp(r'^(\d+[.)])\s*(.*)$').firstMatch(line);
        widgets.add(Container(margin: const EdgeInsets.only(bottom: 10), padding: EdgeInsets.symmetric(horizontal: compact ? 13 : 16, vertical: compact ? 11 : 13), decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: .52), borderRadius: BorderRadius.circular(14)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(match?.group(1) ?? '', style: TextStyle(color: accent, fontWeight: FontWeight.w900, fontSize: compact ? 14 : 15)), const SizedBox(width: 10), Expanded(child: Text(match?.group(2) ?? line, style: TextStyle(fontSize: compact ? 14 : 14.8, height: 1.5)))])));
      } else {
        paragraph.add(line.replaceAll('`', ''));
      }
    }
    flushParagraph();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}

class ComputationalThinkingCard extends StatelessWidget {
  final Color accent;
  const ComputationalThinkingCard({required this.accent, super.key});

  @override
  Widget build(BuildContext context) {
    final pillars = <Map<String, String>>[
      {'number': '01', 'title': 'Decomposition', 'body': 'Break a large problem into smaller, manageable parts.'},
      {'number': '02', 'title': 'Pattern Recognition', 'body': 'Find similarities and repeated patterns.'},
      {'number': '03', 'title': 'Abstraction', 'body': 'Focus only on the important details.'},
      {'number': '04', 'title': 'Algorithm Design', 'body': 'Create a clear step-by-step solution.'},
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [accent.withValues(alpha: .15), Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: .55)]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withValues(alpha: .3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Four pillars of computational thinking', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: accent)),
        const SizedBox(height: 5),
        Text('A simple framework for solving problems logically.', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant)),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pillars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.05),
          itemBuilder: (context, index) {
            final pillar = pillars[index];
            return Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(15), border: Border.all(color: accent.withValues(alpha: .22))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(pillar['number']!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: accent)),
                const SizedBox(height: 7),
                Text(pillar['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                const SizedBox(height: 5),
                Expanded(child: Text(pillar['body']!, style: TextStyle(fontSize: 11.5, height: 1.3, color: Theme.of(context).colorScheme.onSurfaceVariant))),
              ]),
            );
          },
        ),
      ]),
    );
  }
}

class FlashcardsScreen extends StatefulWidget {
  final Subject subject;
  const FlashcardsScreen({required this.subject, super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int index = 0;
  bool revealed = false;

  @override
  Widget build(BuildContext context) {
    final cards = flashcardsForSubject(widget.subject.code);
    final card = cards.isEmpty ? null : cards[index];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.subject.code} Flashcards', style: const TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: cards.isEmpty ? const Center(child: Text('Is subject ke flashcards baad mein add honge.')) : ListView(padding: const EdgeInsets.all(18), children: [
        Text('Quick revision', style: TextStyle(color: widget.subject.color, fontWeight: FontWeight.w900)),
        const SizedBox(height: 5),
        Text('Card ${index + 1} of ${cards.length}', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        const SizedBox(height: 16),
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => setState(() => revealed = !revealed),
          child: AnimatedContainer(duration: const Duration(milliseconds: 180), constraints: const BoxConstraints(minHeight: 300), padding: const EdgeInsets.all(24), decoration: BoxDecoration(gradient: LinearGradient(colors: [widget.subject.color, Color.lerp(widget.subject.color, Colors.black, .35)!]), borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: widget.subject.color.withValues(alpha: .25), blurRadius: 20, offset: const Offset(0, 9))]), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(revealed ? Icons.lightbulb_rounded : Icons.help_center_rounded, color: Colors.white, size: 42),
            const SizedBox(height: 20),
            Text(revealed ? 'ANSWER' : 'QUESTION', style: TextStyle(color: Colors.white.withValues(alpha: .75), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.4)),
            const SizedBox(height: 12),
            Text(revealed ? card!.explanation : card!.question, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 22, height: 1.25, fontWeight: FontWeight.w900)),
            const SizedBox(height: 18),
            Text(revealed ? 'Tap to see question' : 'Tap to reveal answer', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ])),
        ),
        const SizedBox(height: 18),
        Row(children: [
          Expanded(child: OutlinedButton.icon(onPressed: index == 0 ? null : () => setState(() { index--; revealed = false; }), icon: const Icon(Icons.arrow_back_rounded), label: const Text('Previous'))),
          const SizedBox(width: 10),
          Expanded(child: FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: widget.subject.color), onPressed: index == cards.length - 1 ? null : () => setState(() { index++; revealed = false; }), icon: const Icon(Icons.arrow_forward_rounded), label: const Text('Next'))),
        ]),
        const MickeyFooter(),
      ]),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final Subject subject;
  const QuizScreen({required this.subject, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;
  int? selected;
  bool finished = false;

  void choose(int option, List<PracticeMcq> questions) {
    if (selected != null) return;
    setState(() { selected = option; if (option == questions[index].answerIndex) score++; });
  }

  @override
  Widget build(BuildContext context) {
    final questions = mcqsForSubject(widget.subject.code);
    if (questions.isEmpty) return Scaffold(appBar: AppBar(title: Text('${widget.subject.code} MCQs')), body: const Center(child: Text('Is subject ke MCQs baad mein add honge.')));
    if (finished) return Scaffold(appBar: AppBar(title: Text('${widget.subject.code} MCQs')), body: Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.emoji_events_rounded, color: widget.subject.color, size: 64), const SizedBox(height: 14), Text('Quiz complete', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900)), const SizedBox(height: 8), Text('$score / ${questions.length}', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: widget.subject.color)), const SizedBox(height: 18), FilledButton(onPressed: () => setState(() { index = 0; score = 0; selected = null; finished = false; }), child: const Text('Try again'))]))));
    final question = questions[index];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.subject.code} MCQs', style: const TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Row(children: [Text('Question ${index + 1} of ${questions.length}', style: const TextStyle(fontWeight: FontWeight.w900)), const Spacer(), Text('Score $score', style: TextStyle(color: widget.subject.color, fontWeight: FontWeight.w900))]),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: (index + 1) / questions.length, color: widget.subject.color, backgroundColor: widget.subject.color.withValues(alpha: .12), minHeight: 8),
        const SizedBox(height: 20),
        Card(child: Padding(padding: const EdgeInsets.all(20), child: Text(question.question, style: const TextStyle(fontSize: 20, height: 1.3, fontWeight: FontWeight.w900)))),
        const SizedBox(height: 14),
        ...question.options.asMap().entries.map((entry) {
          final isCorrect = entry.key == question.answerIndex;
          final isSelected = entry.key == selected;
          final color = selected == null ? Theme.of(context).colorScheme.surfaceContainerHighest : isCorrect ? Colors.green.withValues(alpha: .15) : isSelected ? Colors.red.withValues(alpha: .15) : Theme.of(context).colorScheme.surfaceContainerHighest;
          return Card(margin: const EdgeInsets.only(bottom: 10), color: color, child: InkWell(onTap: () => choose(entry.key, questions), borderRadius: BorderRadius.circular(20), child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [CircleAvatar(radius: 16, backgroundColor: widget.subject.color.withValues(alpha: .13), foregroundColor: widget.subject.color, child: Text(String.fromCharCode(65 + entry.key), style: const TextStyle(fontWeight: FontWeight.w900))), const SizedBox(width: 12), Expanded(child: Text(entry.value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))), if (selected != null && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.green), if (selected != null && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.red)]))));
        }),
        if (selected != null) ...[
          const SizedBox(height: 5),
          Container(padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: widget.subject.color.withValues(alpha: .1), borderRadius: BorderRadius.circular(16)), child: Text(question.explanation, style: const TextStyle(height: 1.4, fontWeight: FontWeight.w600))),
          const SizedBox(height: 14),
          FilledButton(onPressed: () => setState(() { if (index == questions.length - 1) { finished = true; } else { index++; selected = null; } }), child: Text(index == questions.length - 1 ? 'See result' : 'Next question')),
        ],
        const MickeyFooter(),
      ]),
    );
  }
}

class EmptyContentScreen extends StatelessWidget {
  final Subject subject; final String title; final String message; final IconData icon;
  const EmptyContentScreen({required this.subject, required this.title, required this.message, required this.icon, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${subject.code} Content'), actions: const [ThemeToggleButton()]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, size: 65, color: subject.color),
            const SizedBox(height: 18),
            Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900), textAlign: TextAlign.center),
            const SizedBox(height: 9),
            Text(message, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, height: 1.4), textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}

class AdminHome extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const AdminHome({required this.onToggleTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard', style: TextStyle(fontWeight: FontWeight.w900)),
        actions: [
          const ThemeToggleButton(),
          const Padding(padding: EdgeInsets.only(right: 12), child: CircleAvatar(child: Icon(Icons.admin_panel_settings_outlined))),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
        children: [
          const Text('Content control center', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          const SizedBox(height: 7),
          Text('Yahan se CMS Prep ka study material manage hoga.', style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: StatCard(value: '${subjects.length}', label: 'Subjects', icon: Icons.menu_book_rounded)),
            const SizedBox(width: 12),
            const Expanded(child: StatCard(value: '0', label: 'Lectures', icon: Icons.play_lesson_rounded)),
            const SizedBox(width: 12),
            const Expanded(child: StatCard(value: '0', label: 'MCQs', icon: Icons.quiz_rounded)),
          ]),
          const SizedBox(height: 22),
          const Text('Manage content', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          ActionTile(icon: Icons.library_books_rounded, title: 'Manage Lectures', subtitle: 'Add chapters, notes and video links', color: const Color(0xFF2D8A72), onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lecture manager will be connected to local content.')))),
          ActionTile(icon: Icons.fact_check_rounded, title: 'Manage MCQs', subtitle: 'Create questions and correct answers', color: const Color(0xFF5B6FF5), onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('MCQ manager will be added with the quiz system.')))),
          ActionTile(icon: Icons.subject_rounded, title: 'Manage Subjects', subtitle: 'Update subject names and sections', color: const Color(0xFFA855C7), onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All seven subjects are currently configured.')))),
          const MickeyFooter(),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String value; final String label; final IconData icon;
  const StatCard({required this.value, required this.label, required this.icon, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 9),
        child: Column(children: [
          Icon(icon, size: 22, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ]),
      ),
    );
  }
}


class ExamPrepScreen extends StatelessWidget {
  final Subject subject;
  const ExamPrepScreen({required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    final questions = importantQuestions.where((item) => item.subjectCode == subject.code).toList();
    return Scaffold(
      appBar: AppBar(title: Text('${subject.code} Exam Prep', style: const TextStyle(fontWeight: FontWeight.w900)), actions: const [ThemeToggleButton()]),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [const Color(0xFF8B5E3C), Color.lerp(const Color(0xFF8B5E3C), Colors.black, .35)!], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.history_edu_rounded, color: Colors.white, size: 34),
              SizedBox(height: 12),
              Text('Exam smart bano', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w900)),
              SizedBox(height: 5),
              Text('Important questions ko revise karo aur official past papers milne par yahan add karenge.', style: TextStyle(color: Colors.white70, height: 1.4)),
            ]),
          ),
          const SizedBox(height: 20),
          const Text('Important questions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 7),
          Text('Ye questions available notes se prepared hain; inhein official past paper na samjha jaye.', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant)),
          const SizedBox(height: 12),
          if (questions.isEmpty)
            const Card(child: Padding(padding: EdgeInsets.all(20), child: Text('Is subject ke questions baad mein add honge.')))
          else
            ...questions.map((item) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(padding: const EdgeInsets.all(16), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.help_outline_rounded, size: 22),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.type, style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w800)), const SizedBox(height: 5), Text(item.question, style: const TextStyle(fontSize: 15, height: 1.35, fontWeight: FontWeight.w700))])),
              ])),
            )),
          const SizedBox(height: 10),
          OutlinedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Official Sindh University past papers yahan add honge jab files milengi.'))), icon: const Icon(Icons.upload_file_outlined), label: const Text('Add official past papers later')),
          const MickeyFooter(),
        ],
      ),
    );
  }
}


class VideoLectureTile extends StatelessWidget {
  final Map<String, String> video;
  final Color color;
  const VideoLectureTile({required this.video, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: .14), foregroundColor: color, child: const Icon(Icons.play_arrow_rounded)),
        title: Text(video['title'] ?? 'Video lecture', style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(video['subtitle'] ?? 'Watch and learn'),
        trailing: Icon(Icons.ondemand_video_rounded, color: color),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OfflineVideoScreen(title: video['title'] ?? 'Video lecture', assetPath: video['path'] ?? '', color: color))),
      ),
    );
  }
}

class OfflineVideoScreen extends StatefulWidget {
  final String title;
  final String assetPath;
  final Color color;
  const OfflineVideoScreen({required this.title, required this.assetPath, required this.color, super.key});

  @override
  State<OfflineVideoScreen> createState() => _OfflineVideoScreenState();
}

class _OfflineVideoScreenState extends State<OfflineVideoScreen> {
  late final VideoPlayerController controller;
  String? _initializationError;
  bool _isScrubbing = false;
  bool _isSeeking = false;
  double _scrubPositionMs = 0;
  bool _wasPlayingBeforeScrub = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.assetPath);
    controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((Object error) {
      if (!mounted) return;
      setState(() => _initializationError = 'Video load nahi ho saki. File dobara check karein.');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _seekToMilliseconds(double milliseconds, {bool resumeAfter = false}) async {
    if (!controller.value.isInitialized || _isSeeking) return;
    final durationMs = controller.value.duration.inMilliseconds;
    if (durationMs <= 0) return;
    final safeMs = milliseconds.round().clamp(0, durationMs).toInt();
    final shouldResume = resumeAfter;
    setState(() => _isSeeking = true);
    try {
      // Pause while committing the new position. This prevents repeated slider
      // callbacks from racing with the platform video element on web.
      if (controller.value.isPlaying) await controller.pause();
      await controller.seekTo(Duration(milliseconds: safeMs));
      if (shouldResume && mounted) await controller.play();
    } finally {
      if (mounted) setState(() => _isSeeking = false);
    }
  }

  Future<void> _seekBy(Duration offset) async {
    if (!controller.value.isInitialized || _isSeeking) return;
    final currentMs = controller.value.position.inMilliseconds.toDouble();
    final wasPlaying = controller.value.isPlaying;
    await _seekToMilliseconds(currentMs + offset.inMilliseconds, resumeAfter: wasPlaying);
  }

  String _formatDuration(Duration value) {
    final minutes = value.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    final hours = value.inHours;
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: [Padding(padding: const EdgeInsets.only(right: 12), child: Icon(Icons.waves_rounded, color: widget.color))],
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 24), children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: widget.color.withValues(alpha: .45)),
            boxShadow: [BoxShadow(color: widget.color.withValues(alpha: .2), blurRadius: 24, spreadRadius: 1)],
            gradient: const LinearGradient(colors: [Color(0xFF101827), Color(0xFF030509)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          clipBehavior: Clip.antiAlias,
          child: _initializationError != null
              ? SizedBox(
                  height: 230,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error_outline_rounded, color: widget.color, size: 38),
                          const SizedBox(height: 10),
                          Text(_initializationError!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, height: 1.4)),
                        ],
                      ),
                    ),
                  ),
                )
              : controller.value.isInitialized
                  ? AspectRatio(aspectRatio: controller.value.aspectRatio, child: VideoPlayer(controller))
                  : const SizedBox(
                      height: 230,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(height: 12),
                            Text('Lecture load ho rahi hai…', style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ),
        ),
        const SizedBox(height: 14),
        if (controller.value.isInitialized)
          ValueListenableBuilder<VideoPlayerValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              final duration = value.duration;
              final actualPosition = value.position > duration ? duration : value.position;
              final maxMs = duration.inMilliseconds > 0 ? duration.inMilliseconds.toDouble() : 1.0;
              final shownMs = (_isScrubbing ? _scrubPositionMs : actualPosition.inMilliseconds.toDouble().clamp(0, maxMs).toDouble());
              return Container(
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: widget.color.withValues(alpha: .2)),
                ),
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                child: Column(children: [
                  Row(children: [
                    Icon(_isSeeking ? Icons.sync_rounded : Icons.play_circle_outline_rounded, color: widget.color, size: 18),
                    const SizedBox(width: 8),
                    Text(_isSeeking ? 'Updating position…' : 'Lecture playback', style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: .4)),
                  ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: widget.color,
                      inactiveTrackColor: widget.color.withValues(alpha: .18),
                      thumbColor: widget.color,
                      overlayColor: widget.color.withValues(alpha: .14),
                      trackHeight: 5,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                    ),
                    child: Slider(
                      value: shownMs.clamp(0, maxMs).toDouble(),
                      min: 0,
                      max: maxMs,
                      onChangeStart: _isSeeking ? null : (value) {
                        _wasPlayingBeforeScrub = controller.value.isPlaying;
                        setState(() {
                          _isScrubbing = true;
                          _scrubPositionMs = value;
                        });
                        if (_wasPlayingBeforeScrub) controller.pause();
                      },
                      onChanged: _isSeeking ? null : (value) => setState(() => _scrubPositionMs = value),
                      onChangeEnd: _isSeeking ? null : (value) async {
                        await _seekToMilliseconds(value, resumeAfter: _wasPlayingBeforeScrub);
                        if (mounted) setState(() => _isScrubbing = false);
                      },
                    ),
                  ),
                  Row(children: [
                    Text(_formatDuration(Duration(milliseconds: shownMs.round())), style: TextStyle(color: scheme.onSurface, fontSize: 12, fontWeight: FontWeight.w800)),
                    const Spacer(),
                    Text(_formatDuration(duration), style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.w700)),
                  ]),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton.filledTonal(tooltip: 'Back 10 seconds', onPressed: _isSeeking ? null : () => _seekBy(const Duration(seconds: -10)), icon: const Icon(Icons.replay_10_rounded)),
                    const SizedBox(width: 18),
                    FloatingActionButton(
                      heroTag: 'play_pause_${widget.assetPath}',
                      elevation: 5,
                      backgroundColor: widget.color,
                      foregroundColor: Colors.white,
                      onPressed: _isSeeking ? null : () => value.isPlaying ? controller.pause() : controller.play(),
                      child: Icon(value.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 30),
                    ),
                    const SizedBox(width: 18),
                    IconButton.filledTonal(tooltip: 'Forward 10 seconds', onPressed: _isSeeking ? null : () => _seekBy(const Duration(seconds: 10)), icon: const Icon(Icons.forward_10_rounded)),
                  ]),
                ]),
              );
            },
          ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: widget.color.withValues(alpha: .1), borderRadius: BorderRadius.circular(18), border: Border.all(color: widget.color.withValues(alpha: .25))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.auto_awesome_rounded, color: widget.color),
            const SizedBox(width: 12),
            const Expanded(child: Text('Roman Urdu + English explanation\nOffline video • Watch, pause, seek, and revise at your own pace.', style: TextStyle(fontWeight: FontWeight.w700, height: 1.45))),
          ]),
        ),
        const MickeyFooter(),
      ]),
    );
  }
}


class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: Theme.of(context).brightness == Brightness.dark ? 'Switch to light mode' : 'Switch to dark mode',
      onPressed: () => cmsThemeMode.value = cmsThemeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
    );
  }
}

class MickeyGlow extends StatefulWidget {
  final bool compact;
  const MickeyGlow({this.compact = false, super.key});

  @override
  State<MickeyGlow> createState() => _MickeyGlowState();
}

class _MickeyGlowState extends State<MickeyGlow> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glow = 0.25 + (_controller.value * 0.35);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: widget.compact ? 9 : 14, vertical: widget.compact ? 5 : 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [const Color(0xFF00F5D4).withValues(alpha: .22), const Color(0xFFFF2BD6).withValues(alpha: .20), const Color(0xFF9B5CFF).withValues(alpha: .18)]),
            border: Border.all(color: const Color(0xFF00F5D4).withValues(alpha: .58), width: 1),
            boxShadow: [
              BoxShadow(color: const Color(0xFF00F5D4).withValues(alpha: glow), blurRadius: 16 + (_controller.value * 12), spreadRadius: 1),
              BoxShadow(color: const Color(0xFFFF2BD6).withValues(alpha: glow * .75), blurRadius: 28 + (_controller.value * 14), spreadRadius: -2),
            ],
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.auto_awesome_rounded, size: widget.compact ? 11 : 14, color: const Color(0xFF00F5D4)),
            const SizedBox(width: 5),
            Text('M I C K E Y', style: TextStyle(fontSize: widget.compact ? 10 : 12, letterSpacing: widget.compact ? 1.5 : 2.3, fontWeight: FontWeight.w900, color: primary)),
          ]),
        );
      },
    );
  }
}

class MickeyFooter extends StatelessWidget {
  const MickeyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.only(top: 22, bottom: 4), child: Center(child: MickeyGlow()));
  }
}
