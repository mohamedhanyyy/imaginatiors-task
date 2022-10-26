import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app_images.dart';
import 'package:task/features/product%20info/cubit/product_info_cubit.dart';
import 'package:task/features/product%20info/cubit/product_info_state.dart';
import 'package:task/widgets/product_info_widget.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductInfoCubit>(
      create: (context) => ProductInfoCubit()..getData(),
      child: BlocBuilder<ProductInfoCubit, ProductInfoState>(
        builder: (context, ProductInfoState state) {
          if (state is ProductInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductInfoDone) {
            final cubit = context.read<ProductInfoCubit>();

            return Scaffold(
              appBar: AppBar(
                elevation: 5,
                title: const Text(
                  'Price Runner',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Image.network(
                      cubit.image!,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      cubit.name!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          cubit.price!,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          cubit.discount!,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ExpansionTile(
                      title: const Text(
                        'Discover & compare prices',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      children: [
                        buildProductItemWidget(
                            imagePath: AppImages.amazon,
                            name: 'Amazon',
                            price: '8200 EGP'),
                        buildProductItemWidget(
                            imagePath: AppImages.jumia,
                            name: 'Jumia Egypt',
                            price: '8499 EGP'),
                        buildProductItemWidget(
                            imagePath: AppImages.dubai,
                            name: 'Dubai Phone',
                            price: '8499 EGP'),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
