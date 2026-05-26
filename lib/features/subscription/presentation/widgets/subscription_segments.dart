import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final subscriptionSegmentProvider = StateProvider<int>((ref) => 0);

class CustomSubscriptionSegmentView extends ConsumerWidget {
  const CustomSubscriptionSegmentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(subscriptionSegmentProvider);

    return Column(
      children: [
        _tabs(ref, selectedIndex),
        const SizedBox(height: 16),
        _buildTabWidget(selectedIndex),
      ],
    );
  }

  Widget _tabs(WidgetRef ref, int selectedIndex) => Container(
    height: 100,
    padding: const EdgeInsets.all(4),
    child: Row(
      children: [
        _buildActionItem(
          title: 'اشتراک',
          icon: Icons.inventory_2_outlined,
          onTap: () {
            // TODO: Handle Subscriptions tap
          },
        ),
        const SizedBox(width: 12),
        _buildActionItem(
          title: 'کیف پول',
          icon: Icons.account_balance_wallet_outlined,
          onTap: () {
            // TODO: Handle Wallet tap
          },
        ),
        const SizedBox(width: 12),
        _buildActionItem(
          title: 'تراکنش‌ها',
          icon: Icons.bar_chart_rounded,
          onTap: () {
            // TODO: Handle Transactions tap
          },
        ),
      ],
    ),
  );

  Widget _buildTabWidget(int selectedIndex) => IndexedStack(
    index: selectedIndex,
    children: const [
      Center(child: Text('data1')),
      Center(child: Text('data2')),
      Center(child: Text('data3')),
    ],
  );

  Widget _buildActionItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        child: InkWell(
          onTap: () {
            onTap;
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: const Color(0xFF1E4064), // رنگ آبی تیره
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E4064),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
