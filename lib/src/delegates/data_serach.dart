import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/repository/youtube_suggestion_repository.dart';
import 'package:youtube_share_api_com_bloc/src/widgets/action_button.dart';

import '../widgets/future_list_view_builder.dart';

/*
 * Esses tipos de delegates gerenciam eventos no flutter.
 * Os widgets não são usados ​​apenas para exibir dados, mas também podem causar eventos.
 * Quando os eventos são causados ​​no widget filho, é uma boa ideia delegar o evento ao pai para que ele possa agir. 
 */

class DataSearch extends SearchDelegate<String> {
  @override

  // ===========================================================================
  // SHOW OTHERS ACTIONS BUTTON WHEN USER SEARCH ANYTHINGd
  // ===========================================================================

  List<Widget>? buildActions(BuildContext context) {
    return [
      ActionButton(
        icon: Icons.clear_rounded,
        onPressed: () => query = '',
      )
    ];
  }

  // ===========================================================================
  // BUILD LEADING BUTTON (BACK BUTTON)
  // ===========================================================================
  @override
  Widget? buildLeading(BuildContext context) {
    return ActionButton(
      animatedIcon: AnimatedIcons.menu_arrow,
      onPressed: () => close(context, ''),
      progress: transitionAnimation,
    );
  }

  // ===========================================================================
  // BUILD LEADING BUTTON (BACK BUTTON)
  // ===========================================================================
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration.zero, () => close(context, query)),
      builder: ((context, snapshot) => const SizedBox()),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureListViewBuilder(
            future: YoutubeSuggestionsRepository.suggestions(query),
            onTap: (value) => close(context, value),
          );
  }
}
