import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/core/theme/app_colors.dart';
import 'package:test_flutter_application/features/main/domain/entities/crypto_currency_entitty.dart';
import 'package:test_flutter_application/features/main/presentation/bloc/main_bloc.dart';
import 'package:test_flutter_application/features/main/presentation/bloc/main_event.dart';
import 'package:test_flutter_application/features/main/presentation/bloc/main_state.dart';
import 'package:test_flutter_application/features/main/presentation/widgets/colored_text.dart';
import 'package:test_flutter_application/features/main/presentation/widgets/filled_button_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<MainBloc>().add(MainInitializeEvent());
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        height: size.height * 0.4,
                        width: size.width * 0.5,
                        child: Image.asset("assets/images/shield_image.png"),
                      ),
                    ),
                    _buildWalletButtons(context, size),
                    const _TopCryptoCurrenciesTitle(),
                    if (state is MainResponseState) ...{
                      state.cryptoCurrenciesResponse.fold(
                        (errorMessage) => const Center(
                          child: Text(
                            "NO DATA",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        (cryptoCurrencies) => _ExchangesRateList(
                          cryptoCurrenciesList: cryptoCurrencies,
                        ),
                      ),
                    },
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWalletButtons(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            FilledButtonWidget(
              onButtonTab: () {},
              buttonText: "ایجاد کیف پول هوشمند",
            ),
            const SizedBox(height: 2),
            TextButton(
              onPressed: () {},
              child: Text(
                "کیف پول دارم",
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  decoration: TextDecoration.lineThrough,
                  decorationColor:
                      AppColors.secondaryTextColor.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 150,
          child: VerticalDivider(
            color: AppColors.primaryTextColor,
            thickness: 2,
            endIndent: 10,
          ),
        ),
        Column(
          children: [
            FilledButtonWidget(
              onButtonTab: () {},
              buttonText: "ایجاد کیف پول شخصی",
            ),
            const SizedBox(height: 2),
            TextButton(
              onPressed: () {},
              child: Text(
                "بازیابی کیف پول",
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  decoration: TextDecoration.lineThrough,
                  decorationColor:
                      AppColors.secondaryTextColor.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TopCryptoCurrenciesTitle extends StatelessWidget {
  const _TopCryptoCurrenciesTitle();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "رمز ارزهای برتر",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTextColor,
            ),
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}

class _ExchangesRateList extends StatelessWidget {
  final List<CryptoCurrencyEntity> cryptoCurrenciesList;

  const _ExchangesRateList({
    required this.cryptoCurrenciesList,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cryptoCurrenciesList.length,
        itemBuilder: (context, index) {
          var cryptoCurrency = cryptoCurrenciesList[index];
          return _CryptoCurrencyItem(
            cryptoCurrency: cryptoCurrency,
          );
        },
      ),
    );
  }
}

class _CryptoCurrencyItem extends StatelessWidget {
  final CryptoCurrencyEntity cryptoCurrency;

  const _CryptoCurrencyItem({
    required this.cryptoCurrency,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(cryptoCurrency.name),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cryptoCurrency.fullName,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cryptoCurrency.name,
                  style: const TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cryptoCurrency.price,
                style: TextStyle(
                  color: cryptoCurrency.changePCT24Hour >= 0
                      ? AppColors.greenExchangeRateColor
                      : AppColors.redExchangeRateColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ColoredText(
                value: cryptoCurrency.changePCT24Hour,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
