// import 'package:fish_finder/model/fish.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// List<Fish> dummyFishData = [
//   Fish(
//     name: 'Arctic Char',
//     scientificName: 'Salvelinus alpinus',
//     description:
//         'ปลาน้ำเย็นที่พบในภูมิภาคอาร์กติกและซับอาร์กติก. มีลักษณะสีที่หลากหลายตั้งแต่สีส้มไปจนถึงสีเขียว. มักพบในทะเลสาบน้ำจืดและแม่น้ำที่มีน้ำเย็น.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FArctic%20Char%2Farctic-char.png?alt=media&token=0e7d81e2-4095-4dbb-8a12-fc1ade180cf5',
//     habitat:
//         'อาศัยอยู่ในทะเลสาบและแม่น้ำที่เย็นจัดในภูมิภาคอาร์กติกและซับอาร์กติก. พบในพื้นที่ที่น้ำมีอุณหภูมิไม่เกิน 10 องศาเซลเซียส. มีการเคลื่อนย้ายตามฤดูกาลเพื่อหาน้ำที่เย็น.',
//     averageSize: 70.0,
//     averageWeight: 3.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Arctic Char', 'Char'],
//     diet:
//         'กินแมลง, กุ้ง, และปลาขนาดเล็ก. มักจะล่าเหยื่อที่อยู่ใกล้ผิวน้ำ. อาจกินสัตว์น้ำที่ตายแล้วในบางครั้ง.',
//     reproduction:
//         'วางไข่ในน้ำจืดที่มีสภาพแวดล้อมเหมาะสม. ช่วงฤดูวางไข่มักเกิดขึ้นในฤดูใบไม้ร่วง. ไข่จะฟักออกเป็นลูกปลาในฤดูหนาว.',
//     lifespan:
//         'อายุขัยเฉลี่ยประมาณ 10-15 ปี. อาจอาศัยอยู่ได้นานถึง 20 ปีในบางกรณี. ขึ้นอยู่กับสภาพแวดล้อมและความสามารถในการหาอาหาร.',
//   ),
//   Fish(
//     name: 'Black Sea Sprat',
//     scientificName: 'Sprattus sprattus',
//     description:
//         'ปลาขนาดเล็กที่พบในทะเลดำและพื้นที่ใกล้เคียง. มีลักษณะสีเงินสะท้อนแสงที่ทำให้โดดเด่น. ตัวปลามักมีลักษณะเพรียวและยาว.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FBlack%20Sea%20Sprat%2Fone-little-fishey-single-spratt-600nw-72571852.webp?alt=media&token=6ea53c54-87a0-4c73-ad11-a718ecf8b06e',
//     habitat:
//         'พบในทะเลดำและน้ำรอบข้าง. ชอบอาศัยอยู่ในพื้นที่ที่มีแพลงก์ตอนจำนวนมาก. มักพบในกลุ่มใหญ่ใกล้พื้นทะเลหรือในบริเวณที่มีพืชน้ำ.',
//     averageSize: 15.0,
//     averageWeight: 0.1,
//     isEndangered: false,
//     conservationStatus: 'Not Evaluated',
//     commonNames: ['Black Sea Sprat', 'Sprat'],
//     diet:
//         'กินแพลงก์ตอนและกุ้งขนาดเล็ก. ปลานี้มีความสำคัญในห่วงโซ่อาหารสำหรับปลาขนาดใหญ่. ยังสามารถกินสัตว์น้ำขนาดเล็กอื่นๆ ได้.',
//     reproduction:
//         'วางไข่ในทะเลดำในฤดูใบไม้ผลิและฤดูร้อน. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่เติบโตในช่วงฤดูร้อน. ปลาสามารถสืบพันธุ์ได้เร็วและมีจำนวนมาก.',
//     lifespan:
//         'อายุขัยเฉลี่ยประมาณ 5 ปี. อาจมีอายุยืนถึง 7 ปีในบางกรณี. ขึ้นอยู่กับสภาพแวดล้อมและอัตราการเติบโต.',
//   ),
//   Fish(
//     name: 'Gilt-Head Bream',
//     scientificName: 'Sparus aurata',
//     description:
//         'ปลาที่มีแถบทองที่หัวและลำตัวสีเงิน. เป็นที่รู้จักในด้านรสชาติที่ยอดเยี่ยมและเนื้อที่มีคุณภาพสูง. มีความสำคัญในอุตสาหกรรมการประมง.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FGilt-Head%20Bream%2FSparus_aurata_Sardegna.jpg?alt=media&token=73853601-a93b-4b89-b1eb-a7bfbaca5398',
//     habitat:
//         'อาศัยอยู่ในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. พบในน้ำตื้นที่มีพื้นทรายและหิน. มักจะอยู่ในพื้นที่ที่มีพืชน้ำหรือปะการัง.',
//     averageSize: 50.0,
//     averageWeight: 2.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Gilt-Head Bream', 'Sea Bream'],
//     diet:
//         'กินปลาขนาดเล็ก, กุ้ง, และหอย. ปลานี้ใช้ปากที่แข็งแรงในการขุดหาอาหารที่พื้นทะเล. มีการล่าหาอาหารตามวันและคืน.',
//     reproduction:
//         'วางไข่ในน้ำตื้นของทะเลเมดิเตอร์เรเนียน. ช่วงฤดูวางไข่เกิดขึ้นในฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่เติบโตในพื้นที่ทะเลตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเติบโตอย่างรวดเร็วและมีความยืดหยุ่นในสภาพแวดล้อม. ขึ้นอยู่กับคุณภาพของอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Hourse Mackerel',
//     scientificName: 'Trachurus trachurus',
//     description:
//         'ปลาทะเลที่มีลักษณะคล้ายม้าด้วยลำตัวที่เพรียวและครีบที่ยาว. เป็นปลาที่เคลื่อนที่ได้เร็วและสามารถหาอาหารได้อย่างรวดเร็ว. เป็นที่นิยมในตลาดการประมง.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FHorse%20Mackerel%2Fhorse-mackerel.webp?alt=media&token=22912eef-7bb7-4e4b-95a0-a818a5c77926',
//     habitat:
//         'อาศัยอยู่ในทะเลอุ่นของมหาสมุทรแอตแลนติกและทะเลเมดิเตอร์เรเนียน. พบในน้ำที่มีความลึกปานกลาง. ชอบอยู่เป็นกลุ่มใหญ่เพื่อป้องกันตัวเองจากนักล่า.',
//     averageSize: 35.0,
//     averageWeight: 0.8,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Hourse Mackerel', 'Atlantic Horse Mackerel'],
//     diet:
//         'กินแพลงก์ตอนและปลาขนาดเล็ก. ปลานี้จะหากินในช่วงกลางวันและกลางคืน. การล่าสัตว์เป็นกลุ่มเพื่อเพิ่มโอกาสในการหาอาหาร.',
//     reproduction:
//         'วางไข่ในน้ำอุ่นของมหาสมุทร. ช่วงฤดูวางไข่เกิดขึ้นในฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นอย่างรวดเร็ว.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 15 ปี. ปลานี้มีการเจริญเติบโตที่รวดเร็วและอัตราการสืบพันธุ์ที่สูง. ขึ้นอยู่กับสภาพแวดล้อมและอาหารที่มีอยู่.',
//   ),
//   Fish(
//     name: 'Red Mullet',
//     scientificName: 'Mullus barbatus',
//     description:
//         'ปลาที่มีสีแดงสดและมีลักษณะเด่นที่สวยงาม. มักพบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. เป็นที่นิยมในอาหารทะเลเพราะเนื้อที่มีรสชาติที่ดี.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FRed%20Mullet%2Frougets_frederic_federowski-convention.jpg?alt=media&token=34fbd30d-afd7-4e9d-a30b-00bb5bf59bad',
//     habitat:
//         'พบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. อาศัยอยู่ในพื้นที่ที่มีพื้นทรายและหิน. มักจะอยู่ใกล้กับปะการังและพืชน้ำ.',
//     averageSize: 25.0,
//     averageWeight: 0.5,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Red Mullet', 'Striped Mullet'],
//     diet:
//         'กินแพลงก์ตอน, กุ้ง, และหอย. ใช้ปากที่แข็งแรงในการค้นหาอาหารที่พื้นทะเล. สามารถกินสัตว์น้ำขนาดเล็กอื่นๆ ได้.',
//     reproduction:
//         'วางไข่ในน้ำตื้นของทะเลเมดิเตอร์เรเนียน. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิและฤดูร้อน. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่เติบโตในน้ำตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับความพร้อมของอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Red Sea Bream',
//     scientificName: 'Pagrus major',
//     description:
//         'ปลาที่มีสีแดงสดและพบในทะเลแดงและทะเลญี่ปุ่น. เป็นที่นิยมในอาหารทะเลสำหรับรสชาติที่ยอดเยี่ยมและเนื้อที่ละเอียด. มีความสำคัญทางเศรษฐกิจในหลายประเทศ.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FRed%20Sea%20Bream%2F360_F_857090600_lA1hle0Ba7SJ96PK5PGpfw9grfEyOAxK.jpg?alt=media&token=c88b050b-a8b4-421d-a108-d2c7c6b80fe6',
//     habitat:
//         'พบในทะเลแดง, ทะเลญี่ปุ่น, และทะเลจีนใต้. อาศัยอยู่ในพื้นที่ที่มีพื้นทรายและหิน. มักจะอยู่ในกลุ่มเล็กๆ หรือเป็นคู่.',
//     averageSize: 40.0,
//     averageWeight: 1.5,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Red Sea Bream', 'Sea Bream'],
//     diet:
//         'กินปลาขนาดเล็ก, กุ้ง, และหอย. ใช้ปากในการขุดหาอาหารที่พื้นทะเล. สามารถกินสัตว์น้ำขนาดเล็กอื่นๆ ได้.',
//     reproduction:
//         'วางไข่ในน้ำอุ่นของทะเล. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในพื้นที่ทะเลตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 15 ปี. การเจริญเติบโตอย่างรวดเร็วในช่วงปีแรก. ขึ้นอยู่กับคุณภาพของอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Red-snapper',
//     scientificName: 'Lutjanus campechanus',
//     description:
//         'ปลาทะเลที่มีลักษณะสีแดงสดและเนื้อที่มีรสชาติยอดเยี่ยม. เป็นที่นิยมในตลาดอาหารทะเลและการตกปลา. มักพบในพื้นที่ทะเลลึก.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FRed-snapper%2Fimages15.jpg?alt=media&token=08ba3941-1c7f-4456-858d-e08c6032d821',
//     habitat:
//         'พบในทะเลแอตแลนติกตะวันออกและทะเลแคริบเบียน. อาศัยอยู่ในพื้นที่ที่มีพื้นทรายและปะการัง. มักจะอยู่ในกลุ่มหรือเป็นคู่.',
//     averageSize: 70.0,
//     averageWeight: 3.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Red-snapper', 'American Red Snapper'],
//     diet:
//         'กินปลา, กุ้ง, และหอย. ใช้ปากที่แข็งแรงในการจับเหยื่อ. สามารถล่าเหยื่อได้อย่างรวดเร็ว.',
//     reproduction:
//         'วางไข่ในน้ำลึกของทะเลแคริบเบียนและมหาสมุทรแอตแลนติก. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่เติบโตในพื้นที่ทะเลตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 20 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับความสามารถในการหาอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Sardine Fish',
//     scientificName: 'Sardina pilchardus',
//     description:
//         'ปลาขนาดเล็กที่มีลักษณะสีเงินและเป็นที่นิยมในอาหารทะเล. พบในกลุ่มใหญ่และเป็นที่นิยมในตลาดการประมง. มีรสชาติอร่อยและเป็นแหล่งของกรดไขมันโอเมก้า-3.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FSardine%20Fish%2F53cf73cb4ac2d640.jpg?alt=media&token=7699babd-ab45-4693-a8bc-e63ce11c203f',
//     habitat:
//         'พบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. อาศัยอยู่ในน้ำที่มีความลึกปานกลางและมักพบในกลุ่มใหญ่. ชอบอยู่ในพื้นที่ที่มีแพลงก์ตอนจำนวนมาก.',
//     averageSize: 20.0,
//     averageWeight: 0.2,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Sardine Fish', 'Sardina'],
//     diet:
//         'กินแพลงก์ตอนและกุ้งขนาดเล็ก. ปลานี้มีการเคลื่อนไหวเป็นกลุ่มใหญ่เพื่อหาอาหาร. สามารถกินสัตว์น้ำขนาดเล็กอื่นๆ ได้.',
//     reproduction:
//         'วางไข่ในน้ำตื้นของทะเลเมดิเตอร์เรเนียน. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในน้ำตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 8 ปี. การเติบโตอย่างรวดเร็วในช่วงปีแรก. ขึ้นอยู่กับความสามารถในการหาอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Sea Bass',
//     scientificName: 'Dicentrarchus labrax',
//     description:
//         'ปลาทะเลที่มีลักษณะสีเงินและดำ. เป็นที่นิยมในอาหารทะเลและมีรสชาติที่ยอดเยี่ยม. พบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติก.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FSea%20Bass%2Fgiant_sea_bass_sideview_RRiggs.jpg?alt=media&token=c37765f5-86f6-457d-8da3-b18ccdaceade',
//     habitat:
//         'พบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. อาศัยอยู่ในพื้นที่ที่มีพื้นทรายและหิน. มักพบในน้ำตื้นใกล้ชายฝั่ง.',
//     averageSize: 60.0,
//     averageWeight: 2.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Sea Bass', 'European Sea Bass'],
//     diet:
//         'กินปลาขนาดเล็ก, กุ้ง, และหอย. ใช้ปากที่แข็งแรงในการจับเหยื่อ. มักจะล่าเหยื่อในช่วงกลางวัน.',
//     reproduction:
//         'วางไข่ในน้ำตื้นของทะเลเมดิเตอร์เรเนียน. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิและฤดูร้อน. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในน้ำตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับสภาพแวดล้อมและการหาอาหาร.',
//   ),
//   Fish(
//     name: 'Shrimp',
//     scientificName: 'Caridea spp.',
//     description:
//         'กุ้งที่พบในน้ำทะเลและน้ำจืด. เป็นที่นิยมในอาหารทะเลเพราะมีรสชาติที่ยอดเยี่ยม. มีลักษณะลำตัวที่โปร่งใสและมีขนาดหลากหลาย.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FShrimp%2F640x427-Shrimp-White-NOAAFisheries.png?alt=media&token=bfc107e5-affb-4dc6-b689-3833b19ed235',
//     habitat:
//         'พบในน้ำทะเล, น้ำจืด, และพื้นที่ชายฝั่ง. อาศัยอยู่ในบริเวณที่มีพื้นทรายและหิน. มักจะอยู่ในกลุ่มหรือเป็นคู่.',
//     averageSize: 10.0,
//     averageWeight: 0.1,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Shrimp', 'Prawn'],
//     diet:
//         'กินแพลงก์ตอนและวัชพืช. ใช้ปากในการค้นหาอาหารที่พื้นทะเลหรือในโคลน. สามารถกินสัตว์น้ำขนาดเล็กอื่นๆ ได้.',
//     reproduction:
//         'วางไข่ในน้ำตื้นของทะเลและน้ำจืด. ช่วงฤดูวางไข่คือฤดูร้อน. ไข่จะฟักออกเป็นตัวกุ้งเล็กๆ ที่โตขึ้นในน้ำตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 2 ปี. การเจริญเติบโตอย่างรวดเร็วในช่วงปีแรก. ขึ้นอยู่กับสภาพแวดล้อมและการหาอาหาร.',
//   ),
//   Fish(
//     name: 'Striped Red Mullet',
//     scientificName: 'Mullus surmuletus',
//     description:
//         'ปลาที่มีลักษณะสีแดงและแถบขาว. พบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. เป็นที่นิยมในตลาดการประมงสำหรับรสชาติที่ดี.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FStriped%20Red%20Mullet%2Fstriped-red-mullet-mullus-surmuletus-EH4MGJ.jpg?alt=media&token=458de813-df68-4c81-b2d2-bdb224c304a2',
//     habitat:
//         'พบในทะเลเมดิเตอร์เรเนียนและมหาสมุทรแอตแลนติกตะวันออก. อาศัยอยู่ในพื้นที่ที่มีพื้นทรายและหิน. มักจะอยู่ในกลุ่มหรือเป็นคู่.',
//     averageSize: 25.0,
//     averageWeight: 0.6,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Striped Red Mullet', 'Red Mullet'],
//     diet:
//         'กินแพลงก์ตอน, กุ้ง, และหอย. ใช้ปากในการค้นหาอาหารที่พื้นทะเล. สามารถกินสัตว์น้ำขนาดเล็กอื่นๆ ได้.',
//     reproduction:
//         'วางไข่ในน้ำตื้นของทะเลเมดิเตอร์เรเนียน. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในน้ำตื้น.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับความสามารถในการหาอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Tilapia Fish',
//     scientificName: 'Oreochromis spp.',
//     description:
//         'ปลาน้ำจืดที่มีความหลากหลายและนิยมในการเพาะเลี้ยง. พบในแอฟริกาและบางส่วนของเอเชีย. เป็นที่รู้จักในเรื่องของการเติบโตที่รวดเร็วและเนื้อที่มีรสชาติที่ดี.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FTilapia%20Fish%2F20140620100334.jpg?alt=media&token=7805ca12-0695-4034-8ef0-bcf889cf0072',
//     habitat:
//         'พบในน้ำจืดของแอฟริกาและเอเชีย. อาศัยอยู่ในแหล่งน้ำที่มีความลึกตื้น. ชอบพื้นที่ที่มีพืชน้ำและการเคลื่อนที่ของน้ำ.',
//     averageSize: 30.0,
//     averageWeight: 1.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Tilapia Fish', 'Nile Tilapia'],
//     diet:
//         'กินพืชน้ำ, แพลงก์ตอน, และแมลง. ปลานี้สามารถปรับตัวให้เข้ากับอาหารที่มีอยู่ในสภาพแวดล้อมได้. อาจกินพืชน้ำขนาดเล็กและสัตว์น้ำที่ตายแล้ว.',
//     reproduction:
//         'วางไข่ในน้ำจืดที่มีสภาพแวดล้อมเหมาะสม. ช่วงฤดูวางไข่เกิดขึ้นในฤดูฝน. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่เติบโตในน้ำจืด.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับการเลี้ยงดูและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Trout',
//     scientificName: 'Oncorhynchus mykiss',
//     description:
//         'ปลาน้ำจืดที่มีสีสันสวยงามและเป็นที่นิยมในการตกปลา. พบในภูมิภาคที่มีน้ำเย็นและสะอาด. มีรสชาติที่ดีและเนื้อที่มีคุณภาพสูง.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FTrout%2FSalmo_trutta_Ozeaneum_Stralsund_HBP_2010-07-02.jpg?alt=media&token=5b11d822-050b-4814-b495-9661a38a9681',
//     habitat:
//         'พบในน้ำจืดของอเมริกาเหนือและยุโรป. อาศัยอยู่ในแม่น้ำและทะเลสาบที่มีน้ำเย็นและสะอาด. ชอบพื้นที่ที่มีกระแสน้ำไหลเร็ว.',
//     averageSize: 45.0,
//     averageWeight: 1.5,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Trout', 'Rainbow Trout'],
//     diet:
//         'กินแมลง, แพลงก์ตอน, และปลาเล็ก. ปลานี้มีการล่าสัตว์ในช่วงกลางวันและกลางคืน. สามารถกินสัตว์น้ำที่ตายแล้วในบางครั้ง.',
//     reproduction:
//         'วางไข่ในน้ำจืดที่มีสภาพแวดล้อมเหมาะสม. ช่วงฤดูวางไข่เกิดขึ้นในฤดูใบไม้ร่วงและฤดูหนาว. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่เติบโตในน้ำจืด.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 15 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับสภาพแวดล้อมและความสามารถในการหาอาหาร.',
//   ),
//   Fish(
//     name: 'Bass Fish',
//     scientificName: 'Micropterus spp.',
//     description:
//         'ปลาน้ำจืดที่พบในอเมริกาเหนือและมีความนิยมในการตกปลา. มีลำตัวที่แข็งแรงและมีการเคลื่อนที่ที่รวดเร็ว. เป็นที่รู้จักในด้านความสามารถในการล่าเหยื่อ.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FBass%20Fish%2F134-1342992_bass-fishing-png-bass-fish-png.png?alt=media&token=3e771e9d-c57e-430c-a246-50e3a9cc0606',
//     habitat:
//         'พบในน้ำจืดของอเมริกาเหนือ. อาศัยอยู่ในทะเลสาบ, แม่น้ำ, และแหล่งน้ำที่มีความลึกต่างๆ. ชอบพื้นที่ที่มีพืชน้ำและความลึกที่เหมาะสม.',
//     averageSize: 60.0,
//     averageWeight: 2.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Bass Fish', 'Largemouth Bass'],
//     diet:
//         'กินปลา, แมลง, และกุ้ง. ใช้ปากในการจับเหยื่อที่เคลื่อนไหวเร็ว. มักจะล่าเหยื่อในช่วงกลางวันและกลางคืน.',
//     reproduction:
//         'วางไข่ในน้ำจืดในช่วงฤดูใบไม้ผลิ. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในน้ำจืด. ช่วงฤดูวางไข่มีการดูแลจากพ่อแม่.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับคุณภาพของอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Catfish',
//     scientificName: 'Siluriformes spp.',
//     description:
//         'ปลาน้ำจืดที่มีลักษณะเด่นที่มีหนวดและลำตัวที่ยาว. พบในแม่น้ำและทะเลสาบทั่วโลก. มีความหลากหลายของชนิดและขนาด.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FCatfish%2F11-A_platycephalus2.jpg?alt=media&token=0f535f98-b3c4-40ae-a006-016c46c8dc66',
//     habitat:
//         'พบในน้ำจืดทั่วโลก, รวมถึงแม่น้ำ, ทะเลสาบ, และบ่อน้ำ. ชอบพื้นที่ที่มีพื้นโคลนและน้ำไหลช้า. สามารถอยู่รอดในสภาพแวดล้อมที่แตกต่างกัน.',
//     averageSize: 100.0,
//     averageWeight: 5.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Catfish', 'Catfish'],
//     diet:
//         'กินปลา, แมลง, และวัชพืช. ใช้หนวดในการค้นหาอาหารที่พื้นน้ำ. ปลานี้มีความสามารถในการปรับตัวให้เข้ากับอาหารที่มีอยู่.',
//     reproduction:
//         'วางไข่ในน้ำจืดในช่วงฤดูฝน. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในน้ำจืด. การดูแลไข่และลูกปลามักจะเป็นหน้าที่ของพ่อแม่.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 20 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับการเลี้ยงดูและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Haddock Fish',
//     scientificName: 'Melanogrammus aeglefinus',
//     description:
//         'ปลาทะเลที่มีลักษณะสีเทาและจุดดำที่ลำตัว. พบในมหาสมุทรแอตแลนติกและมีความนิยมในตลาดการประมง. มีรสชาติที่ดีและเป็นที่ต้องการในอาหารทะเล.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FHaddock%20Fish%2FAugust-Fish-Haddock-GraphicsFairy008-1024x526.jpg?alt=media&token=2c2bc1bc-f856-4389-8470-e6cf8ce81f41',
//     habitat:
//         'พบในมหาสมุทรแอตแลนติก, บริเวณที่มีพื้นทรายและโคลน. อาศัยอยู่ในพื้นที่ที่มีน้ำเย็นและมีความลึกปานกลาง. ชอบพื้นที่ที่มีความลึกถึง 200 เมตร.',
//     averageSize: 60.0,
//     averageWeight: 1.5,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Haddock Fish', 'Haddock'],
//     diet:
//         'กินปลา, กุ้ง, และแพลงก์ตอน. ใช้ปากในการจับเหยื่อที่เคลื่อนไหวในน้ำ. ปลานี้มีการเคลื่อนไหวเป็นกลุ่มเพื่อหาอาหาร.',
//     reproduction:
//         'วางไข่ในน้ำลึกของมหาสมุทรแอตแลนติก. ช่วงฤดูวางไข่คือฤดูใบไม้ผลิและฤดูร้อน. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในพื้นที่ทะเลลึก.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 20 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับความสามารถในการหาอาหารและสภาพแวดล้อม.',
//   ),
//   Fish(
//     name: 'Salmon',
//     scientificName: 'Salmo salar',
//     description:
//         'ปลาน้ำจืดและทะเลที่มีการเดินทางระยะไกลในการสืบพันธุ์. มีลำตัวที่แข็งแรงและเนื้อที่อุดมด้วยกรดไขมันโอเมก้า-3. เป็นที่นิยมในอาหารทะเลทั่วโลก.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FSalmon%2F4216fee40ec2d587c48240dd45891e80.jpg?alt=media&token=36400055-977f-4cba-8ba2-4d14db0e1844',
//     habitat:
//         'พบในน้ำจืดและทะเลของภูมิภาคเหนือ. อาศัยอยู่ในแม่น้ำที่ไหลเชี่ยวและทะเลที่มีความลึกปานกลาง. มักเดินทางระยะไกลเพื่อวางไข่ในน้ำจืด.',
//     averageSize: 80.0,
//     averageWeight: 4.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Salmon', 'Atlantic Salmon'],
//     diet:
//         'กินปลา, กุ้ง, และแพลงก์ตอน. ปลานี้มีการล่าสัตว์ในช่วงกลางวันและกลางคืน. ใช้ปากในการจับเหยื่อ.',
//     reproduction:
//         'วางไข่ในน้ำจืดที่มีการไหลเชี่ยว. ช่วงฤดูวางไข่คือฤดูใบไม้ร่วง. ไข่จะฟักออกเป็นตัวปลาเล็กๆ ที่โตขึ้นในน้ำจืด.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 10 ปี. การเจริญเติบโตที่รวดเร็วในช่วงปีแรก. ขึ้นอยู่กับสภาพแวดล้อมและการหาอาหาร.',
//   ),

