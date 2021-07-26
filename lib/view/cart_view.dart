import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planty_shop/core/viewmodels/cart_view_model.dart';
import 'package:planty_shop/view/widgets/custom_button.dart';
import 'package:planty_shop/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: CustomText(
            text: 'Keranjang',
            color: Colors.white,
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body: controller.cartProductModel.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart_empty.svg',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Cart Empty',
                    fontSize: 28,
                    alignment: Alignment.topCenter,
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          itemCount: controller.cartProductModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    child: Image.network(
                                      controller.cartProductModel[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProductModel[index].name,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          maxLine: 2,
                                          overFlow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        CustomText(
                                          text: NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(
                                            int.parse(controller
                                                .cartProductModel[index].price),
                                          ),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.lightGreen,
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 30,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .decreaseQuantity(
                                                              index);
                                                    },
                                                    child: Container(
                                                      width: 30,
                                                      height: 60,
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      color:
                                                          Colors.grey.shade200,
                                                      child: Icon(
                                                        Icons.minimize_sharp,
                                                        color: Colors.black,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  CustomText(
                                                    alignment: Alignment.center,
                                                    text: controller
                                                        .cartProductModel[index]
                                                        .quantity
                                                        .toString(),
                                                    fontSize: 16,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    child: Container(
                                                      width: 30,
                                                      height: 30,
                                                      color:
                                                          Colors.grey.shade200,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.delete(index);
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: 'Total',
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GetBuilder<CartViewModel>(
                                    init: CartViewModel(),
                                    builder: (controller) => CustomText(
                                      text: NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(
                                        controller.totalPrice,
                                      ),
                                      fontSize: 16,
                                      color: Colors.lightGreen,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 200,
                                child: CustomButton(
                                  onPress: () {},
                                  text: 'Checkout',
                                ),
                              )
                            ],
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
