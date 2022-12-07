import 'package:flutter/material.dart';
import 'package:flutter_hava_durumu_uygulamasi/controller/global_controller.dart';
import 'package:flutter_hava_durumu_uygulamasi/utlis/custom_colors.dart';
import 'package:flutter_hava_durumu_uygulamasi/widgets/comfort_level.dart';
import 'package:flutter_hava_durumu_uygulamasi/widgets/current_weather_widget.dart';
import 'package:flutter_hava_durumu_uygulamasi/widgets/daily_data_forecast.dart';
import 'package:flutter_hava_durumu_uygulamasi/widgets/header_widget.dart';
import 'package:flutter_hava_durumu_uygulamasi/widgets/hourly_data_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/clouds.png',
                        height: 200,
                        width: 200,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(height: 20),
                      const HeaderWidget(),
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(height: 20),
                      HourlyDataWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather(),
                      ),
                      DailyDataForecast(
                        weatherDataDaily:
                            globalController.getData().getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(height: 10),
                      ComforLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
