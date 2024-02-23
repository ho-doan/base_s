import { Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Product } from './entities/product.entity';

@Injectable()
export class ProductService {
  create(createProductDto: CreateProductDto) {
    return 'This action adds a new product';
  }

  findAll() {
    let product1 = new Product()
    product1.id = 1
    product1.name = 'product 1'
    product1.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product1.categoryId = 1
    let product2 = new Product()
    product2.id = 2
    product2.name = 'product 2'
    product2.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product2.categoryId = 2
    let product3 = new Product()
    product3.id = 3
    product3.name = 'product 3'
    product3.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product3.categoryId = 3
    let product4 = new Product()
    product4.id = 4
    product4.name = 'product 4'
    product4.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product4.categoryId = 4
    let product5 = new Product()
    product5.id = 5
    product5.name = 'product 5'
    product5.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product5.categoryId = 5
    let product6 = new Product()
    product6.id = 6
    product6.name = 'product 6'
    product6.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product6.categoryId = 6
    let product7 = new Product()
    product7.id = 7
    product7.name = 'product 7'
    product7.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product7.categoryId = 7
    let product8 = new Product()
    product8.id = 8
    product8.name = 'product 8'
    product8.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product8.categoryId = 8
    let product9 = new Product()
    product9.id = 9
    product9.name = 'product 9'
    product9.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product9.categoryId = 9
    let product10 = new Product()
    product10.id = 10
    product10.name = 'product 10'
    product10.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product10.categoryId = 1
    let product11 = new Product()
    product11.id = 11
    product11.name = 'product 11'
    product11.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product11.categoryId = 1
    let product12 = new Product()
    product12.id = 21
    product12.name = 'product 12'
    product12.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product12.categoryId = 1
    let product13 = new Product()
    product13.id = 31
    product13.name = 'product 13'
    product13.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product13.categoryId = 1
    let product14 = new Product()
    product14.id = 41
    product14.name = 'product 14'
    product14.image = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'
    product14.categoryId = 1

    return {
      list: [
        product1, product2, product3, product4, product5, product6,
        product7, product8, product9, product10, product11, product12, product13, product14
      ]
    }
  }

  findOne(id: number) {
    return `This action returns a #${id} product`;
  }

  update(id: number, updateProductDto: UpdateProductDto) {
    return `This action updates a #${id} product`;
  }

  remove(id: number) {
    return `This action removes a #${id} product`;
  }
}
