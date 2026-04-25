import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const CatalogPage(),
    );
  }
}

// ─── Data Models ─────────────────────────────────────────────────────────────

enum CardType { bundle, module, popular }

class CourseItem {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final String? originalPrice;
  final int? savePercent;
  final double? rating;
  final Color cardColor;
  final IconData icon;
  final CardType type;
  final String description;
  final List<String> features;

  const CourseItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    this.originalPrice,
    this.savePercent,
    this.rating,
    required this.cardColor,
    required this.icon,
    required this.type,
    required this.description,
    required this.features,
  });
}

// ─── Data ─────────────────────────────────────────────────────────────────────

final List<CourseItem> bundleItems = [
  CourseItem(
    id: 'b1',
    title: 'Complete UI/UX Career Path',
    subtitle: 'Bundle Course',
    price: 'Rp 499.000',
    originalPrice: 'Rp 899.000',
    savePercent: 40,
    cardColor: const Color(0xFF1A3C5E),
    icon: Icons.layers_rounded,
    type: CardType.bundle,
    description:
        'Kuasai UI/UX dari nol hingga siap kerja. Pelajari Figma, design system, user research, dan portfolio building.',
    features: [
      '12 modul lengkap',
      'Sertifikat kelulusan',
      'Akses seumur hidup',
      'Komunitas eksklusif',
    ],
  ),
  CourseItem(
    id: 'b2',
    title: 'Fullstack Web Masterclass',
    subtitle: 'Bundle Course',
    price: 'Rp 750.000',
    originalPrice: 'Rp 1.200.000',
    savePercent: 35,
    cardColor: const Color(0xFF1A2E4A),
    icon: Icons.code_rounded,
    type: CardType.bundle,
    description:
        'Belajar HTML, CSS, JavaScript, React, Node.js, dan database dalam satu paket lengkap siap kerja.',
    features: [
      '20 modul + proyek nyata',
      'Mentoring 1-on-1',
      'Akses seumur hidup',
      'Job referral program',
    ],
  ),
  CourseItem(
    id: 'b3',
    title: 'Data Science Bootcamp',
    subtitle: 'Bundle Course',
    price: 'Rp 999.000',
    originalPrice: 'Rp 1.500.000',
    savePercent: 33,
    cardColor: const Color(0xFF1B3A2D),
    icon: Icons.bar_chart_rounded,
    type: CardType.bundle,
    description:
        'Kuasai Python, machine learning, visualisasi data, dan analitik bisnis dari para praktisi industri.',
    features: [
      '15 modul data science',
      'Dataset real-world',
      'Akses seumur hidup',
      'Career coaching',
    ],
  ),
  CourseItem(
    id: 'b4',
    title: 'Mobile Dev Complete Pack',
    subtitle: 'Bundle Course',
    price: 'Rp 699.000',
    originalPrice: 'Rp 1.100.000',
    savePercent: 36,
    cardColor: const Color(0xFF3A1A3C),
    icon: Icons.phone_android_rounded,
    type: CardType.bundle,
    description:
        'Pelajari Flutter & React Native untuk membangun aplikasi mobile iOS dan Android secara profesional.',
    features: [
      '18 modul mobile dev',
      'Publish ke App Store',
      'Akses seumur hidup',
      'Source code lengkap',
    ],
  ),
];

final List<CourseItem> moduleItems = [
  CourseItem(
    id: 'm1',
    title: 'Fundamental HTML & CSS',
    subtitle: 'Modul Belajar',
    price: 'Rp 89.000',
    cardColor: const Color(0xFF1C1C1C),
    icon: Icons.html_rounded,
    type: CardType.module,
    description:
        'Modul dasar web development: struktur HTML semantik, styling CSS modern, dan responsive design.',
    features: [
      '6 jam video pembelajaran',
      'Quiz & latihan',
      'Akses seumur hidup',
      'Sertifikat modul',
    ],
  ),
  CourseItem(
    id: 'm2',
    title: 'Modern JS ES6+',
    subtitle: 'Modul Belajar',
    price: 'Rp 99.000',
    cardColor: const Color(0xFF2C2C2C),
    icon: Icons.javascript_rounded,
    type: CardType.module,
    description:
        'Pelajari JavaScript modern: arrow function, async/await, destructuring, module system, dan lebih banyak lagi.',
    features: [
      '8 jam video pembelajaran',
      '30+ latihan coding',
      'Akses seumur hidup',
      'Sertifikat modul',
    ],
  ),
  CourseItem(
    id: 'm3',
    title: 'Flutter Basics',
    subtitle: 'Modul Belajar',
    price: 'Rp 119.000',
    cardColor: const Color(0xFF1A2535),
    icon: Icons.flutter_dash_rounded,
    type: CardType.module,
    description:
        'Mulai perjalanan Flutter-mu: widget, layout, state management dasar, dan bangun app pertamamu.',
    features: [
      '10 jam video pembelajaran',
      'Mini project app',
      'Akses seumur hidup',
      'Sertifikat modul',
    ],
  ),
  CourseItem(
    id: 'm4',
    title: 'Python for Data',
    subtitle: 'Modul Belajar',
    price: 'Rp 109.000',
    cardColor: const Color(0xFF1A2A1A),
    icon: Icons.terminal_rounded,
    type: CardType.module,
    description:
        'Dasar Python untuk data science: pandas, numpy, matplotlib, dan analisis data sederhana.',
    features: [
      '7 jam video pembelajaran',
      'Dataset latihan',
      'Akses seumur hidup',
      'Sertifikat modul',
    ],
  ),
];

