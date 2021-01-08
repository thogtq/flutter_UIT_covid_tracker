import 'package:flutter/material.dart';
import 'package:novel_covid_19/custom_widgets/guidance_item.dart';

class CovidGuidance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          GuidanceItem(
              title: "Các triệu chứng Covid 19",
              content:
                  "\u2022 Các triệu chứng thường gặp nhất : sốt, ho khan, mệt mỏi\n\u2022 Các triệu chứng ít gặp hơn:đau nhức, đau họng, tiêu chảy, viêm kết mạc, đau đầu, mất vị giác hoặc khứu giác, da nổi mẩn hay ngón tay hoặc ngón chân bị tấy đỏ hoặc tím tái\n\u2022 Các triệu chứng nghiêm trọng:khó thở, đau hoặc tức ngực, mất khả năng nói hoặc cử động\n\u2022 Hãy đi khám ngay lập tức nếu bạn gặp phải các triệu chứng nghiêm trọng. Luôn gọi điện trước khi gặp bác sĩ hoặc đến cơ sở y tế.",
              imageDir: "assets/image/covid.jpg"),
          GuidanceItem(
              title: "Hướng dẫn tự cách ly tại nhà",
              content: "",
              imageDir: "assets/image/tu_cach_ly.jpg"),
          GuidanceItem(
              title: "7 việc cần làm ngay khi xuất hiện triệu chứng",
              content: "",
              imageDir: "assets/image/7_viec.jpg")
        ],
      ),
    );
  }
}
