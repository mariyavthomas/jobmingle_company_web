import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_mingle_web/application/shortlistcan/shortlisted_candidate_bloc.dart';


class SearchShortList extends StatefulWidget {
   SearchShortList({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<SearchShortList> createState() => _SearchShortListState();
}

class _SearchShortListState extends State<SearchShortList> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch initial jobs
    context.read<ShortlistedCandidateBloc>().add(ShortListLoadeddata());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height * 0.04,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              print("Search value: $value"); // Debugging
              // Debounce to avoid too many searches
              Future.delayed(Duration(milliseconds: 300), () {
                try {
                  context.read<ShortlistedCandidateBloc>().add(SearchShortlist(searchtext: value));
                } catch (e) {
                  print("Error adding event: $e"); // Debugging
                }
              });
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        searchController.clear();
                          context.read<ShortlistedCandidateBloc>().add(SearchShortlist(searchtext: ''));
                      },
                    )
                  : null,
            ),
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
