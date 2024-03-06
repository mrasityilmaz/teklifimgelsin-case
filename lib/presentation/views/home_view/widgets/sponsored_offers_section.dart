part of '../home_view.dart';

@immutable
final class _SponsoredOffersSection extends ViewModelWidget<HomeViewModel> {
  const _SponsoredOffersSection();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (viewModel.offersResponse != null && viewModel.offersResponse?.sponsoredOffers?.isNotEmpty == true) {
      return SliverList.builder(
        itemCount: viewModel.offersResponse?.sponsoredOffers?.length ?? 0,
        itemBuilder: (context, index) {
          final offer = viewModel.offersResponse?.sponsoredOffers?[index];
          return OfferCardWidget(
            sponsoredOfferModel: offer,
            onTap: () async {
              await Navigator.of(context).push(
                PageRouteBuilder<Widget>(
                  opaque: false,
                  barrierColor: Colors.black.withOpacity(.4),
                  barrierDismissible: true,
                  transitionDuration: const Duration(milliseconds: 250),
                  pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, .1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: OfferCardWidget(
                              sponsoredOfferModel: offer,
                              isExpanded: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              // AppDialogs.instance.showAnimatedDialog(
              //   context,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       OfferCardWidget(
              //         sponsoredOfferModel: offer,
              //         isOpen: true,
              //       ),
              //     ],
              //   ),
              // );
            },
          );
        },
      );
    }

    return const SliverToBoxAdapter();
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({required this.child, super.key});

//   final Widget child;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     )..forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Center(
//             child: CupertinoFullscreenDialogTransition(
//               primaryRouteAnimation: _animationController,
//               secondaryRouteAnimation: _animationController,
//               linearTransition: false,
//               child: widget.child,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
