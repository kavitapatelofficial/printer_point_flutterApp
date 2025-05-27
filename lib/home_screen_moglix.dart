import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MoglixHomePage extends StatelessWidget {
  final List<String> bannerImages = [
    'https://your-cdn.com/banner1.jpg',
    'https://your-cdn.com/banner2.jpg',
  ];

  final List<Map<String, String>> categories = [
    {"title": "Industrial Tools", "icon": "🛠️"},
    {"title": "Electrical", "icon": "💡"},
    {"title": "Safety", "icon": "🦺"},
    // Add more...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(),
        backgroundColor: Colors.red,
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(),
            _buildCategoryGrid(),
            _buildPromoCoupons(),
            _buildProductSection("Office Stationery & Supplies"),
            _buildProductSection("Power Tools"),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for products',
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return CarouselSlider(
      options: CarouselOptions(height: 180.0, autoPlay: true),
      items: bannerImages.map((imgUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Image.network(imgUrl, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategoryGrid() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return Container(
              width: 90,
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text(cat['icon']!),
                  ),
                  SizedBox(height: 8),
                  Text(cat['title']!, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPromoCoupons() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _couponCard('₹100 off', 'Min. order ₹999'),
          _couponCard('₹300 off', 'On first order'),
        ],
      ),
    );
  }

  Widget _couponCard(String title, String subtitle) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductSection(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("View All", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => _productCard(),
          ),
        ),
      ],
    );
  }

  Widget _productCard() {
    return Container(
      width: 160,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Icon(Icons.image, size: 50),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Product Name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text("₹1,499", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            child: Text("Add to Cart", style: TextStyle(fontSize: 12)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: Size(120, 32),
            ),
          ),
        ],
      ),
    );
  }
}
