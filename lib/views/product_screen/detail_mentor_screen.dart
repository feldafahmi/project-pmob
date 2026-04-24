// ============================================
// FILE: lib/views/product_screen/detail_mentor_screen.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/mentor_model.dart';
import '../../widgets/detail_widgets.dart';

class DetailMentorScreen extends StatefulWidget {
  const DetailMentorScreen({super.key, required this.mentor});
  final MentorModel mentor;

  @override
  State<DetailMentorScreen> createState() => _DetailMentorScreenState();
}

class _DetailMentorScreenState extends State<DetailMentorScreen> {
  bool _wishlisted = false;
  int _activeTab = 0;
  int _selectedSlot = -1;

  static const _tabs = ['Tentang', 'Jadwal', 'Ulasan'];

  static const _slots = [
    _Slot('Sen, 27 Apr', '09:00', '60 mnt'),
    _Slot('Sen, 27 Apr', '14:00', '60 mnt'),
    _Slot('Sel, 28 Apr', '10:00', '90 mnt'),
    _Slot('Rab, 29 Apr', '15:00', '60 mnt'),
    _Slot('Kam, 30 Apr', '11:00', '60 mnt'),
  ];

  static const _highlights = [
    (Icons.bolt_rounded, 'Respon cepat — rata-rata 2 jam'),
    (Icons.videocam_rounded, 'Sesi via Zoom + rekaman tersedia'),
    (Icons.description_rounded, 'Materi & feedback tertulis pasca-sesi'),
    (Icons.replay_rounded, 'Reschedule fleksibel hingga 24 jam sebelumnya'),
  ];