final List<CourseItem> popularItems = [
  CourseItem(
    id: 'p1',
    title: 'Figma Design System',
    subtitle: 'Kelas Populer',
    price: 'Rp 249.000',
    rating: 4.9,
    cardColor: const Color(0xFF1A1A1A),
    icon: Icons.design_services_rounded,
    type: CardType.popular,
    description:
        'Bangun design system yang scalable dengan Figma: komponen, token, auto-layout, dan dokumentasi.',
    features: [
      '9 jam video pembelajaran',
      'Template Figma gratis',
      'Akses seumur hidup',
      'Update konten rutin',
    ],
  ),
  CourseItem(
    id: 'p2',
    title: 'Data Analytics Business',
    subtitle: 'Kelas Populer',
    price: 'Rp 299.000',
    rating: 4.8,
    cardColor: const Color(0xFF0D1B2A),
    icon: Icons.analytics_rounded,
    type: CardType.popular,
    description:
        'Analisis data bisnis dengan Excel, Google Sheets, SQL, dan Looker Studio untuk keputusan lebih baik.',
    features: [
      '11 jam video pembelajaran',
      'Case study nyata',
      'Akses seumur hidup',
      'Template dashboard',
    ],
  ),
  CourseItem(
    id: 'p3',
    title: 'UI/UX Masterclass',
    subtitle: 'Kelas Populer',
    price: 'Rp 279.000',
    rating: 4.9,
    cardColor: const Color(0xFF1A0D2A),
    icon: Icons.brush_rounded,
    type: CardType.popular,
    description:
        'Kuasai prinsip UI/UX: wireframing, prototyping, user testing, dan design thinking secara menyeluruh.',
    features: [
      '13 jam video pembelajaran',
      'Portfolio review',
      'Akses seumur hidup',
      'Komunitas designer',
    ],
  ),
  CourseItem(
    id: 'p4',
    title: 'React JS Advanced',
    subtitle: 'Kelas Populer',
    price: 'Rp 319.000',
    rating: 4.7,
    cardColor: const Color(0xFF0D2A1A),
    icon: Icons.developer_mode_rounded,
    type: CardType.popular,
    description:
        'React tingkat lanjut: hooks, context, Redux, performance optimization, dan testing dengan Jest.',
    features: [
      '14 jam video pembelajaran',
      '5 proyek portfolio',
      'Akses seumur hidup',
      'Code review session',
    ],
  ),
];

