part of 'widget.dart';

class GetMeatBottomNavigation extends StatelessWidget {
  const GetMeatBottomNavigation(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: GetMeatColors.darkBlue,
        primaryColor: Colors.white,
        selectedRowColor: GetMeatColors.lightGray,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24.sp,
              color: selectedIndex == 0
                  ? GetMeatColors.green
                  : GetMeatColors.lightGray,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              size: 24.sp,
              color: selectedIndex == 1
                  ? GetMeatColors.green
                  : GetMeatColors.lightGray,
            ),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 24.sp,
              color: selectedIndex == 2
                  ? GetMeatColors.green
                  : GetMeatColors.lightGray,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) => onTap(index),
        // selectedItemColor: DiscasColors.darkBlue,
        // unselectedItemColor: DiscasColors.darkBlue.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
