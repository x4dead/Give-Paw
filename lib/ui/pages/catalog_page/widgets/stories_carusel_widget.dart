part of '../catalog_page.dart';

class StoriesCaruselWidget extends StatelessWidget {
  const StoriesCaruselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: kPV8H20,
        separatorBuilder: (context, index) => kSBW8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index < 2) {
                context.pushNamed('stories');
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  clipBehavior: Clip.hardEdge,
                  height: 64,
                  width: 64,
                  child: CachedNetworkImage(
                    imageUrl:
                        "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFhYZGRgaHB4eHBwcHBoaHhwcHBwaHhoeGhocIS4lHB8rHxwcJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHxISHzQrJCs0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIAMgA/AMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAADBAIFBgEAB//EADYQAAEDAgMFBwQCAQUBAQAAAAEAAhEDIQQxQQUSUWHwcYGRobHB0QYTIuEy8RQVI0JSkmJy/8QAGgEAAgMBAQAAAAAAAAAAAAAAAQIAAwQFBv/EACYRAAICAgICAgICAwAAAAAAAAABAhEDIRIxBEEiUTJhE5EUcYH/2gAMAwEAAhEDEQA/AKyiPxR3Ny/vjp4qOHZqmnMuLdad65EpGmMaVAaboueeuvLh+lyqZyz04ZoxpwMuu/tUXN8o8UqkFxXYBrTY8vfLrkjBh61gdeKkKZ/rtB712DH6KjYaBPdIsQOufd4oTm8eGXhn5eKOMOev0hPYRPDv8uOqiaJQFxknS8C/n7Lo8R2KTWjz66K6WWlNaBxONvnNtFNrRwXBThTDe/0Q5A4oFu2XHETEXTLwAh/bU5AUELgckdjeJXTTPPr+11tHii5kUERJC4G9vkibi82JQ5E4og9h5rhZxkIu5zRQNElj0JhneouAysnmt8FA0pM9aJlInESk8PJEDeSO6nYdq8GqOQeKAPYM/ZdAHBH+2eCjudkIcgcRcm97Im7aevNEZTHC3sjmnZM5C8UKFdAGo7EbdC8ByS8n9g4x+gENPb113oTwyc0eowcElUZdOp2Bwj9FjQJ3RbRMNtH988gh02WCY+0bdcFXJliIknj++iusAIFupRBThEFMDy68ilsNA923XXBccyRaD12qbz111dcjndSwpC7qZ/rtQ/tmb/Kcc7vUHNByAUsgo6nfjmuPZyTbmRqhvZqMlORKAliKRbtUhZSDJQslC+5kpNZyTQp2UQzRS7JRBjJUmtGSjUrsaPyIHaUmNsUB/wA2eI+U3FvpEosH0hFkF1GEOjtSk7J7T3jwzTLaoORCVprsnEVNNSa1GKk0jhdSyHmU7KD25o29oUN+RsjaIhct0jJSazVdJ6+V1t7I2GiLhZR3bKfj115qYEg96ICLRbmuudeMuuvJdY3Nde26BAEL2RTD2W65Jepmg5ASBOnglameSdcl6lITmomRofw7Zg8Off8ACcY7InqyUwjZA6j5Tgw5GWceE+fAIyeyRVIjVfJiOtV5gJCMKd7ojWxZVuQyQs+nwUHt68E06mCVAt0UsIAtKIafoiBo/pdexRsgBzePFB+zmjOBB65om7ayDdBoU+3eyMxkTKMGXySe2MY2lTL3f2UY3LSAwG0dpMpCXm3XXcsfjPqOtVdDJY08Mznrp3JLE4t1Z+++TnA4d3FOYPAFzhDSQOu9bo44Y1cuwxi5Mr8dTLYkkuNzJJ9Ug6u4K92jhX75JYVT4hkaQtGOaaBOLT0Q/wAjiE7hcW4fweZ4T7FV26hEJ3BSEUmjX4L6lLSG1Rb/ALDTtE+a1mCxDXgOaQRpGq+TisSIN1ZbE2w7DuBklh/k33HArPl8W1cewqSZ9Pa1CeeSlga7XtDmGQ4AhMPYP7XO6YwiG8dV1jUR+fZwXWCEQkPtnlnz667VI0zdGEZ8/wBKRNu9RukKLsb5KRZf57EY0s4UXM8EvINEXi3yl6jUwoDMoWBIULbINRl025LVW3TWShrAmALR2K3a8HrwSWGo5BNvpEEQpKVsCOt7F14nLqylRYYgm/kmG0rekJGxkJOaT1xUdye5PPp8B1dD+1ysg5DJAmtUHhH3bBRbTvl49yiZBQsRWU5CnVaNOPyj0aY8kabI2kAqw0XyWB2/ijiK4ptP4C3fqQNeHctH9X4806Tt27iCezSSsv8AR1MucXuMmVrxR4Qc366BH5SSNNsP6cYI/wBuf/p3XwtPS2W0CIHqmcABuCOCbDxkubkyym7bNLfHSRTYrZU8J7P3ZZ3aOx5BloK3L3Kqx7WwZKSGWUWPH5LZ8mx+yg0mBHYqavTgwt5tmncwsljaUFd3x8zktmXNjS2ipK7HgpOZKgHLaZejUfRm1zTf9px/B/8AE8D+19FYzXT1XxNlSCCDcGQvr309jxWoMfqRfkRIPmFz/MxU+a9lkZWqHnMEoZpqW/pPVkVpj4WF/Y6B7ilufKI0CFyoBolbbCQc7TihwbozCilg0QIyvI68v6UC0E267E5UZZAezrwUbSAkKluXal6gumw2T0ZQ30xOSiYSeCxYMXidU5WxgiZnhfgsbTxY3BunLM8ZCawWKsWnU+ucdy1Sw+yqMt0aXAYoF5HEFWzHyFjaVQtcC3vHxKtGbTOZOcTbmNVTKDXRYjQ1KrW3JyXqbw5pIWbqY2fy3u3t6C7hNp7pDnfx159FJwk0FySLyuzrwUaYz5dBL4XarH5/jlA7VYhom2onl1kg48ewp30JmmSbD/kVOrUFNhcdB0PFNM48yqb6nxIayAcyPIT6hSNuSRKMJ9T7Qc/eaTn/ACPhAHIJ/wCjcPDWu0PvdZfaz/yeCc3SOxbT6OqD7TCeEXW/PHjgpfY2KnP/AIbfDu/EAf2jhuo7lTf6tTBAJAVpTrAiZsevdceUaNLiwziVUY9hK5tXbbKViZOiq2/UDXZkBNHFJ7SGjoBi8KSqDH7NzJC0NfabCJBEqmx+OBFlsw84sSfFrZjcbSh0JNzU5tB/5KvcV2ofic2emeK2P0ftBwY+nwM/+hEDvCyDlb/TlTdc/wD/ADPgf2lyx5QaAmfQMNjfxEm9/I+iK3Fbzpz9FmMLiJkaTZWWG/GDPn2LmyxJMflo0VSpDY/7ED5nulT+6N6OU+vsqWniiSSewdqLh8V/uOnIW8B/aplj0SM9l22+iIJBQ6NUESMuxTJuqWy1kah17EKqJlNNoSJ0SOJq3Pln6KvthQEPv5Ljh2JJtUyTFh7SlKm1Dw6kq9Y2+hHJIzOCG8Nb5eStsNLZJvEx7qrwb4A428lZMrt3SMiZ46rqTTZmTHKVQ6m3Dx/aFXxE3HWSi2sACIzQfvRqI9TJ8FRx2WKQerUIFj36C6Gyqci7I91kti6++A0SIP5IZq7oFra8+5OoaA5bLvfDWMJNyPZavZbj9pm/IdumQbHMgeS+e1MZIYdA4eHQVo3b7nMMmHfl/wCdPXyVGTE2kPGSbNm3HsIeA4WN/P4Kyn1RUO6HaA38CPhUlfFlgDwbkG3by8Uba2O+62JtAtzifKUYYXGSfoPK2ZvGVAWzHG/cn9n0q25TLQS13AwTynRU+MqS0cpX0r6VwrHYelOe6PGDdaPJyfx4069luJcpv/RnNoCuxwb/AI7XAgEubv2nP8yc/lbD6cDzSc18jduJzg6HwTFbYrXuBL3kD/iSnMPTDGu3RaD5Ll5cyyRUa2a4x4tuz53j2PrVi0E2MeHBP7UwFahSa5lGm+YBBaajoIzJ8rJ/C4IGrPOVozsiYAe5tshB9VbLPwcUul6Ioqm37PltTC135UyxxOTbA9xyT+G2JVa0uqGOAlbv/QmMJcXOceZHoFWbWrgNjgm/y3P4xQixL8mfOtqUYKrajeCsNr1JcVVyuvjvirMGRrkdCd2Y78xzBHl+kk0pjCv3XtI4+oj3TNaYiL1tWBa/kn8JWEEE92uenBVtPePCE9h2jWB2rLJIXY8zFQ0kG4MweOihgscZcXTfXTq6RcQNQez3XqdYAQeGarcFTInTN3sp0tjgVYVDaeBWf2Di5gZ2GvBXb6t45WXMyRak0aYy+IV+IIFs4Vbia5M2RKlY9apaq2OxDiRMr8VUn8QdEN2GZa+i9UYS5xCUr1rrVC60Vvsy4xTgRAbBPAcU8KxMEa6QFTNfJHLXrq6scLUkX0v3THt5rqyiuyixxmKcbGO3uXcIDMngfFKNME8CVPI5wqnFBQerTMgznnzuhV3m9oCkzEzZ2ZjuupYjSdT16qLT2QT3yQpb8E27+FlLf4aiPJDfn17xKYlHMRiZAHBC/wAsxbWR7IVc3S0RrebJ1FUNF7J4gAt8fFb/AOgq4NJrTp7L53UfLRyt2rRfSGLLLcD7KjysfLE0asEqyH1Nz4bOkfCjv/7bjFj8JDB1xVkEqm+otp1sMwMIBBs14FiOY0OS40MbcuK7NsqSsnh6kPGdytPTrcV8v2XtCu97ZFg4EnkCvoVXGsAsbqzyMTi0mCElJEsfjIabrE7VxUzdWu0sUTKy2PeTKu8bCrtgySpUihxj5cUtCPXzS7iu1Ho5kuzhKNSNweBB80ECURqYWzRUMQyLyeU9eisaLKJFnHx9llaTjwPmmmPIyWWWK+mCzRDC0z/yjtcPhTp7Npmd148pVAKtr2UmVZOqV45fYtmqwuFDCN18d37Vq2s7/tPasbhsa4CSZyA4on+ozk6O9Z54HJ7HUqNRVxkZuakqm05MbwByv8SqMV5cTwy8DzSFeof5XP7Sx8dB/kZqKtUxJtmqfFVhvfy0VTiMW8gS4xcJWpmroYK7ZHOzzBHhHin8GyBfUfHXcq5nHhdO/cmOyOMdQtcrKkMOdGuXfdcp6k8LIbQQbEDjl35LznuAMlV0MtBXtg5+ai+oCc5QXOJ5+ZXIGR9kyRAjn2nOyg94N/jzC62iY/cIv2DlEoaRLEnSUKszVWbaLuEJerTN+F+8wEVLY0VsS3AG37k59P4gMqgE2cI70jVJsOH6QzIO8LJnHlFp+yzlxaa9H1GhSeY+0RvWzy8kfaNOu9pD2U3ETG672dCyv01t+SGvMH1W2q7JFdodvls8FxssXjnUv7OjCalG0Y133mGAxoPaFZYCg6Je4b3ATA+UfG7G+0f5EpM1N3MpnNTXxIlRPHkQs1j6lk3jcbMqpxNSVs8fG12UZZr0VtZBIRn5oTyt6MTZGYRGFCJU6aIpYUSS1MePkoYVoLciptmevZUt7A0dc79KEFFDCb6aob2kWQsFHW051TlHDjWEo1TNVwSNNkHnQBbPifVV2Iq6DzUQHON7ojad7oKNEsVqkmN4+GiA9wnJHxDQELeHNWINnKYU/swM4kW7tYQmOhec+XCVY1sVDeEfxM6Dj18o72gyOHzzSj3Na6Y/SetFx6dBI1uwi74C4HWCb3Bb8SisoDRh75UZBMA7vXbCO2n/APUJxmHO7G42M7kc4KbZh2f9WydYy8kjdBEGYMm4f5hK7QbunPMeivHAACIz0VVtVs6ZFLFux1oqHndiLz8A+6DUeIyXnXy6yUXjyWhIZsAx8GRnxW12B9YOY0McbjJYkhchJlxRyKpIEMkoPRvcb9SB5Oqo8RjnOOdlF+yDuhzSRIBSNbCObmVRjxY10aZZJ+wj8QBrJS73lynTwybZhCVdcYlVSkVhaoEK0r4UAc1XParIy5CSjQFwXWFRKI1lk4g7hKl+xNisBHHyVZhmGc09ucSZ4KmSVgsbOImLFBEEm+a6xo8eag+mJ/EenmkpLRNk2vF7qT6psQeGdudku0HhI160QXkzlwsjQNDVOtxPn6rsFxN++6WbTRd88IUf6ABxFFwz68UCoYMIzKhMj+XCfNCqNv8AtFfshJtMGER+FmIN73hHwcQnGOjVM27AKUMHu3N/KE3Sw5m7T3ko9KpLbOB/WaPTeTmTuxfnCSUq2wxVgTWaDoIjjquOxTWgG0RmJytfzQ8TXEmAN45eiDTpjeaHEkBuvCOvBInq2WcSyo1Q4GDMG+VplSp1IAtpxPus7iqjmP8AwdE2MZQMuua8McSN2GyDAJiO7mn4tq0L7NI+r68VW4mrLiOEE3VU/FPLILjINr5ZewQH4kubcmR5qKDJZ4PsCDBv4qL3Z3nLvQ2Cw7SuK6h70ehQDUelRc4gNEk6LSbJ+nC4gv8AAaJMmWMFbYY45Sei32CQ/DsBFwI8FHGbNBv7K5w2ytwxpmjVsPeFx5Zqm3E6EYfGmZIYDkmqGCICvW4K+SI7CEcBCj8hsKgkZbH4OxWZxDLmOa+iY/CZkWt12rDY+jDjotniZeWinNDRU7qKGw0FMMog5cJKhV/gB1dbbMjjQGi+CeBsrGjiGTeT/Sp4U2DVGUUys0bsVSiA0ZZxdFYxhENAM8Fnw4REJqlXe0BrA6dTEyL2VEsdLQbsuHYZjQb30AAui0sCCAS3xWfpsqB4MOnn6LY7PqvLLzOlhl4qjM5QWnY8Em9iYosbnJPBoI4apHEtY8lrQ6wyMWA7k7iqsEsghx53A7uKWbG64DLKeJ19ksG0rGlXSKd+60mRJyiVBgEIeOs4jtntS4Ytqjaspb2O4febcFGr4oFuRHzHbxhDw38TbXNMHDAsnhHb/EFCUqex3FPonhWhwb4keXym3uN4uo4Bu8C0C/tMJluGMZwST0Ss8pLlsZRpCH+K8mRllJ5j1+UxWw/G0NNvX4TLKRa1pmYcM+7IJPHPJcOfrmopNug8Sjxby545WQ8ZTDYjXr5Tb6UGZ/ImeS7jaUiDnkO4FaVLoqcRakfwPEu9AflLlqdZSAbBKUe+SrIvbA0ciwHNMYagXvDRrZcoUS+OGq1H09s7eeDAEZfKqy5VCLZoxY3Iu9jbAaxsbonU6rTYTZoaLWKbwuFhtusk/TpjWF57JmlN22bdRWhEYb8RrHFDfhZOSs32sAgvZJVPJhjITZhwhV6QiOs1ZBiUqtzUsZOyh2i4gHWAbdnZksBtIlznN/V/hfQNond3rcViMSWb7gNZJ5HVdPw3VuhcitCjKcB5OcfKrcU6AByHunmn8H9ZKpruuupjVsw5XSOELtMkGylTYXWAR6mHItHkrbXRTxGaFZurQTxsPZaTZQp1PxAghsnxWMbaxVzsrEBn5AmNRdZs+O46DF72at9BjR/GT2JV+K/FwaA0chedULD4+w/Eneys0T2SjsqBzrMJOsuaB5iFz3Fr8tl1/RUuYP5SS466990o8EAgTYeJmFbCsx87rCNP5R7LrdxhiRvG51AniVcptdoRxMrXwxu5xQH52yV3inudvCAJMZZDU+3eqWpnYGFtxybWypxoYY8hsBMurQwi/UBRoAEABOOw7SL5j0CEpK9liixfZuKLHsdExnzGqv8AA49j94P3Q6YF4kHt58lRtAkhoy5Zpd9A728euxVzxxn3oZWka2vhxu2IjTqFXYyiCLOv7HXyhL7NxJEsJO4BPYeAm10ycSxzoP4kdhEdo7lRxlCQ1WVgAmIIiEHH1A0BXGNwm40u3rDVZHE1y48tFpw1N2iuXxRypVLieHBDDVNoRMJT3njgFpukVJWzS7G2eNwT3850Wx+n9mFri4iBaBrAm0cLoP09hQWCBvcjcXWtw2F3WjU2nwK4Hk5220dWKUY0HpsjrJGgQoWy1XWlYBXs89s6Ie5dNsHLsUXsUApC7xZIVwVZFov11qk8UIyRRZFma2yPxd2LF4hjReO7iOZWx2w4xGViSey/qspisMCLm3bcnPVdPxXSDPSsqHOsYEkhL0NlvcZIPdf9LQYPCE/wpl06mI8TZWQpNYJq1ANN1t9PALY8/HUTI4KXZSYbZ5ZkwCNXuChiaJGb2jx+ArLE7ToNMNbMakyT3qrxW2CbBjAOySjB5JO6BJRiiqxtLXfaUCliCyxmEXF4pz7SPD9JFzlsirVMzSe9Ggwu1BYwDFhcgiBYWMeStcNtVhIDmEEi53hHLVYrK6ZovEc+PBUT8eLHjKzcsrU2z+MTwzKPRfh3NyBGsjIjisJ/lPAiZ8+KewT9+Gte1gm7T+JPys8vFpXY3L9GrxTKQEAtk28clk8Xs0bxy8VejZ5cfycTByE3KQr4QgxB8/hJjfDSY7V9or6OQi6Ypsc4cAvLy1zfYIxVDeHwjiP425kADxUquC/KN5vO68vLNzdsscVQ0zZlh+bQOE2v3IlTDU2D8ngxeGiJ7TwXF5VKbk9k4pFJtraweNxn8dVQwvLy6mOCjHRjnJt7CvZZOYGjfnZeXlJfiND8jZ/Tu1HUDBBLT4j5W4wO2KVSCHjgRy7NF1eXD8nHF3L2dCG1sPiMSBF7mQNUxh2SvLyweh5fiONI67fhdc7ReXkV0Z/YJ7gFX46s0C66vIey2HZjdp7RbcC504d/NZqtjGAy87xzjID5Xl5djxscaK8smJ4nbrzZthwCrKuJcTL3d2Z8BkuLy6MMUV0jLKbFnVRoT6IBcO1eXlaitnCVxeXkRDqnSfB5Ly8gx0NCmeKgW8W968vKtdl/FFrgNqvpA7pDmnMHMdh9lCptVzjO95fteXkFhg3bQLZ//9k=",
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppImages.delete),
                    progressIndicatorBuilder: (context, url, progress) =>
                        const ColoredBox(color: AppColors.colorGray60),
                    fit: BoxFit.cover,
                  ),
                ),
                if (index < 2)
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        border: Border.all(
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: AppColors.colorWhite,
                            width: 2.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
