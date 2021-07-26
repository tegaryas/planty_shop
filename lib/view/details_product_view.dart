import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:planty_shop/constants.dart';
import 'package:planty_shop/core/viewmodels/cart_view_model.dart';
import 'package:planty_shop/models/cart_product_model.dart';
import 'package:planty_shop/models/product_model.dart';
import 'package:planty_shop/view/controll_view.dart';
import 'package:planty_shop/view/widgets/custom_button.dart';
import 'package:planty_shop/view/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(model.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 20,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.only(left: 10),
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.off(ControllView());
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 20,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.bookmark),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          // Container(
                          //   height: 6,
                          //   width: 50,
                          //   decoration: BoxDecoration(
                          //       color: Colors.grey.withOpacity(0.4),borderRadius: BorderRadius.circular(50)),
                          // ),

                          SizedBox(
                            height: 30,
                          ),
                          CustomText(
                            text: model.category,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: model.name,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(int.parse(model.price)),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightGreen,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomText(
                            text: 'Deskripsi',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: model.description,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                            height: 1.5,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomText(
                            text: 'Detail',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildTanamanDetail(
                                  detailTextDeskriprsi: model.temp,
                                  detailTextKategori: 'Temp\n',
                                  detailIcon: Icons.thermostat_rounded,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                _buildTanamanDetail(
                                  detailTextDeskriprsi: model.water,
                                  detailTextKategori: 'Water\n',
                                  detailIcon: Icons.waves,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                _buildTanamanDetail(
                                  detailTextDeskriprsi: model.sun,
                                  detailTextKategori: 'Sun\n',
                                  detailIcon: Icons.wb_sunny,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  // ignore: deprecated_member_use
                                  child: GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => Container(
                                      width: 150,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  primaryColor),
                                        ),
                                        onPressed: () {
                                          controller.addProduct(
                                            CartProductModel(
                                              name: model.name,
                                              image: model.image,
                                              price: model.price,
                                              quantity: 1,
                                              productId: model.productId,
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.shopping_cart),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomText(
                                              text: 'Tambah Keranjang',
                                              alignment: Alignment.center,
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _buildTanamanDetail extends StatelessWidget {
  final IconData detailIcon;
  final String detailTextKategori;
  final String detailTextDeskriprsi;
  const _buildTanamanDetail({
    Key key,
    this.detailIcon,
    this.detailTextKategori,
    this.detailTextDeskriprsi,
    this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            detailIcon,
            size: 25,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 6),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.lightGreen),
                children: [
                  TextSpan(
                    text: detailTextKategori,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: detailTextDeskriprsi,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
