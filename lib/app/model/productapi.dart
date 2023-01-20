import 'package:shopping/app/model/productmodel.dart';
import 'package:shopping/infastructure/app.images.dart';

class ProductApi {
  var productResult = [
    Product(
        pid: 1,
        pcost: 30,
        pdetails: '"p_details":"Imported from Swiss",',
        pcategory: 'abd',
        pavailability: 1,
        image: AppImages.apple,
        description:
            "An apple is a round fruit with red or green skin and a whitish inside. One variety of apple might be sweet, another sour. The apple isn't just a fruit.",
        pname: 'Apple'),
    Product(
        pid: 2,
        pcost: 50,
        pdetails: 'Farmed at Selam',
        pcategory: 'Thamilnadu',
        pavailability: 0,
        image: AppImages.mango,
        description:
            "An apple is a round fruit with red or green skin and a whitish inside. One variety of apple might be sweet, another sour. The apple isn't just a fruit.",
        pname: 'Mangoo'),
    Product(
        pid: 3,
        pcost: 25.5,
        pdetails: 'some description about product',
        pavailability: 1,
        pcategory: 'from Nagpur',
        image: AppImages.banana,
        description:
            "An apple is a round fruit with red or green skin and a whitish inside. One variety of apple might be sweet, another sour. The apple isn't just a fruit.",
        pname: 'Banana'),
    Product(
        pid: 4,
        pcost: 25.5,
        pdetails: 'From Nagpur',
        pavailability: 1,
        pcategory: 'from Nagpur',
        description:
            "An apple is a round fruit with red or green skin and a whitish inside. One variety of apple might be sweet, another sour. The apple isn't just a fruit.",
        image: AppImages.orange,
        pname: 'Orange'),
  ];
}
