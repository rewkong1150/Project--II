import 'package:flutter/material.dart';

class ProgrammingSection {
  final String imageName;
  final String title;
  final String subTitle;
  final String url;
  final Color highlightColor;
  ProgrammingSection(
      {this.imageName,
      this.title,
      this.subTitle,
      this.url,
      this.highlightColor});
}

List<ProgrammingSection> programmingSection = [
  new ProgrammingSection(
      imageName: 'covid.png',
      title: 'วัคซีน',
      subTitle: 'Cross',
      highlightColor: Colors.yellow),
  new ProgrammingSection(
      imageName: 'Atk.png',
      title: 'Atk',
      url: 'https://www.youtube.com/',
      subTitle: 'Swift',
      highlightColor: Colors.lightGreenAccent),
  new ProgrammingSection(
      imageName: 'RT-PCR.png',
      title: 'RT-PCR',
      subTitle: 'Kotlin',
      highlightColor: Colors.purpleAccent),
  new ProgrammingSection(
      imageName: 'pngegg.png',
      title: 'ติดโควิด',
      subTitle: 'Diary',
      highlightColor: Colors.orangeAccent),
];

List<ProgrammingSection> featureSection = [
  new ProgrammingSection(
      imageName: 'news.png', url: 'https://covid19.thaipbs.or.th/live/'),
  new ProgrammingSection(
      imageName: 'vac.png',
      url: 'http://www.tlclab.net/tlc/pre_covid19_vaccine/'),
  new ProgrammingSection(
      imageName: 'cvcv.png',
      url:
          'https://www.who.int/docs/default-source/searo/thailand/update-28-covid-19-what-we-know---june2020---thai.pdf?sfvrsn=724d2ce3_0'),
];

List<ProgrammingSection> popularMaterialsHorizontalList = [
  new ProgrammingSection(
      imageName: 'ccv.png',
      title: 'วัคซีนโควิด-19',
      subTitle: 'วัคซีนโควิด-19 มีกี่ชนิด',
      url:
          'https://loydlab.blogspot.com/2018/06/programming-diary-express-entry.html'),
  new ProgrammingSection(
      imageName: 'ggf.png',
      title: 'ATK',
      subTitle: 'ตรวจ ATK ด้วยตัวเองกัน',
      url: 'https://bangpakok3.com/care_blog/view/134'),
  new ProgrammingSection(
      imageName: 'ccggn.jpg',
      title: 'ติดโควิด',
      subTitle: 'ขึ้น2ขีดทำอย่างไร',
      url:
          'https://www.sikarin.com/health/%E0%B8%95%E0%B8%A3%E0%B8%A7%E0%B8%88-covid-19-%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2-atk-%E0%B8%9C%E0%B8%A5%E0%B9%80%E0%B8%9B%E0%B9%87%E0%B8%99%E0%B8%9A%E0%B8%A7%E0%B8%81-%E0%B8%95%E0%B9%89%E0%B8%AD'),
  new ProgrammingSection(
      imageName: 'asdasdasdasd.jpg',
      title: 'PC-PCR vs ATK',
      subTitle: 'ตรวจหาเชื้อโควิด-19 แบบ RT-PCR กับ ATK ต่างกันอย่างไร',
      url:
          'https://vichaivej-nongkhaem.com/health-info/%E0%B8%95%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B9%82%E0%B8%84%E0%B8%A7%E0%B8%B4%E0%B8%94rt-pcr%E0%B8%81%E0%B8%B1%E0%B8%9Aatk%E0%B8%95%E0%B9%88%E0%B8%B2%E0%B8%87%E0%B8%81%E0%B8%B1%E0%B8%99/'),
];
