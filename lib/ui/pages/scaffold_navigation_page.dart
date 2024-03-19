import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:give_paw/ui/widgets/bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class ScaffoldNavPage extends ConsumerWidget {
  const ScaffoldNavPage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(navigationShell),
    );
  }
}
