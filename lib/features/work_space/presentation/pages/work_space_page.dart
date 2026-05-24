import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/work_space_ads_slide.dart';

class WorkSpacePage extends ConsumerWidget {
  const WorkSpacePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => WorkSpaceAdsSlide();
}
