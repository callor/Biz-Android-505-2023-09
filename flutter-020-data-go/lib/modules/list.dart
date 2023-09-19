import 'package:api/provider/bus_station_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusStationListView extends StatelessWidget {
  const BusStationListView({super.key});

  @override
  Widget build(BuildContext context) {
    final busStationProvider =
        Provider.of<BusStationProvider>(context, listen: false);
    busStationProvider.loadStation();
    return Scaffold(
        appBar: AppBar(title: const Text("버스 정류소 정보")),
        body: Consumer<BusStationProvider>(builder: (context, provider, child) {
          if (provider.stationList.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var busStation = provider.stationList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(
                    child: Row(
                      children: [
                        Text("현재위치 : ${busStation.BUSSTOP_NAME!}"),
                        Text("( ${busStation.BUSSTOP_ID!.toString()} )"),
                        const Text(" >> "),
                        Text("${busStation.NEXT_BUSSTOP!} 방향"),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: provider.stationList.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
