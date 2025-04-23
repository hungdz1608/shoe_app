import 'package:app_ban_giay/models/shoe_model.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Shoe> data = [
    Shoe(
      id: '1',
      name: "Nike Air Force 1 '07",
      price: 115,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/AIR+FORCE+1+%2707.png",
      description: "A classic reinvented — the Nike Air Force 1 '07 features crisp leather and subtle details for a fresh look with heritage hoops style.",
    ),
    Shoe(
      id: '2',
      name: "Nike Vista",
      price: 60,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/64d54bbd-0fa3-4201-bf8e-0bb302e83f76/NIKE+VISTA+SANDAL.png",
      description: "Stay comfortable all day with the Nike Vista Sandal. Adjustable straps and cushioned foam provide support and ease in every step.",
    ),
    Shoe(
      id: '3',
      name: "Nike Air Force 1 '07",
      price: 136,
      imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/02fb23bd-1b10-4895-9ead-a632c29bc35d/AIR+FORCE+1+%2707+LV8.png",
      description: "Elevated style meets classic comfort in the Nike Air Force 1 '07 LV8, featuring bold design accents and premium materials.",
    ),
    Shoe(
      id: '4',
      name: "Nike Calm",
      price: 54,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8397fa2b-f6b8-414f-b84b-c1f420f07f28/NIKE+CALM+SLIDE.png",
      description: "Minimalist comfort at its best — the Nike Calm Slide offers a soft, seamless feel ideal for relaxation and recovery.",
    ),
    Shoe(
      id: '5',
      name: "Nike Air Max Dn",
      price: 170,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d90e3112-ea64-4068-be0d-1e832af89fe8/AIR+MAX+DN.png",
      description: "Experience futuristic cushioning with the Nike Air Max Dn. Dual-pressure Air units offer a smooth, dynamic ride all day long.",
    ),
    Shoe(
      id: '6',
      name: "Nike Offcourt",
      price: 39,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0c5b6be1-c799-414f-81f7-be02ecbbe208/NIKE+OFFCOURT+SLIDE.png",
      description: "The Nike Offcourt Slide delivers laid-back comfort with a plush foam midsole and an adjustable upper for a secure fit.",
    ),
    Shoe(
      id: '7',
      name: "Nike Superfly",
      price: 108,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ec00ecc5-dc3f-4375-9dc1-f18a979d8ba6/ZM+SUPERFLY+10+ACAD+FG%2FMG.png",
      description: "Built for speed and agility, the Mercurial Superfly 10 Academy offers precision control and explosive traction on the pitch.",
    ),
    Shoe(
      id: '8',
      name: "Jordan Spizike Low",
      price: 178,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/7823f24f-514b-4898-bab4-68b1af5e41b4/JORDAN+SPIZIKE+LOW.png",
      description: "The Jordan Spizike Low blends iconic Jordan elements with a fresh low-cut design, offering a bold look and all-day comfort.",
    ),
    Shoe(
      id: '9',
      name: "Jordan Stay Loyal 3",
      price: 132,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/f88afc67-cc1c-41d5-85ca-7b6081dc4002/JORDAN+STAY+LOYAL+3.png",
      description: "Designed with durability and support in mind, the Jordan Stay Loyal 3 is a perfect balance of performance and style.",
    ),
    Shoe(
      id: '10',
      name: "Nike Air Max AP",
      price: 116,
      imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/9569c851-c828-4417-adc5-887c78a68164/NIKE+AIR+MAX+AP.png",
      description: "The Nike Air Max AP blends heritage running style with modern comfort for a sleek, versatile sneaker you'll wear all day.",
    ),
    // Add more shoe data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nike Store')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2;
            double childAspectRatio = 0.6;

            if (constraints.maxWidth < 500) {
              crossAxisCount = 2;
              childAspectRatio = 0.6;
            } else if (constraints.maxWidth < 1100) {
              crossAxisCount = 3; // Hoặc 4 nếu đủ không gian
              childAspectRatio = 0.53; // tăng chiều cao thẻ
            } else {
              crossAxisCount = 5;
              childAspectRatio = 0.65; // đủ rộng, không bị bóp chiều cao
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CustomProductCard(shoe: data[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