  @override
  Widget build(BuildContext context) {
    final m = widget.mentor;
    return Scaffold(
      backgroundColor: DetailColors.bg,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHero(m),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                m.name,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: DetailColors.navy,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            _buildAvailabilityChip(m.available),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          m.title,
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            color: DetailColors.muted,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        StarRatingRow(
                          rating: m.rating,
                          count: '${m.sessions} sesi',
                        ),
                        const SizedBox(height: 14),
                        if (m.tags.isNotEmpty)
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: m.tags
                                .map((t) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: DetailColors.purpleFaint,
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        t,
                                        style: GoogleFonts.manrope(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: DetailColors.purple,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: StatsRow(pills: [
                      const StatPill(
                        icon: Icons.groups_rounded,
                        value: '142',
                        label: 'Sesi Selesai',
                      ),
                      StatPill(
                        icon: Icons.star_rounded,
                        value: '${m.formattedRating}★',
                        label: 'Rating',
                      ),
                      const StatPill(
                        icon: Icons.bolt_rounded,
                        value: '< 2j',
                        label: 'Response',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DetailTabBar(
                      tabs: _tabs,
                      activeIndex: _activeTab,
                      onTap: (i) => setState(() => _activeTab = i),
                      activeColor: DetailColors.purple,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTabContent(m),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          DetailStickyFooter(
            price: '${m.formattedPrice} /sesi',
            ctaLabel: m.available ? 'Book Sesi' : 'Tidak Tersedia',
            ctaIcon: Icons.calendar_today_rounded,
            ctaGradient: m.available
                ? const [DetailColors.purple, Color(0xFF6B0075)]
                : const [DetailColors.muted, DetailColors.muted],
            shadowColor: DetailColors.purple,
            onTap: m.available ? () {} : () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHero(MentorModel m) {
    return Stack(
      children: [
        Container(
          height: 260,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              colors: [
                m.avatarGradient.first,
                m.avatarGradient.last,
              ],
            ),
          ),
        ),
        Positioned(
          right: -30,
          top: -30,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 70,
          child: Center(
            child: Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
                border: Border.all(
                    color: Colors.white.withOpacity(0.4), width: 3),
              ),
              alignment: Alignment.center,
              child: Text(
                m.initials,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailBackButton(onTap: () => Navigator.of(context).pop()),
              DetailWishlistButton(
                active: _wishlisted,
                onTap: () => setState(() => _wishlisted = !_wishlisted),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 54,
          left: 16,
          child: const HeroBadge(label: 'MENTORING'),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 14,
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '1-on-1 SESSION',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ),
        Container(
            height: 260, color: Colors.transparent, width: double.infinity),
      ],
    );
  }

  Widget _buildAvailabilityChip(bool available) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: available
            ? DetailColors.greenFaint
            : DetailColors.muted.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        available ? '● Tersedia' : '○ Sibuk',
        style: GoogleFonts.manrope(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: available ? DetailColors.green : DetailColors.muted,
        ),
      ),
    );
  }

  Widget _buildTabContent(MentorModel m) {
    switch (_activeTab) {
      case 0:
        return _buildTentang(m);
      case 1:
        return _buildJadwal();
      case 2:
        return _buildUlasan();
    }
    return const SizedBox.shrink();
  }

  Widget _buildTentang(MentorModel m) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, saya ${m.name.split(' ').first}! Saya sudah membantu '
            '${m.sessions}+ peserta lomba mempersiapkan strategi, '
            'pitch deck, dan menjawab pertanyaan juri. '
            'Mari konsultasikan kebutuhan lombamu — saya siap memberikan '
            'feedback personal yang spesifik untuk timmu.',
            style: GoogleFonts.manrope(
              fontSize: 13,
              color: DetailColors.muted,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),
          const DetailSectionTitle('Yang akan kamu dapatkan'),
          Column(
            children: _highlights
                .map((h) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: HighlightRow(icon: h.$1, text: h.$2),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          const DetailSectionTitle('Cocok untuk'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              DetailMetaPill(
                  icon: Icons.school_rounded,
                  text: 'Persiapan lomba'),
              DetailMetaPill(
                  icon: Icons.feedback_rounded,
                  text: 'Review pitch deck'),
              DetailMetaPill(
                  icon: Icons.psychology_rounded,
                  text: 'Konsultasi strategi'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJadwal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih slot waktu mentoring',
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: DetailColors.muted,
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < _slots.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _buildSlotCard(i, _slots[i]),
            ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: DetailColors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded,
                    size: 16, color: DetailColors.muted),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Slot lain bisa diatur via chat setelah booking.',
                    style: GoogleFonts.manrope(
                      fontSize: 11,
                      color: DetailColors.muted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotCard(int idx, _Slot slot) {
    final selected = idx == _selectedSlot;
    return InkWell(
      onTap: () => setState(() => _selectedSlot = idx),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? DetailColors.purple : DetailColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: selected
                    ? DetailColors.purple
                    : DetailColors.purpleFaint,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.calendar_today_rounded,
                size: 16,
                color: selected ? Colors.white : DetailColors.purple,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    slot.day,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: DetailColors.navy,
                    ),
                  ),
                  Text(
                    '${slot.time} · ${slot.duration}',
                    style: GoogleFonts.manrope(
                      fontSize: 11,
                      color: DetailColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: DetailColors.purple,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.check_rounded,
                    size: 12, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildUlasan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const RatingSummaryCard(
            rating: 5.0,
            totalReviews: 142,
            distribution: [95, 4, 1, 0, 0],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 158,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ReviewCard(
                  initials: 'NP',
                  name: 'Nadia P.',
                  stars: 5,
                  text: 'Mentor terbaik! Feedback-nya tajam dan langsung '
                      'actionable. Pitch deck saya jadi 2x lebih kuat.',
                  gradient: [Color(0xFFA600B2), Color(0xFF6B0075)],
                  date: '20 Apr 2026',
                ),
                SizedBox(width: 12),
                ReviewCard(
                  initials: 'GA',
                  name: 'Galang A.',
                  stars: 5,
                  text: 'Sesinya santai tapi padat insight. Recommended '
                      'untuk persiapan lomba serius.',
                  gradient: [Color(0xFF001261), Color(0xFF002196)],
                  date: '12 Apr 2026',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Slot {
  final String day;
  final String time;
  final String duration;
  const _Slot(this.day, this.time, this.duration);
}
