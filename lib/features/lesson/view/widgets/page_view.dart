import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:lessons_tasks_assignment/common/extensions/localizations_extension.dart';
import 'package:lessons_tasks_assignment/domain/content_component.dart';
import 'package:lessons_tasks_assignment/domain/page.dart';

class LessonPageView extends StatelessWidget {
  const LessonPageView({
    required this.page,
    super.key,
  });

  final Page page;

  static const _verticalSpacing = 20.0;
  static const _imageSize = 200.0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          const SizedBox(height: _verticalSpacing),
      itemCount: page.content.length,
      itemBuilder: (context, index) {
        final component = page.content[index];
        return switch (component) {
          TextComponent(:final text) => Text(
              text.localizedTo(Localizations.localeOf(context)),
            ),
          ImageComponent(:final imageUri) => CachedNetworkImage(
              imageUrl: imageUri.toString(),
              fit: BoxFit.scaleDown,
              width: _imageSize,
              height: _imageSize,
              cacheManager: GetIt.I<BaseCacheManager>(),
            ),
        };
      },
    );
  }
}
