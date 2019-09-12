import 'package:flutter/material.dart';
import 'package:restaurants/Model/ProductModel.dart';
import 'package:restaurants/UI/custom/mainui_customcard.dart';

class Devices extends StatefulWidget {
  @override
  _Devices createState() => _Devices();
}

class _Devices extends State<Devices> {
  List<Product> _devices;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _devices = [
      Product(
          123,
          "02 Apr 2019",
          "Lenovo T450T",
          "Discover the Lenovo ThinkPad T450, a 14-inch thin and light business Ultrabook with the newest Intel Core i processor, backlit keyboard and up to 17 hours battery backup.",
          40000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/lenovot450.jpg",
          true),
      Product(
          124,
          "05 Apr 2019",
          "Samsung S9+",
          "Discover Galaxy S9 and S9+ and the revolutionary camera that adapts like the human eye.",
          60000,
          "5 months",
          "Mobiles",
          8377028021,
          "assets/images/samsuns9+.jpg",
          true),
      Product(
          125,
          "23 Mar 2019",
          "Himalayan",
          "The Himalayan is an ‘all-rounder’ motorcycle built on an all new platform from Royal Enfield. It is a 411cc adventure motorcycle which was partly developed in the United Kingdom. The motorcycle brings a series of firsts for the brand.",
          100000,
          "5 months",
          "Bike",
          8377028021,
          "assets/images/bike.jpg",
          true),
      Product(
          126,
          "10 Feb 2019",
          "Canon 200D",
          "Canon EOS 200D 24.2MP Digital SLR Camera + EF-S 18-55 mm f4 is STM Lens, Free Camera Case and 16GB Card Inside",
          35000,
          "5 months",
          "Electronics",
          8377028021,
          "assets/images/canon.jpg",
          true),
      Product(
          127,
          "1 Jan 2019",
          "Sofa",
          "Bharat Lifestyle Nano Fabric 6 Seater Sofa",
          4000,
          "5 months",
          "Furniture",
          8377028021,
          "assets/images/sofa.jpg",
          true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myListView(context),
    );
  }

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _devices.length,
      itemBuilder: (context, index) {
        return Container(
          height: 180,
          margin: const EdgeInsets.all(5),
          child: CustomCard(
            title: '${_devices[index].title}',
            category: '${_devices[index].category}',
            price: "₹${_devices[index].price}",
            dateAdded: "${_devices[index].dateAdded}",
            description: "${_devices[index].desc}",
            image: "${_devices[index].image}",
            location: "Sector 62, Noida",
          ),
        );
      },
    );
  }
}
