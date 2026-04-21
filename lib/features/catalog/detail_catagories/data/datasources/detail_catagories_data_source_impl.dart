import '../models/detail_catagories_content_model.dart';
import '../models/detail_catagories_product_model.dart';
import 'detail_catagories_data_source.dart';

class DetailCatagoriesDataSourceImpl implements DetailCatagoriesDataSource {
  const DetailCatagoriesDataSourceImpl();

  @override
  Future<DetailCatagoriesContentModel> getContent(String categoryTitle) async {
    final String normalizedTitle = categoryTitle.trim().toUpperCase();
    final _DetailCatagoriesConfig config =
        _detailCatagoriesConfigs[normalizedTitle] ??
        _detailCatagoriesConfigs['MEN']!;

    return DetailCatagoriesContentModel(
      categories: config.categories,
      products: config.products,
      heroImagePath: config.heroImagePath,
    );
  }
}

class _DetailCatagoriesConfig {
  const _DetailCatagoriesConfig({
    required this.categories,
    required this.products,
    required this.heroImagePath,
  });

  final List<String> categories;
  final List<DetailCatagoriesProductModel> products;
  final String heroImagePath;
}

const Map<String, _DetailCatagoriesConfig> _detailCatagoriesConfigs =
    <String, _DetailCatagoriesConfig>{
      'MEN': _DetailCatagoriesConfig(
        categories: <String>[
          'All Product',
          'Shirts',
          'Polos',
          'Jeans',
          'Trousers',
          'Jackets',
          'Shoes',
          'Accessories',
        ],
        products: <DetailCatagoriesProductModel>[
          DetailCatagoriesProductModel(
            name: 'Cotton T-shirt',
            soldLabel: 'Sold (50 Products)',
            price: 49,
            imagePath: 'assets/catagories/men/men6.png',
            type: 'Shirts',
          ),
          DetailCatagoriesProductModel(
            name: 'Cotton T-shirt Text',
            soldLabel: 'Sold (50 Products)',
            price: 49,
            imagePath: 'assets/catagories/men/men1.png',
            type: 'Shirts',
          ),
          DetailCatagoriesProductModel(
            name: 'Basic T-shirt',
            soldLabel: 'Sold (50 Products)',
            price: 49,
            imagePath: 'assets/catagories/men/men3.png',
            type: 'Jeans',
          ),
          DetailCatagoriesProductModel(
            name: "Women's Day T-shirt",
            soldLabel: 'Sold (50 Products)',
            price: 59,
            imagePath: 'assets/catagories/men/men2.png',
            type: 'Trousers',
          ),
          DetailCatagoriesProductModel(
            name: 'Cotton Polo Shirt',
            soldLabel: 'Sold (50 Products)',
            price: 39,
            imagePath: 'assets/catagories/men/men4.png',
            type: 'Polos',
          ),
          DetailCatagoriesProductModel(
            name: 'Cotton-blend Sweatshirt',
            soldLabel: 'Sold (50 Products)',
            price: 69,
            imagePath: 'assets/catagories/men/men5.png',
            type: 'Jackets',
          ),
        ],
        heroImagePath: 'assets/catagories/men.png',
      ),
      'WOMEN': _DetailCatagoriesConfig(
        categories: <String>['All Product', 'Dresses', 'Shirts'],
        products: <DetailCatagoriesProductModel>[
          DetailCatagoriesProductModel(
            name: 'Denim Midi Dress',
            soldLabel: 'Sold (32 Products)',
            price: 79,
            imagePath: 'assets/catagories/women/women1.jpg',
            type: 'Dresses',
          ),
          DetailCatagoriesProductModel(
            name: 'NYC Printed Top',
            soldLabel: 'Sold (27 Products)',
            price: 39,
            imagePath: 'assets/catagories/women/women2.jpg',
            type: 'Dresses',
          ),
          DetailCatagoriesProductModel(
            name: 'Blue Knit Set',
            soldLabel: 'Sold (24 Products)',
            price: 65,
            imagePath: 'assets/catagories/women/women3.jpeg',
            type: 'Shirts',
          ),
          DetailCatagoriesProductModel(
            name: 'Minimal Beige Look',
            soldLabel: 'Sold (18 Products)',
            price: 58,
            imagePath: 'assets/catagories/women/women4.jpg',
            type: 'Dresses',
          ),
        ],
        heroImagePath: 'assets/catagories/women.png',
      ),
      'KIDS': _DetailCatagoriesConfig(
        categories: <String>['All Product', 'Sets', 'Jackets'],
        products: <DetailCatagoriesProductModel>[
          DetailCatagoriesProductModel(
            name: 'Classic Kids Sweater',
            soldLabel: 'Sold (40 Products)',
            price: 45,
            imagePath: 'assets/catagories/kids/kid1.jpeg',
            type: 'Sets',
          ),
          DetailCatagoriesProductModel(
            name: 'Dino Baby Romper',
            soldLabel: 'Sold (35 Products)',
            price: 35,
            imagePath: 'assets/catagories/kids/kid2.jpeg',
            type: 'Sets',
          ),
          DetailCatagoriesProductModel(
            name: 'Printed Blue Jacket',
            soldLabel: 'Sold (22 Products)',
            price: 29,
            imagePath: 'assets/catagories/kids/kid3.jpeg',
            type: 'Jackets',
          ),
          DetailCatagoriesProductModel(
            name: 'Sporty Kid Sneakers',
            soldLabel: 'Sold (28 Products)',
            price: 49,
            imagePath: 'assets/catagories/kids/kid4.jpeg',
            type: 'Jackets',
          ),
        ],
        heroImagePath: 'assets/catagories/kids.png',
      ),
      'SHOES': _DetailCatagoriesConfig(
        categories: <String>['All Product', 'Sneakers', 'Loafers', 'Running'],
        products: <DetailCatagoriesProductModel>[
          DetailCatagoriesProductModel(
            name: 'Blue Platform Sneaker',
            soldLabel: 'Sold (20 Products)',
            price: 69,
            imagePath: 'assets/catagories/shoes/shoes1.jpeg',
            type: 'Sneakers',
          ),
          DetailCatagoriesProductModel(
            name: 'Pastel Chunky Sneaker',
            soldLabel: 'Sold (44 Products)',
            price: 79,
            imagePath: 'assets/catagories/shoes/shoes2.jpeg',
            type: 'Sneakers',
          ),
          DetailCatagoriesProductModel(
            name: 'Leather Loafer',
            soldLabel: 'Sold (31 Products)',
            price: 85,
            imagePath: 'assets/catagories/shoes/shoes3.jpeg',
            type: 'Loafers',
          ),
          DetailCatagoriesProductModel(
            name: 'Retro Runner',
            soldLabel: 'Sold (26 Products)',
            price: 92,
            imagePath: 'assets/catagories/shoes/shoes4.jpeg',
            type: 'Running',
          ),
        ],
        heroImagePath: 'assets/catagories/shoes.png',
      ),
      'BAGS': _DetailCatagoriesConfig(
        categories: <String>[
          'All Product',
          'Crossbody',
          'Shoulder Bags',
          'Tote Bags',
        ],
        products: <DetailCatagoriesProductModel>[
          DetailCatagoriesProductModel(
            name: 'Taylormade Crossbody',
            soldLabel: 'Sold (38 Products)',
            price: 72,
            imagePath: 'assets/catagories/bags/bag1.jpeg',
            type: 'Crossbody',
          ),
          DetailCatagoriesProductModel(
            name: 'Monogram Shoulder Bag',
            soldLabel: 'Sold (45 Products)',
            price: 89,
            imagePath: 'assets/catagories/bags/bag2.jpeg',
            type: 'Shoulder Bags',
          ),
          DetailCatagoriesProductModel(
            name: 'Blue Mini Handbag',
            soldLabel: 'Sold (23 Products)',
            price: 64,
            imagePath: 'assets/catagories/bags/bag3.jpeg',
            type: 'Crossbody',
          ),
          DetailCatagoriesProductModel(
            name: 'Classic Office Tote',
            soldLabel: 'Sold (33 Products)',
            price: 99,
            imagePath: 'assets/catagories/bags/bag4.jpeg',
            type: 'Tote Bags',
          ),
        ],
        heroImagePath: 'assets/catagories/bags.png',
      ),
      'ACCESSORIES': _DetailCatagoriesConfig(
        categories: <String>['All Product', 'Necklaces', 'Rings', 'Sunglasses'],
        products: <DetailCatagoriesProductModel>[
          DetailCatagoriesProductModel(
            name: 'Crystal Teddy Necklace',
            soldLabel: 'Sold (51 Products)',
            price: 59,
            imagePath: 'assets/catagories/accessories/accessories1.jpeg',
            type: 'Necklaces',
          ),
          DetailCatagoriesProductModel(
            name: 'Blue Swan Necklace',
            soldLabel: 'Sold (29 Products)',
            price: 69,
            imagePath: 'assets/catagories/accessories/accessories2.jpeg',
            type: 'Necklaces',
          ),
          DetailCatagoriesProductModel(
            name: 'Gold Stone Ring',
            soldLabel: 'Sold (47 Products)',
            price: 42,
            imagePath: 'assets/catagories/accessories/accessories3.jpeg',
            type: 'Rings',
          ),
          DetailCatagoriesProductModel(
            name: 'Aviator Sunglasses',
            soldLabel: 'Sold (36 Products)',
            price: 54,
            imagePath: 'assets/catagories/accessories/accessories4.jpeg',
            type: 'Sunglasses',
          ),
        ],
        heroImagePath: 'assets/catagories/accessories.png',
      ),
    };