//   Fish(
//     name: 'Tuna',
//     scientificName: 'Thunnus spp.',
//     description:
//         'ปลาที่มีขนาดใหญ่และเคลื่อนไหวได้รวดเร็ว. มีเนื้อที่แน่นและมีโปรตีนสูง, เป็นที่นิยมในการทำซูชิและซาชิมิ. พบในทะเลทั่วโลก.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FTuna%2F750x500-iStock-1334276621.jpg?alt=media&token=0b2ffab6-0ab6-4157-934b-47d068186b9a',
//     habitat:
//         'พบในทะเลเปิดและมหาสมุทรทั่วโลก. ชอบอาศัยอยู่ในน้ำที่มีความลึกตั้งแต่ 50 ถึง 500 เมตร. ชอบว่ายน้ำในบริเวณที่มีน้ำเย็นและกระแสน้ำอุ่น.',
//     averageSize: 200.0,
//     averageWeight: 250.0,
//     isEndangered: true,
//     conservationStatus: 'Vulnerable',
//     commonNames: ['Tuna', 'Bluefin Tuna'],
//     diet:
//         'กินปลาเล็ก, หมึก, และกุ้ง. เป็นนักล่าที่มีความเร็วสูงและมักจะล่าเหยื่อในกลุ่ม. ใช้ความเร็วในการล่าและหลบหนีศัตรู.',
//     reproduction:
//         'วางไข่ในน้ำที่มีอุณหภูมิอุ่น. ช่วงฤดูวางไข่คือฤดูร้อน. ตัวเมียสามารถวางไข่ได้หลายล้านฟองในแต่ละฤดู.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 40 ปี. เจริญเติบโตได้รวดเร็วในช่วงปีแรก. อายุขัยขึ้นอยู่กับสภาพแวดล้อมและการล่าเหยื่อ.',
//   ),
//   Fish(
//     name: 'Swordfish',
//     scientificName: 'Xiphias gladius',
//     description:
//         'ปลาที่มีขนาดใหญ่และมีจมูกยาวเป็นดาบ. เป็นนักล่าที่มีความเร็วสูง, และสามารถกระโดดขึ้นเหนือน้ำได้. เนื้อมีความแน่นและมีรสชาติที่ดี.',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/fishfinder-756b7.appspot.com/o/Fishes%2FSword%20Fish%2Fimages22.jpg?alt=media&token=ce45851b-6859-4ae4-8fd7-5e2734563ff9',
//     habitat:
//         'พบในมหาสมุทรเขตร้อนและเขตอบอุ่นทั่วโลก. ชอบอาศัยอยู่ในน้ำที่มีความลึกตั้งแต่ 200 ถึง 800 เมตร. ชอบว่ายน้ำในบริเวณที่มีน้ำอุ่น.',
//     averageSize: 300.0,
//     averageWeight: 450.0,
//     isEndangered: false,
//     conservationStatus: 'Least Concern',
//     commonNames: ['Swordfish', 'Broadbill'],
//     diet:
//         'กินปลาเล็กและหมึก. ใช้จมูกดาบในการล่าเหยื่อและป้องกันตัว. มักจะล่าเหยื่อในเวลากลางคืน.',
//     reproduction:
//         'วางไข่ในน้ำที่มีอุณหภูมิอุ่น. ช่วงฤดูวางไข่คือฤดูร้อน. ตัวเมียสามารถวางไข่ได้หลายล้านฟองในแต่ละฤดู.',
//     lifespan:
//         'อายุขัยสูงสุดประมาณ 9 ปี. เติบโตได้เร็วในช่วงปีแรก. อายุขัยขึ้นอยู่กับสภาพแวดล้อมและการล่าเหยื่อ.',
//   ),
// ];

// //add dummydata to the firestore
// Future<void> addFish(Fish fish) async {
//   final firestore = FirebaseFirestore.instance;
//   // await firestore.collection('fishes').doc(fish.id).set(fish.toMap());
//   await firestore.collection('fishes').add(fish.toMap());
// }

// Future<void> addDummyFishes() async {
//   for (var fish in dummyFishData) {
//     await addFish(fish);
//   }
// }
