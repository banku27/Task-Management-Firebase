import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_with_firebase/common/utils/constants.dart';
import 'package:todo_with_firebase/common/widgets/app_style.dart';
import 'package:todo_with_firebase/common/widgets/custom_text_field.dart';
import 'package:todo_with_firebase/common/widgets/expansion_tile.dart';
import 'package:todo_with_firebase/common/widgets/height_spacer.dart';
import 'package:todo_with_firebase/common/widgets/reusable_text.dart';
import 'package:todo_with_firebase/common/widgets/width_spacer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'Dashboard',
                        style:
                            appstyle(18, AppConstants.kLight, FontWeight.bold),
                      ),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: const BoxDecoration(
                          color: AppConstants.kLight,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            color: AppConstants.kBkDark,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  hintText: 'Search',
                  keyboardType: TextInputType.text,
                  controller: search,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: AppConstants.kGreyLight,
                      ),
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.sign_language_rounded,
                    color: AppConstants.kGreyLight,
                  ),
                ),
                const HeightSpacer(size: 15)
              ],
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const HeightSpacer(size: 25),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.task,
                    size: 20,
                    color: AppConstants.kLight,
                  ),
                  const WidthSpacer(width: 10),
                  ReusableText(
                    text: "Today's Task",
                    style: appstyle(18, AppConstants.kLight, FontWeight.bold),
                  ),
                ],
              ),
              const HeightSpacer(size: 25),
              Container(
                decoration: BoxDecoration(
                  color: AppConstants.kLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.kRadius),
                  ),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelStyle:
                      appstyle(24, AppConstants.kBlueLight, FontWeight.w700),
                  unselectedLabelColor: AppConstants.kLight,
                  indicator: BoxDecoration(
                    color: AppConstants.kGreyLight,
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppConstants.kRadius),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConstants.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: 'Pending',
                            style: appstyle(
                                16, AppConstants.kBkDark, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        width: AppConstants.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: 'Completed',
                            style: appstyle(
                                16, AppConstants.kBkDark, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(size: 20),
              SizedBox(
                height: AppConstants.kHeight * 0.3,
                width: AppConstants.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstants.kRadius),
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppConstants.kBkLight,
                        height: AppConstants.kHeight * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(size: 20),
              const ExpandsionTile(
                text: "Tomorrow's Task",
                text2: "Tommorrow's tasks are shown here",
                children: [],
              ),
              const HeightSpacer(size: 20),
              ExpandsionTile(
                text: DateTime.now()
                    .add(const Duration(days: 2))
                    .toString()
                    .substring(5, 10),
                text2: "Day after tomorrow tasks",
                children: const [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
