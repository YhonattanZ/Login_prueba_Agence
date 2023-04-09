class Products {
  Products({
    required this.title,
    required this.imageProduct,
  });

  String? title;
  String? imageProduct;
}

List<Products> listProducts = [
  Products(
      imageProduct: 'assets/images/Rengoku.jpg', title: 'Poster anime 1080p'),
  Products(
      imageProduct: 'assets/images/tengen.jpg', title: 'Poster anime 1080p'),
  Products(
      imageProduct: 'assets/images/power.jpg', title: 'Poster anime 1080p'),
  Products(
      imageProduct: 'assets/images/megumi.jpg', title: 'Poster anime 1080p'),
  Products(
      imageProduct: 'assets/images/chifuyu1.jpg', title: 'Poster anime 1080p'),
  Products(
      imageProduct: 'assets/images/chifuyu2.jpg', title: 'Poster anime 1080p'),
  Products(imageProduct: 'assets/images/lucy.jpg', title: 'Poster anime 1080p'),
];
