import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_provider.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String articleText = '''
เรื่องราวของ Genshin Impact เกิดขึ้นใน “Teyvat” โลกแฟนตาซีซึ่งมีประวัติศาสตร์ยาวนาน นี่คือดินแดนที่มีเทพเจ้าและสารพัดสิ่งมีชีวิตอันทรงพลัง แต่ ณ ยุคปัจจุบันจะมีเทพ (Archon) อันเป็นที่รู้จักโดยทั่วไปอยู่ 7 องค์

เทพเจ้าทั้ง 7 ต่างมีอิทธิพลอยู่เหนือ 7 ประเทศใน Teyvat อันประกอบไปด้วย Mondstadt, Liyue, Inazuma, Sumeru, Fontaine, Natlan และ Snezhnaya
ผู้เล่นจะได้เลือกรับบทเป็น 1 ใน 2 ฝาแฝด “นักเดินทาง” คือ Aether และ Lumine ผู้ข้ามมิติไปยังโลกต่าง ๆ

แต่แล้วทั้งคู่ก็มาติดหล่มอยู่ ณ โลกแห่ง Teyvat เพราะถูกขัดขวางไว้โดยเทพที่ไม่ทราบชื่อ (Unknown God) และต้องแยกจากกัน โดยแฝดอีกคนที่เราไม่ได้เลือกเล่น จะหลุดเข้าไปยัง Teyvat ล่วงหน้าก่อนเราประมาณ 500 ปี
เป้าหมายของนักเดินทาง คือการตามหาแฝดให้พบ และกลับไปยังโลกของตัวเอง โดยหลังจากที่พลัดหลงเข้ามายัง Teyvat สักพัก ก็ได้พบกับเพื่อนตัวจิ๋ว “Paimon” และกลายเป็นคู่หูร่วมเดินทางนับตั้งแต่นั้นมา
''';

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('เนื้อเรื่อง Genshin Impact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          articleText,
          style: TextStyle(
            fontSize: settings.fontSize,
            fontFamily: settings.fontFamily,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
