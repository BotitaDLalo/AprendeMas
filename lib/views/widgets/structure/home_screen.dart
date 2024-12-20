import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/views.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final List<WidgetOptions> lsWidgetsOptions;
  const HomeScreen({super.key, required this.lsWidgetsOptions});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // int selectedIndex = 0;
  final itemTappedProvider = StateProvider<int>((ref) => 0);

  void onItemTapped(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: widget.lsWidgetsOptions
            .elementAt(ref.watch(itemTappedProvider))
            .widget,
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: ref.watch(itemTappedProvider),
        onItemSelected: onItemTapped,
        widgetsOptionsItems: widget.lsWidgetsOptions
            .map((e) => e.bottomNavigationBarItem)
            .toList(),
      ),
    );
  }
}
