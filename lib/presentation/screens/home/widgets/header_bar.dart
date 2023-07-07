import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderBar extends SliverPersistentHeaderDelegate {
  const HeaderBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Positioned(
          top: 46 - shrinkOffset,
          left: 16,
          child: const Text(
            'Courses',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: shrinkOffset > 40
                  ? Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade800.withOpacity(0.32),
                        width: 0.5,
                      ),
                    )
                  : null,
            ),
            width: double.infinity,
            height: 46,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoActionSheet(
                      title: const Text('Settings'),
                      // message: const Text('Message'),
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      actions: <CupertinoActionSheetAction>[
                        // CupertinoActionSheetAction(
                        //   /// This parameter indicates the action would be a default
                        //   /// default behavior, turns the action's text to bold text.
                        //   isDefaultAction: true,
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: const Text('Default Action'),
                        // ),
                        // CupertinoActionSheetAction(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: const Text('Action'),
                        // ),
                        CupertinoActionSheetAction(
                          /// This parameter indicates the action would perform
                          /// a destructive action such as delete or exit and turns
                          /// the action's text color to red.
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
                splashFactory: NoSplash.splashFactory,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Icon(
                    CupertinoIcons.gear_solid,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: SizedBox(
            height: 46,
            child: Opacity(
              opacity: min(1, max(0, (shrinkOffset - 40) / 5)),
              child: const Center(
                child: Text(
                  'Courses',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => 86;

  @override
  double get minExtent => 46;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
