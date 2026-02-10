import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/information_header_card.dart';
import '../widgets/information_list_item.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Blue Gradient Header Background
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppPallete.primaryBlue,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0077C2),
                        Color(0xFF005b9f),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar replacement
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                          ),
                          const Text(
                            'Informasi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_list, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    
                    // Horizontal Cards
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: const [
                          InformationHeaderCard(
                            icon: Icons.shield_outlined,
                            title: 'Kebijakan',
                            subtitle: '0 Baru',
                          ),
                          SizedBox(width: 16),
                          InformationHeaderCard(
                            icon: Icons.calendar_today,
                            title: 'Acara',
                            subtitle: '1 Mendatang',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // List Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  InformationListItem(
                    icon: Icons.calendar_today,
                    title: 'Kebijakan WFH',
                    description: 'kebijakan wfh karyawan',
                    date: '07 Mar 2025',
                    iconBgColor: AppPallete.yellow.withOpacity(0.1),
                    iconColor: AppPallete.yellow,
                  ),
                   InformationListItem(
                    icon: Icons.campaign_outlined,
                    title: 'Pemadaman Listrik Terjadwal',
                    description: 'Diberitahukan bahwa pada tanggal 5 Maret 2025 pukul 14.00-16.00 akan ada pemadaman listrik.',
                    date: '30 Jan 2020',
                    iconBgColor: AppPallete.primaryBlue.withOpacity(0.1),
                    iconColor: AppPallete.primaryBlue,
                  ),
                   InformationListItem(
                    icon: Icons.campaign_outlined,
                    title: 'Libur Nasional Idul Fitri 2025',
                    description: 'Sehubungan dengan Hari Raya Idul Fitri, kantor akan tutup pada tanggal...',
                    date: '01 Nov 2019',
                    iconBgColor: AppPallete.primaryBlue.withOpacity(0.1),
                    iconColor: AppPallete.primaryBlue,
                  ),
                   InformationListItem(
                    icon: Icons.campaign_outlined,
                    title: 'Libur Nasional Idul Fitri 2025',
                    description: 'Sehubungan dengan Hari Raya Idul Fitri, kantor akan tutup pada tanggal...',
                    date: '30 Aug 2019',
                    iconBgColor: AppPallete.primaryBlue.withOpacity(0.1),
                    iconColor: AppPallete.primaryBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
