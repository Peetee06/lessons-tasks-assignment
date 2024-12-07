import 'package:flutter/material.dart' hide Page;
import 'package:lessons_tasks_assignment/domain/page.dart';
import 'package:lessons_tasks_assignment/features/lesson/view/widgets/page_view.dart';
import 'package:lessons_tasks_assignment/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LessonPagesView extends StatefulWidget {
  const LessonPagesView({
    required this.pages,
    super.key,
  });

  final List<Page> pages;

  static const Key backButtonKey = Key('lessonPagesViewBackButton');
  static const Key forwardButtonKey = Key('lessonPagesViewForwardButton');

  @override
  State<LessonPagesView> createState() => _LessonPagesViewState();
}

class _LessonPagesViewState extends State<LessonPagesView> {
  late PageController _pageController;

  bool _canNavigateBack = false;
  late bool _canNavigateForward;

  @override
  void initState() {
    super.initState();
    _canNavigateForward = widget.pages.length > 1;
    _pageController = PageController()..addListener(_updateNavigationButtons);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updateNavigationButtons() {
    setState(() {
      _canNavigateBack = _pageController.page != 0;
      _canNavigateForward = _pageController.page != widget.pages.length - 1;
    });
  }

  void _navigateBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _navigateForward() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SmoothPageIndicator(
                controller: _pageController,
                count: widget.pages.length,
                effect: WormEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.pages.length,
                  itemBuilder: (context, index) {
                    final page = widget.pages[index];
                    return LessonPageView(page: page);
                  },
                ),
              ),
            ],
          ),
          if (_canNavigateBack || _canNavigateForward)
            Row(
              children: [
                if (_canNavigateBack)
                  _BackButton(
                    key: LessonPagesView.backButtonKey,
                    onPressed: _navigateBack,
                  ),
                const Spacer(),
                if (_canNavigateForward)
                  _ForwardButton(
                    key: LessonPagesView.forwardButtonKey,
                    onPressed: _navigateForward,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back),
      label: Text(context.l10n.lessonPageBackButtonLabel),
    );
  }
}

class _ForwardButton extends StatelessWidget {
  const _ForwardButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      label: Text(context.l10n.lessonPageForwardButtonLabel),
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.arrow_forward),
    );
  }
}