// ─── Catalog Page ─────────────────────────────────────────────────────────────

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int _selectedNavIndex = 3;

  void _openDetail(CourseItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CourseDetailPage(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroBanner(),
            const SizedBox(height: 24),
            _buildSectionHeader('Bundling Hemat', onSeeAll: () {}),
            const SizedBox(height: 12),
            _buildHorizontalList(
              items: bundleItems,
              height: 230,
              cardWidth: 160,
              cardBuilder: (item) => _buildBundleCard(item),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Modul Belajar', onSeeAll: () {}),
            const SizedBox(height: 12),
            _buildHorizontalList(
              items: moduleItems,
              height: 200,
              cardWidth: 150,
              cardBuilder: (item) => _buildModuleCard(item),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Kelas Populer', onSeeAll: () {}),
            const SizedBox(height: 12),
            _buildHorizontalList(
              items: popularItems,
              height: 210,
              cardWidth: 155,
              cardBuilder: (item) => _buildPopularCard(item),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ─── AppBar ───────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: Colors.black87, size: 20),
        onPressed: () {},
      ),
      title: const Text(
        'Catalog',
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded, color: Colors.black87),
          onPressed: () {},
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined,
                  color: Colors.black87),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    color: Color(0xFFFF3B30), shape: BoxShape.circle),
                child: const Text('2',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  // ─── Hero Banner ──────────────────────────────────────────────────────────

  Widget _buildHeroBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF283593), Color(0xFF1565C0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              top: -10,
              child: Text(
                'LiVE\nBoot\nCAMP',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  color: Colors.white.withOpacity(0.08),
                  height: 1.1,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00BCD4),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text('LIVE NOW',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5)),
                  ),
                  const SizedBox(height: 10),
                  const Text('Product Design Bootcamp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1.2)),
                  const SizedBox(height: 4),
                  const Text('Batch 12 • Starts July 15',
                      style:
                          TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1565C0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text('Daftar Sekarang',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13)),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 16,
              child: Text('• SAFE WORK •',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 10,
                      letterSpacing: 1.5)),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Section Header ───────────────────────────────────────────────────────

  Widget _buildSectionHeader(String title,
      {required VoidCallback onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87)),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text('Lihat Semua',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1565C0))),
          ),
        ],
      ),
    );
  }

  // ─── Generic Horizontal List ──────────────────────────────────────────────

  Widget _buildHorizontalList({
    required List<CourseItem> items,
    required double height,
    required double cardWidth,
    required Widget Function(CourseItem) cardBuilder,
  }) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: cardWidth,
            child: _TappableCard(
              onTap: () => _openDetail(item),
              child: cardBuilder(item),
            ),
          );
        },
      ),
    );
  }

  // ─── Bundle Card ──────────────────────────────────────────────────────────

  Widget _buildBundleCard(CourseItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: item.cardColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(14)),
              ),
              child: Center(
                  child: Icon(item.icon, size: 44, color: Colors.white30)),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(6)),
                child: Text('Save ${item.savePercent}%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3)),
              const SizedBox(height: 6),
              Text(item.originalPrice ?? '',
                  style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough)),
              Text(item.price,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1565C0))),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Module Card ──────────────────────────────────────────────────────────

  Widget _buildModuleCard(CourseItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            color: item.cardColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
          ),
          child: Center(
              child: Icon(item.icon, size: 40, color: Colors.white54)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3)),
              const SizedBox(height: 6),
              Text(item.price,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1565C0))),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Popular Card ─────────────────────────────────────────────────────────

  Widget _buildPopularCard(CourseItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
            color: item.cardColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
          ),
          child: Center(
              child: Icon(item.icon, size: 40, color: Colors.white38)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.3)),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.price,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1565C0))),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Color(0xFFFFC107), size: 13),
                      const SizedBox(width: 2),
                      Text(item.rating.toString(),
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Bottom Navigation ────────────────────────────────────────────────────

  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_rounded, 'label': 'Home'},
      {'icon': Icons.emoji_events_rounded, 'label': 'Lomba'},
      {'icon': Icons.menu_book_rounded, 'label': 'Modul'},
      {'icon': Icons.person_rounded, 'label': 'Profil'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x14000000),
              blurRadius: 16,
              offset: Offset(0, -4))
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = _selectedNavIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF6C63FF).withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(items[index]['icon'] as IconData,
                          color: isSelected
                              ? const Color(0xFF6C63FF)
                              : Colors.grey,
                          size: 24),
                      const SizedBox(height: 4),
                      Text(items[index]['label'] as String,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: isSelected
                                  ? const Color(0xFF6C63FF)
                                  : Colors.grey)),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ─── Tappable Card Wrapper ────────────────────────────────────────────────────

class _TappableCard extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const _TappableCard({required this.onTap, required this.child});

  @override
  State<_TappableCard> createState() => _TappableCardState();
}

class _TappableCardState extends State<_TappableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (_, child) =>
            Transform.scale(scale: _scaleAnim.value, child: child),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

// ─── Course Detail Page ───────────────────────────────────────────────────────

class CourseDetailPage extends StatelessWidget {
  final CourseItem item;

  const CourseDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Hero SliverAppBar ────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: item.cardColor,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white, size: 18),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white, size: 20),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: item.cardColor,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Decorative circle
                    Positioned(
                      right: -40,
                      bottom: -40,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -30,
                      top: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.04),
                        ),
                      ),
                    ),
                    Icon(item.icon, size: 80, color: Colors.white24),
                  ],
                ),
              ),
            ),
          ),

          // ── Content ──────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge + rating
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1565C0).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(item.subtitle,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1565C0))),
                      ),
                      if (item.rating != null) ...[
                        const SizedBox(width: 10),
                        const Icon(Icons.star_rounded,
                            color: Color(0xFFFFC107), size: 16),
                        const SizedBox(width: 3),
                        Text(item.rating.toString(),
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54)),
                      ],
                      if (item.savePercent != null) ...[
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF3B30),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('Save ${item.savePercent}%',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Title
                  Text(item.title,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                          height: 1.3)),

                  const SizedBox(height: 8),

                  // Description
                  Text(item.description,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.6)),

                  const SizedBox(height: 20),

                  // Features
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Yang kamu dapat:',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87)),
                        const SizedBox(height: 12),
                        ...item.features.map((f) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1565C0)
                                          .withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.check_rounded,
                                        size: 14,
                                        color: Color(0xFF1565C0)),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(f,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black87)),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Price section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.originalPrice != null)
                                Text(item.originalPrice!,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              Text(item.price,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF1565C0))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100), // space for bottom button
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Sticky Bottom Button ─────────────────────────────────────────────
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x18000000),
                blurRadius: 20,
                offset: Offset(0, -6))
          ],
        ),
        child: Row(
          children: [
            // Wishlist button
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color(0xFF1565C0), width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_rounded,
                    color: Color(0xFF1565C0), size: 22),
              ),
            ),
            const SizedBox(width: 12),
            // Add to cart button
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${item.title} ditambahkan ke keranjang!'),
                        backgroundColor: const Color(0xFF1565C0),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                  label: const Text('Tambah ke Keranjang',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}