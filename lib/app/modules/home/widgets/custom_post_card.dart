import 'package:dangos/app/data/models/responses/posts_response.dart';
import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

InkWell customPostCard(
  DatumPost data, 
  List<App> apps, {
    required VoidCallback onTapDetail, 
    required VoidCallback onTapLike,
    VoidCallback? onTapProfile,
  }) {
  return InkWell(
    onTap: onTapDetail,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 20.h),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTapProfile ?? () {},
            child: Row(
              children: [
                SizedBox(width: 10.w),
                CircleAvatar(
                  radius: 21.w,
                  backgroundColor: bgWhite,
                  child: CircleAvatar(
                    radius: 18.w,
                    backgroundColor: lightBlue,
                    backgroundImage: NetworkImage(data.user?.imageUrl ?? ""),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(data.user?.name ?? "", style: textStyles(16, bgBlack, bold)),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: bgWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30.w, 25.h, 0, 0),
                        child: BarChart(
                          BarChartData(
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(
                              border: Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left: BorderSide(width: 1.w, color: grey),
                                bottom: BorderSide(width: 1.w, color: grey),
                              ),
                            ),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  interval: 1,
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: textStyles(9, bgBlack, regular),
                                    );
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    final index = value.toInt();
                                    final name = apps[index].name ?? "";
                                    final formattedName = name.replaceFirst(' ', '\n');
                                    return Text(
                                      formattedName,
                                      style: textStyles(name.contains(" ") ? 8 : 9, bgBlack, regular),
                                    );
                                  },
                                ),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            barGroups: List.generate(apps.length, (index) {
                              final app = apps[index];
                              final double hoursDuration = double.parse(((app.duration ?? 0) / 60).toStringAsFixed(1));
    
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      topRight: Radius.circular(3),
                                    ),
                                    fromY: 0,
                                    toY: hoursDuration,
                                    width: 20.w,
                                    color: lightPurple,
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${"category".tr}: ',
                                style: textStyles(9, blue, regular),
                              ),
                              TextSpan(
                                text: data.deviceUsage ?? "",
                                style: textStyles(9, bgBlack, regular),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70.h),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: bgBlack.withAlpha(225 * 30),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: onTapDetail,
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.bubbleChat),
                            SizedBox(width: 7.w),
                            Text(
                              data.commentsCount.toString(),
                              style: textStyles(17, bgWhite, semiBold),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: onTapLike,
                        child: Row(
                          children: [
                            SvgPicture.asset(data.isLike == true ? AppIcons.redHeart :  AppIcons.heart),
                            SizedBox(width: 7.w),
                            Text(
                              data.likesCount.toString(),
                              style: textStyles(17, bgWhite, semiBold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
