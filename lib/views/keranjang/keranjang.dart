import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keranjang Belanja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A3FA4)),
        useMaterial3: true,
      ),
      home: const KeranjangBelanjaPage(),
    );
  }
}

// ─── Model ───────────────────────────────────────────────────────────────────

class CartItem {
  final String id;
  final String title;
  final String subtitle;
  final int price;
  final Color thumbnailColor;
  final IconData thumbnailIcon;

  const CartItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.thumbnailColor,
    required this.thumbnailIcon,
  });
}

// ─── Page ────────────────────────────────────────────────────────────────────

class KeranjangBelanjaPage extends StatefulWidget {
  const KeranjangBelanjaPage({super.key});

  @override
  State<KeranjangBelanjaPage> createState() => _KeranjangBelanjaPageState();
}

class _KeranjangBelanjaPageState extends State<KeranjangBelanjaPage> {
  List<CartItem> cartItems = [
    const CartItem(
      id: '1',
      title: 'Winner Class & Module: ...',
      subtitle: 'Premium Bundle Course',
      price: 450000,
      thumbnailColor: Color(0xFF0D1B2A),
      thumbnailIcon: Icons.business_center_rounded,
    ),
    const CartItem(
      id: '2',
      title: 'Mentoring Karir & ...',
      subtitle: '1-on-1 Sessions',
      price: 850000,
      thumbnailColor: Color(0xFF0A1628),
      thumbnailIcon: Icons.people_alt_rounded,
    ),
  ];

  final int totalDiskon = 150000;

  int get totalHarga => cartItems.fold(0, (sum, item) => sum + item.price);
  int get totalPembayaran => totalHarga - totalDiskon;

  void _removeItem(String id) {
    setState(() {
      cartItems.removeWhere((item) => item.id == id);
    });
  }

  String _formatRupiah(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) buffer.write('.');
      buffer.write(str[i]);
      count++;
    }
    return 'Rp ${buffer.toString().split('').reversed.join()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                children: [
                  // Cart Items
                  ...cartItems.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildCartCard(item),
                      )),

                  const SizedBox(height: 4),

                  // Promo Banner
                  _buildPromoBanner(),

                  const SizedBox(height: 16),

                  // Ringkasan Pembayaran
                  _buildRingkasanPembayaran(),
                ],
              ),
            ),
          ),

          // Bottom Checkout Bar
          _buildBottomCheckout(),
        ],
      ),
    );
  }

  // ─── AppBar ───────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF0F2F8),
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1A3FA4), size: 20),
        onPressed: () {},
      ),
      title: const Text(
        'Keranjang Belanja',
        style: TextStyle(
          color: Color(0xFF1A3FA4),
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }

  // ─── Cart Card ────────────────────────────────────────────────────────────

  Widget _buildCartCard(CartItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: item.thumbnailColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(item.thumbnailIcon, color: Colors.white24, size: 36),
                Positioned(
                  bottom: 8,
                  child: Text(
                    item.id == '1' ? 'BUSINESS CASE' : 'CAREERMENTORING',
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _showDeleteDialog(item),
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFE53935),
                        size: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _formatRupiah(item.price),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A3FA4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(CartItem item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Hapus Item',
            style: TextStyle(fontWeight: FontWeight.w700)),
        content: Text('Hapus "${item.title}" dari keranjang?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              _removeItem(item.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  // ─── Promo Banner ─────────────────────────────────────────────────────────

  Widget _buildPromoBanner() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFDDE3F0), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.local_offer_outlined,
                color: Color(0xFF1A3FA4), size: 22),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pakai promo biar lebih hemat!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Ada 3 voucher tersedia',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: Color(0xFF1A3FA4), size: 24),
          ],
        ),
      ),
    );
  }

  // ─── Ringkasan Pembayaran ─────────────────────────────────────────────────

  Widget _buildRingkasanPembayaran() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Pembayaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Total Harga
          _buildSummaryRow(
            label: 'Total Harga (${cartItems.length} Item)',
            value: _formatRupiah(totalHarga),
            valueColor: Colors.black87,
          ),
          const SizedBox(height: 12),

          // Total Diskon
          _buildSummaryRow(
            label: 'Total Diskon',
            value: '-${_formatRupiah(totalDiskon)}',
            valueColor: const Color(0xFFE53935),
          ),

          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(
              color: Color(0xFFEEEEEE),
              thickness: 1.5,
            ),
          ),

          // Total Pembayaran
          _buildSummaryRow(
            label: 'Total Pembayaran',
            value: _formatRupiah(totalPembayaran),
            valueColor: const Color(0xFF1A3FA4),
            isBold: true,
            valueFontSize: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({
    required String label,
    required String value,
    required Color valueColor,
    bool isBold = false,
    double valueFontSize = 15,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
            color: isBold ? Colors.black87 : Colors.black54,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: valueFontSize,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  // ─── Bottom Checkout Bar ─────────────────────────────────────────────────

  Widget _buildBottomCheckout() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 20,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Total label + amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Total Pembayaran',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _formatRupiah(totalPembayaran),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A3FA4),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          // Checkout button
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: cartItems.isEmpty ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A3FA4),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}