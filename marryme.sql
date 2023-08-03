create database if not exists marryme;
use marryme;


CREATE TABLE member (
  `member_id` varchar(50) not null comment '會員_ID (信箱)' ,
  `member_name` varchar(50) not null comment '姓名',
  `member_phone` varchar(20) not null comment '手機',
  `member_email` varchar(50) not null comment '信箱',
  `member_password` varchar(50) not null comment '密碼',
  `member_address` varchar(50) not null comment '地址',
  `member_gender` int not null comment '性別(0:男; 1:女)',
  `member_registration_time` date not null comment '註冊時間',
  `member_last_login_time` date not null comment '最後登入時間',
  `member_registration_ip` varchar(50) null comment '註冊IP',
  `member_login_ip` varchar(50) null comment '最後登入IP',
  `verification_status` int null comment '驗證狀態(0:未驗證, 1:驗證成功,2:驗證失敗)',
  PRIMARY KEY (member_id))
  comment '會員資料表';
  
  
  CREATE TABLE vendor (
  `vendor_id` varchar(50) not null comment '廠商_ID (信箱)',
  `vendor_phone` varchar(20) not null comment '姓名',
  `vendor_email` varchar(50)  not null comment '信箱',
  `vendor_name` varchar(50) not null comment '品牌名稱',
  `vendor_location` varchar(50) not null comment '服務地區',
  `vendor_address` varchar(50) not null comment '地址',
  `vendor_password` varchar(50) not null comment '密碼',
  `vendor_website` text null comment '官方網站',
  `vendor_fb` varchar(50) null comment 'facebook',
  `vendor_ig` varchar(50) null comment 'IG',
  `company_id` varchar(50) null comment '統一編號',
  `contact_person` varchar(50) not null comment '聯絡人',
  `vendor_registration_time` date not null comment '註冊日期',
  `vendor_status` int not null comment '處理狀態(0:未處理; 1:審核中;2:審核通過)',
  `basic_introduction` varchar(500) not null comment '基本介紹',
  `googlemap` text not null comment 'google地圖',
  `manufacturer_category` int not null comment '廠商類別(0:商品 , 1:服務)',
  PRIMARY KEY (vendor_id))
  comment '廠商資料表';
  
INSERT INTO member (member_id, member_name, member_phone, member_email, member_password, member_address, member_gender, member_registration_time, member_last_login_time, verification_status)  
VALUES ('member1@gmail.com'  ,'林小一', '0910763485', 'member1@gmail.com', 'xtr1234', '新北市三重區忠孝路三段47號5樓', 1, STR_TO_DATE('2002-11-17','%Y-%m-%d'), STR_TO_DATE('2005-03-21','%Y-%m-%d'), 0),
       ('member2@gmail.com'  ,'蔡雄大', '0911904530', 'member2@gmail.com', 'yue5432', '台北市南港區三重路41巷15號8樓', 1, STR_TO_DATE('2021-06-30','%Y-%m-%d'), STR_TO_DATE('2022-07-21','%Y-%m-%d'), 1),
       ('member3@gmail.com'  ,'金城武', '0912659093', 'member3@gmail.com', 'uoi5832', '基隆市七堵區明德一路2巷3弄18號1樓', 0, STR_TO_DATE('2014-04-15','%Y-%m-%d'), STR_TO_DATE('2016-01-31','%Y-%m-%d'), 2),
       ('member4@gmail.com'  ,'黃小雞', '0913859034', 'member4@gmail.com', 'die6534', '台南市永康區大同街413巷17號2樓', 1, STR_TO_DATE('2016-12-09','%Y-%m-%d'), STR_TO_DATE('2017-05-17','%Y-%m-%d'), 0),
	   ('member5@gmail.com'  ,'劉小六', '0914980537', 'member5@gmail.com', 'ile4326', '高雄市三民區立忠路95巷310號12樓', 1, STR_TO_DATE('2015-03-15','%Y-%m-%d'), STR_TO_DATE('2016-08-04','%Y-%m-%d'), 1),
	   ('member6@gmail.com'  ,'李永哲', '0915764983', 'member6@gmail.com', 'jid7693', '彰化縣彰化市中華西路283巷67弄4樓', 0, STR_TO_DATE('2018-05-19','%Y-%m-%d'), STR_TO_DATE('2019-08-13','%Y-%m-%d'), 2),
       ('member7@gmail.com'  ,'廖小二', '0916983875', 'member7@gmail.com', 'iem9853', '台中市中區中山路143巷310號3樓', 1, STR_TO_DATE('2020-01-14','%Y-%m-%d'), STR_TO_DATE('2020-12-12','%Y-%m-%d'), 0),
       ('member8@gmail.com'  ,'白小黑', '0917490560', 'member8@gmail.com', 'ioe7823', '新竹市北區中正路626巷280號9樓', 1, STR_TO_DATE('2005-08-16','%Y-%m-%d'), STR_TO_DATE('2006-11-11','%Y-%m-%d'), 0),
       ('member9@gmail.com'  ,'羅大偉', '0918654321', 'member9@gmail.com', 'oeu9854', '桃園市八德區介壽路二段490巷78號6樓', 0, STR_TO_DATE('2007-02-18','%Y-%m-%d'), STR_TO_DATE('2008-03-31','%Y-%m-%d'), 1),
       ('member10@gmail.com' ,'呂小王', '0919938403', 'member10@gmail.com', 'yti2387', '花蓮縣吉安鄉建國路一段162號1樓', 1, STR_TO_DATE('2008-07-04','%Y-%m-%d'), STR_TO_DATE('2010-04-19','%Y-%m-%d'), 1);
       
       
INSERT INTO vendor(vendor_id, vendor_phone, vendor_email, vendor_name, vendor_location, vendor_address, vendor_password, vendor_website, company_id, contact_person, vendor_registration_time, vendor_status, basic_introduction, googlemap, manufacturer_category)
VALUES('vendor1@gmail.com', '02-7728-3610 轉 8293', 'vendor1@gmail.com', '新莊典華', '新北市', '新北市新莊區中央路469號', 'feide7830', 'https://www.denwell.com/', '89735473', '蔡曉明', '2001-12-01', 1, '「新莊典華」為新北最大宴會場地，共有14個主題宴會廳，4座觀禮儀式堂。全層無柱、挑高的場地設計，可容納1~100桌的大小宴會。宴會廳內附有典華著名的專利設備，升降星光大道、幸福纜車、鉛錘及婚禮互動機，增加出場驚喜感及特別性。', 'https://www.google.com/maps/place/242%E5%8F%B0%E7%81%A3%E6%96%B0%E5%8C%97%E5%B8%82%E6%96%B0%E8%8E%8A%E5%8D%80%E4%B8%AD%E5%A4%AE%E8%B7%AF469%E8%99%9F/@25.057072,121.446779,16z/data=!4m6!3m5!1s0x3442a881c7e33d81:0xb2a91fef75d529a4!8m2!3d25.0570717!4d121.4467785!16s%2Fg%2F11bw43rssm?hl=zh-TW&entry=ttu', 1),
	  ('vendor2@gmail.com', '02-7728-3610 轉 7215', 'vendor2@gmail.com', '煙波大飯店-新竹湖濱館', '新竹市', '新竹市東區新竹市明湖路773號', 'ielel9384', 'https://hsinchu.lakeshore.com.tw/latest-news/wedding-special/', '82894654', '王小黑', '2001-12-01', 1, '煙波婚宴企劃團隊，以專業規劃、貼心服務，與您攜手打造理想中的夢幻婚宴。除歐風典雅宴會場地及精緻菜式，更結合飯店優勢，打造專屬戶外證婚場地、新娘、親友住房等周邊完整服務，陽光灑落，大片綠意隨之映出光芒，為新人獻上最閃亮的祝福。', 'https://www.google.com/maps/place/300%E5%8F%B0%E7%81%A3%E6%96%B0%E7%AB%B9%E5%B8%82%E6%9D%B1%E5%8D%80%E6%98%8E%E6%B9%96%E8%B7%AF773%E8%99%9F/@24.776136,120.968496,16z/data=!4m6!3m5!1s0x34684a0c742c1037:0x4ec26e42a41a771e!8m2!3d24.7761358!4d120.9684962!16s%2Fg%2F11h9f1ww2_?hl=zh-TW&entry=ttu', 1),
	  ('vendor3@gmail.com', '02-7728-3610 轉 4006', 'vendor3@gmail.com', '雅悅會館台南館', '台南市', '台南市東區台南市東區中華東路一段366號5樓(南紡夢時代)', 'joiwn8993', 'https://www.glb.com.tw/', '83495763', '李小白', '2012-03-12', 1, '給您六個非選「雅悅會館 台南館」的原因:✔奢華宴會廳_打造頂級獨立宴會廳、挑高大空間 寬敞舒適還有專屬新娘的高級休息室，享受成為公主的一天!!!✔大台南唯一空中花園證婚_夢幻婚禮，一起留下最美好的回憶時刻✔頂級設備_高級聲光音響設備，LED對開巨幕、KPOP互動舞台編織出最精采的難忘婚宴!!!✔最強婚企團隊_專屬婚企團隊精心幫您規劃婚禮流程，處理婚宴大小事讓您什麼都不擔心，舉辦婚禮好簡單!!!✔主題風格佈置_主題拍照區、專屬拍照背板、禮桌佈置，讓您拍照好美麗!!!✔經典料理_非傳統又美味的五星等級料理讓與會人員都能吃的開心、吃的放心!!!', 'https://www.google.com/maps/place/%E5%8D%97%E7%B4%A1%E8%B3%BC%E7%89%A9%E4%B8%AD%E5%BF%83/@22.990786,120.232703,16z/data=!4m6!3m5!1s0x346e76bea4df0e25:0xe307d34670241186!8m2!3d22.990786!4d120.232703!16s%2Fg%2F155pwlwm?hl=zh-TW&entry=ttu', 1),
	  ('vendor4@gmail.com', '02-7728-3610 轉 9662', 'vendor4@gmail.com', '新天地崇德旗艦店', '台中市', '台中市北屯區崇德五路345號', 'eisid3892', 'https://www.newpalace.com.tw/branch/shungtak', '84904654', '廖筱琦', '2015-03-01', 0, '新天地《崇德旗艦店》高達6200坪營業面積，為中台灣最大的婚宴會館之一，外觀有如中世紀壯闊浪漫的城堡聖殿，從華麗水晶燈、歐式蝴蝶展梯到適合各類大小型婚宴、工商聚餐的宴會廳、西式或日式證婚儀式堂，千萬等級的高規裝潢與精湛廚藝佳餚，深受在地好評，也是文定喜宴辦桌聚餐的高人氣首選。一樓樂食自助百匯每日提供的上百道中式、法式、日式各國海陸佳餚，新鮮美味一次品嚐；各樓層設置的豪華貴賓室、獨立包廂、大小型宴會廳，無論是舉辦婚禮喜宴、餐會酒會、國際會議 或朋友相聚、工商聯 誼、家庭聚餐、生日宴會等…，應有盡有，一應具全。', 'https://www.google.com/maps?ll=24.178927,120.684326&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=406%E5%8F%B0%E4%B8%AD%E5%B8%82%E5%8C%97%E5%B1%AF%E5%8D%80%E5%B4%87%E5%BE%B7%E4%BA%94%E8%B7%AF345%E8%99%9F', 1),
	  ('vendor5@gmail.com', '02-7728-3610 轉 4547', 'vendor5@gmail.com', '青青格麗絲莊園', '桃園市', '桃園市蘆竹區南崁路46號', 'oeedw8392', 'https://www.grace-wed.com/', '87894654', '游小孟', '2011-09-19', 1, '青青格麗絲莊園，完美打造大桃園另一股歐式戶外婚禮的潮流。已經準備攜手踏上紅毯的佳偶們，可把握時機，讓心中的美夢成真。維持青青婚宴文創集團DNA，完美戶外婚禮三部曲，包括：(一)溫馨歡樂的迎賓茶會、(二)神聖浪漫的觀禮儀式、(三)創意主題婚宴。', 'https://www.google.com/maps?ll=25.044959,121.296629&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=338%E6%A1%83%E5%9C%92%E5%B8%82%E8%98%86%E7%AB%B9%E5%8D%80%E5%8D%97%E5%B4%81%E8%B7%AF46%E8%99%9F', 1),
	  ('vendor6@gmail.com', '02-7728-3610 轉 11270', 'vendor6@gmail.com', '寶華珠寶', '台南市', '台南市南區金華路一段507號', 'aieoe9384', null, '86898354', '羅小曼', '2019-10-12', 2, '寶華珠寶已在台南深耕23年，老闆是擁有40年資歷的金工師傅，因此對於珠寶工藝非常講究。目前二代開始接手，並考取GIA(美國寶石研究院)證照，除了戒台的工藝對於寶石的篩選更是嚴格，平價也能擁有精品級的珠寶。', 'https://www.google.com/maps/place/702%E5%8F%B0%E7%81%A3%E5%8F%B0%E5%8D%97%E5%B8%82%E5%8D%97%E5%8D%80%E9%87%91%E8%8F%AF%E8%B7%AF%E4%B8%80%E6%AE%B5507%E8%99%9F/@22.97457,120.1907,16z/data=!4m6!3m5!1s0x346e75da5553c4ab:0xeecb5cc695fa9aa2!8m2!3d22.97457!4d120.1907!16s%2Fg%2F11c20xlfvh?hl=zh-TW&entry=ttu', 0),
	  ('vendor7@gmail.com', '02-7728-3610 轉 9731', 'vendor7@gmail.com', 'DAYOU 大祐珠寶 GIA 鑽石婚戒', '桃園市', '桃園市蘆竹區南崁路一段110號1樓', 'qieop3829', 'http://www.dayou.tw/', '85388894', '劉孟學', '2010-04-18', 1, '大祐珠寶在鑽石產業，由1986年開始至今已逾30年，是繼鑽石批發產業之後，首度整合婚戒、貴重珠寶，提供消費者完善以及多樣化的產品服務。每顆鑽石都經過專家精挑細選。', 'https://www.google.com/maps?ll=25.052032,121.287905&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=1+338%E6%A1%83%E5%9C%92%E5%B8%82%E8%98%86%E7%AB%B9%E5%8D%80%E5%8D%97%E5%B4%81%E8%B7%AF%E4%B8%80%E6%AE%B5110%E8%99%9F', 0),
	  ('vendor8@gmail.com', '02-7728-3610 轉 9384', 'vendor8@gmail.com', 'AMOUREUX純愛甜心', '台中市', '台中市西區西區五權西三街7號', 'kmiei9839', 'https://www.amoureux.com.tw/', '87632894', '洪小語', '1993-03-15', 1, 'AMOUREUX希望能將濃情蜜意的愛，款待給每一位放在您心頭上的人而AMOUREUX 相信每個人都值得擁有幸福，便以能滿足新人、長輩和親友的美味甜點為使命，要在每個重要的日子裡，為您悉心款待每一位放在心頭上的家人與夥伴。', 'https://www.google.com/maps?ll=24.139727,120.663216&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=403%E5%8F%B0%E4%B8%AD%E5%B8%82%E8%A5%BF%E5%8D%80%E4%BA%94%E6%AC%8A%E8%A5%BF%E4%B8%89%E8%A1%977%E8%99%9F', 0),
	  ('vendor9@gmail.com', '02-7728-3610 轉 11244', 'vendor9@gmail.com', '舊振南餅店', '高雄市', '高雄市大寮區捷西路298號', 'uelme8304', 'https://www.jzn.com.tw/tw/index', '88356494', '吳智湧', '2004-06-28', 1, '舊振南餅店創立於1890年，傳承百年手工製餅技藝，將漢餅的精神價值，演繹在送禮哲學上，讓每一份舊振南禮品，都能觸動送禮者與收禮者的內心。舊振南，將台灣味道與在地特色推廣到世界各地。', 'https://www.google.com/maps?ll=22.622309,120.389496&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=831%E9%AB%98%E9%9B%84%E5%B8%82%E5%A4%A7%E5%AF%AE%E5%8D%80%E6%8D%B7%E8%A5%BF%E8%B7%AF298%E8%99%9F', 0),
	  ('vendor10@gmail.com', '02-7728-3610 轉 11188', 'vendor10@gmail.com', '一之鄉', '台北市', '台北市北投區北投路一段7號', 'rjele0394', 'https://www.173cake.com/', '89829394', '張無絃', '2019-08-18', 1, '一之鄉創立於台灣，許多生活在台灣的人，一生中美好的記憶總是有著一之鄉蜂蜜蛋糕的香甜滋味不論是迎接新生命的喜悅、走入兩人的新生活、或是為情誼增溫的貼心問候，這滋味總是溫柔的存在這些幸福時刻，每一口單純美好的氣息總叫人難以忘懷！', 'https://www.google.com/maps?ll=25.121736,121.501814&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=112%E5%8F%B0%E5%8C%97%E5%B8%82%E5%8C%97%E6%8A%95%E5%8D%80%E5%8C%97%E6%8A%95%E8%B7%AF%E4%B8%80%E6%AE%B57%E8%99%9F', 0);
          
          
          
set auto_increment_offset=1;
set auto_increment_increment=1;
CREATE TABLE emp (
  `emp_id` int auto_increment not null comment '員工_ID',
  `emp_name` varchar(50) not null comment '員工姓名',
  `hiredate` date not null comment '入職時間',
  `emp_gender` int not null comment '性別(0:男 , 1:女)',
  `birthday` date not null comment '生日',
  `emp_email` varchar(50) not null comment '信箱',
  `emp_phone` varchar(10) not null comment '手機 ',
  `emp_address` varchar(50) not null comment '地址 ',
  `emp_password` varchar(50) not null comment '密碼',
  `emp_status` int not null comment '員工狀態(0:已離職; 1:在職中)',
  PRIMARY KEY (emp_id) comment '員工資料表')AUTO_INCREMENT = 1;
  
INSERT INTO emp(emp_name, hiredate, emp_gender, birthday, emp_email, emp_phone, emp_password, emp_address, emp_status)
VALUES('蜘蛛人', '2000-12-29', 0, '1998-09-12', 'emp1@gmail.com', '0930843864', 'tuie8730', '台北市松山區三民路95巷47號5樓', 1),
	  ('鋼鐵人', '2001-11-05', 0, '1945-03-09', 'emp2@gmail.com', '0931864543', 'jile8090', '新北市汐止區民族六街7巷54號3樓', 1),
      ('閃電俠', '2002-10-17', 0, '1965-08-18', 'emp3@gmail.com', '0932844534', 'ieke9038', '新北市蘆洲區民權路121巷71號1樓', 1),
      ('美國隊長', '2003-09-03', 0, '1993-11-19', 'emp4@gmail.com', '0933856324', 'okem3794', '新北市新莊區建福路59巷130號4樓', 1),
      ('黑寡婦', '2004-08-12', 1, '1978-04-03', 'emp5@gmail.com', '0934445346', 'mome7483', '台北市內湖區內湖路一段629巷90號6樓', 1),
      ('小辣椒', '2005-07-06', 1, '1943-12-01', 'emp6@gmail.com', '0935980344', 'lier6483', '新北市三重區自強路四段31巷38號7樓', 1),
      ('綠浩克', '2006-06-23', 0, '1967-01-15', 'emp7@gmail.com', '0936980454', 'owen0954', '新北市板橋區重慶路139巷198號2樓', 1),
      ('黑豹', '2007-05-19', 0, '1984-02-17', 'emp8@gmail.com', '0937395093', 'wone6739', '台北市松山區民生東路五段69巷4弄10號3樓', 0),
      ('雷神索爾', '2008-04-30', 0, '1999-05-29', 'emp9@gmail.com', '0938870248', 'vene7793', '台北市內湖區環山路三段30巷181號1樓', 1),
      ('X戰警', '2009-03-14', 0, '1941-06-25', 'emp10@gmail.com', '0939902769', 'rtyn8930', '台北市南港區東明街1巷210號12樓', 0);
      

set auto_increment_offset=1;
set auto_increment_increment=1;

CREATE TABLE redis (
  `redis_ID` int auto_increment not null comment '聊天編號_ID',
  `member_id` varchar(50) not null comment '會員_ID FK',
  `vendor_id` varchar(50) not null comment '廠商_ID FK',
  `time` timestamp not null comment '發送時間',
  `message` varchar(200) not null comment '訊息內容',
  CONSTRAINT redis_member_id_FK FOREIGN KEY (member_id) REFERENCES member (member_id),
  CONSTRAINT redis_vendor_id_FK FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id),
  PRIMARY KEY (redis_ID) comment '1對1 聊聊') AUTO_INCREMENT = 1;   


INSERT INTO redis(member_id, vendor_id, time, message)
VALUES('member1@gmail.com', 'vendor1@gmail.com', '2023-08-01 10:00:00', '請問xxx訂單出貨了嗎?我想取消  好的,這邊幫你取消'),
 	  ('member2@gmail.com', 'vendor2@gmail.com', '2023-08-01 11:00:00', '你們婚宴場地可以帶狗參加嗎?  可以,我們目前還有配合狗狗的服裝,可以參考'),
	  ('member3@gmail.com', 'vendor3@gmail.com', '2023-08-01 12:00:00', '請問xxx訂單出貨了嗎?我想要再加購  你好,目前還未出貨,可以直接加購幫你併單'),
	  ('member4@gmail.com', 'vendor4@gmail.com', '2023-08-01 13:00:00', '請問我們有跟場地做大活動,遊覽車的部分,可以有什麼優惠嗎?  你好,目前我們只有針對季節做活動,遊覽車目前沒有配合'),
      ('member5@gmail.com', 'vendor5@gmail.com', '2023-08-01 14:00:00', '請問可以幫我確認你們有配合某某主持人嗎?我想找她做我的婚宴主持人  你好,有的,還有需要什麼服務嗎?'),
      ('member6@gmail.com', 'vendor6@gmail.com', '2023-08-01 15:00:00', '你好,我們是某某婚宴場地,我們有收到您的2023/10/31的預約訂單,但是,我們那天場地還有做其他活動,可否改其它天,我給你8折優惠  那我在看看,後面回覆你'),
      ('member7@gmail.com', 'vendor7@gmail.com', '2023-08-01 16:00:00', '你好,可以幫我取消2023/11/11的場地預約嗎?我們討論想改期   你好,我們這邊幫你做調整,你在將調整時間跟我們說即可'),
	  ('member8@gmail.com', 'vendor8@gmail.com', '2023-08-01 17:00:00', '請問你們婚宴場地跟商品都用你們家的,可以有優惠嗎?  你好,如果都使用我們家的,可以給你打7折'),
      ('member9@gmail.com', 'vendor9@gmail.com', '2023-08-01 18:00:00', '請問你們除了網站上的場地照片,還有其他的場地照片可以參考嗎?  你好,目前就網站上的照片,還是您方便約什麼時候來看場地?隨時歡迎'),
      ('member10@gmail.com', 'vendor10@gmail.com', '2023-08-01 19:00:00','你好,我看你們10月的預約都滿了,是否有其他時段有人取消嗎?目前就安排在10月舉辦  你好,目前還未有客戶取消,如果有客戶近期取消在幫你留意並通知你');
      

-- 建立商品類別表
CREATE TABLE product_category (
	product_category_id INT NOT NULL AUTO_INCREMENT COMMENT '商品類別_ID' PRIMARY KEY,
	product_category_name VARCHAR(50) NOT NULL COMMENT '商品類別名稱'
) COMMENT '商品類別表';

INSERT INTO product_category (product_category_name)
VALUES ('婚戒'),
	   ('喜餅'),
	   ('婚禮小物'),
       ('婚紗/禮服'),
       ('高跟鞋/西裝鞋');
       

-- 建立商品資料表
CREATE TABLE product (
	product_id INT NOT NULL AUTO_INCREMENT COMMENT '商品_ID' PRIMARY KEY,
	vendor_id VARCHAR(50) NOT NULL COMMENT '廠商_ID(信箱)',
	product_category_id INT NOT NULL COMMENT'商品類別_ID',
    product_name VARCHAR(50) NOT NULL COMMENT '商品名稱',
    image LONGBLOB COMMENT '圖片',
    original_price INT COMMENT '自售價' CHECK (original_price > 0),
	platform_price INT NOT NULL COMMENT '平台售價' CHECK (platform_price > 0),
    stock_quantity INT NOT NULL COMMENT '庫存量',
    product_description VARCHAR(500) COMMENT '商品描述',
    created_time TIMESTAMP NOT NULL COMMENT '商品新增時間' DEFAULT CURRENT_TIMESTAMP,
    product_status TINYINT NOT NULL DEFAULT 0 COMMENT '商品狀態(0未上架, 1上架中, 2已售完, 3已下架)',
	CONSTRAINT fk_product_vendor_id FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id),
    CONSTRAINT fk_product_product_category_id FOREIGN KEY (product_category_id) REFERENCES product_category (product_category_id)
) COMMENT '商品資料表';


INSERT INTO product (vendor_id, product_category_id, product_name, image, original_price, platform_price, stock_quantity, product_description, created_time, product_status)
VALUES ('vendor6@gmail.com', 1, '婚戒1', NULL, 5000, 4000, 50, NULL, NOW(), 1),
	   ('vendor7@gmail.com', 2, '喜餅1', NULL, 3000, 1500, 100, NULL, NOW(), 1),
	   ('vendor8@gmail.com', 3, '婚禮小物1', NULL, 1000, 800, 30, NULL, NOW(), 0),
	   ('vendor9@gmail.com', 4, '婚紗/禮服1', NULL, 8000, 7000, 20, NULL, NOW(), 1),
	   ('vendor10@gmail.com', 5, '高跟鞋/西裝鞋1', NULL, 3000, 2500, 40, NULL, NOW(), 1),
	   ('vendor6@gmail.com', 2, '喜餅2', NULL, 1800, 1600, 80, '超好吃的喜餅喔', NOW(), 1),
	   ('vendor7@gmail.com', 3, '婚禮小物2', NULL, 900, 700, 15, '可愛的婚禮巧克力', NOW(), 0),
	   ('vendor8@gmail.com', 4, '婚紗/禮服2', NULL, 7500, 6000, 25, '新娘穿上會超美', NOW(), 1),
	   ('vendor9@gmail.com', 5, '高跟鞋/西裝鞋2', NULL, 2800, 2200, 60, '超美的高跟鞋', NOW(), 1),
	   ('vendor10@gmail.com', 1, '婚戒2', NULL, 4800, 4200, 35, '超讚的婚戒', NOW(), 1);



-- 建立檢舉資料表
CREATE TABLE report (
	report_id INT NOT NULL AUTO_INCREMENT COMMENT '檢舉_ID' PRIMARY KEY,
	member_id VARCHAR(50) NOT NULL COMMENT '會員_ID(信箱)',
	product_id INT NOT NULL COMMENT'商品_ID',
    report_content VARCHAR(200) NOT NULL COMMENT '檢舉內容',
    emp_id INT,
    review_status TINYINT NOT NULL DEFAULT 0 COMMENT '檢舉狀態(0-未審核, 1-審核中, 2-已成立(檢舉成功), 3-已取消, 4-不成立(檢舉失敗))',
	CONSTRAINT fk_report_member_id FOREIGN KEY (member_id) REFERENCES member (member_id),
    CONSTRAINT fk_report_product_id FOREIGN KEY (product_id) REFERENCES product (product_id),
    CONSTRAINT fk_report_emp_id FOREIGN KEY (emp_id) REFERENCES emp (emp_id)
) COMMENT '檢舉資料表';

INSERT INTO report (member_id, product_id, report_content, emp_id, review_status) 
VALUES ('member1@gmail.com', 1, '這個商品質量差，有瑕疵', NULL, 1),
	   ('member2@gmail.com', 3, '廣告中所示商品與實際不符', NULL, 0),
       ('member3@gmail.com', 2, '該商品沒有提供售後服務', NULL, 2),
       ('member4@gmail.com', 5, '收到的商品破損了', NULL, 1),
       ('member5@gmail.com', 4, '該商品被宣傳得太好，實際不值得購買', NULL, 0),
       ('member6@gmail.com', 1, '未收到訂單中的某件商品', NULL, 1),
       ('member7@gmail.com', 2, '該商品尺寸不符合描述', NULL, 2),
       ('member8@gmail.com', 3, '商品配送時間延遲', NULL, 1),
       ('member9@gmail.com', 4, '收到的商品與圖片中不同顏色', NULL, 0),
       ('member10@gmail.com', 5, '該商品質量堪憂', NULL, 2);
       
       
       
CREATE TABLE online_report (
  `online_report_serial_number` int auto_increment not null comment '線上問題回報_ID',
  `member_id` varchar(50) null comment '會員_ID FK',
  `vendor_id` varchar(50) null comment '廠商_ID FK',
  `emp_id` int null comment'員工_ID FK',
  `email` varchar(50) not null comment'信箱',
  `qna` varchar(200) not null comment '問題或建議',
   CONSTRAINT online_report_member_id_FK FOREIGN KEY (member_id) REFERENCES member (member_id),
   CONSTRAINT online_report_vendor_id_FK FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id),
  PRIMARY KEY (online_report_serial_number) comment '線上問題回報')AUTO_INCREMENT = 1;


INSERT INTO online_report (member_id, vendor_id, emp_id, email, qna)
VALUES
    ('member1@gmail.com', null, 1, 'member1@gmail.com', '想了解關於結婚的流程推薦'),
    (null, 'vendor1@gmail.com', 2, 'vendor1@gmail.com', '除了論壇,還有哪裏可以分享?'),
    (null, 'vendor2@gmail.com', null, 'vendor2@gmail.com', '有遇到客戶態度不佳,可否提供檢舉客戶?'),
    ('member2@gmail.com', null, null, 'member2@gmail.com', '想知道訂單紀錄,是否可以看到貨運狀態?'),
    (null, 'vendor3@gmail.com', 3, 'vendor3@gmail.com', '我想提供給優惠碼給客戶,請問是在哪裡辦理?'),
    ('member7@gmail.com', null, 4, 'member7@gmail.com', '請問你們最推薦的婚宴場地,可以容納多少人?'),
    (null, 'vendor4@gmail.com', null, 'vendor4@gmail.com', '請問會舉辦優質廠商比賽嗎?'),
    ('member10@gmail.com', null, null, 'member10@gmail.com', '請問有哪個場地是可以配合帶寵物的嗎?'),
    (null, 'vendor8@gmail.com', 5, 'vendor8@gmail.com', '廠商跟廠商之間想配合合作,你們有這方面的方案嗎?'),
    ('member5@gmail.com', null, 6, 'member5@gmail.com', '每個場地都會配合遊覽車地點接送嗎?');
    


set auto_increment_offset=1;
set auto_increment_increment=1;

CREATE TABLE notification (
  `notification_id` int auto_increment not null comment '通知訊息_ID',
  `member_id` varchar(50) null comment '會員_ID FK' ,
  `recipient` int null comment '通知對象(0:廠商 , 1:會員)',
  `notification_content` longtext not null comment '通知內容',
  `notification_time` timestamp  not null comment '通知時間',
  `reception_status` int null comment '接收狀態(0:未讀 , 1:已讀)',
  `phone` varchar(10) null comment '手機',
  `email` varchar(50) not null comment '信箱',
  `vendor_id` varchar(50) null comment '廠商_ID FK',
  CONSTRAINT notification_member_id_FK FOREIGN KEY (member_id) REFERENCES member (member_id),
  CONSTRAINT notification_vendor_id_FK FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id),
  PRIMARY KEY (notification_id) comment '通知訊息')AUTO_INCREMENT = 1;
  
  
INSERT INTO notification (member_id, recipient, notification_content, notification_time, reception_status, phone, email, vendor_id)
VALUES
    (null, 0, '您有一筆出貨訂單請確認並出貨', '2023-07-01 10:00:00', 0, null, 'vendor6@gmail.com', 'vendor6@gmail.com'),
    ('member1@gmail.com', 1, '您的訂單已出貨', '2023-07-01 11:00:00', 1, null, 'member1@gmail.com', null),
    ('member2@gmail.com', 1, '您的優惠卷在三個月就要過期了', '2023-07-01 12:00:00', 0, null, 'member2@gmail.com', null),
    (null, 0, '有客戶預約2024/03/21的某某婚宴場地', '2023-07-01 13:00:00', 1, null, 'vendor1@gmail.com', 'vendor1@gmail.com'),
    ('member4@gmail.com', 1, '全館目前優惠碼輸入HP100,折扣1000元', '2023-07-01 14:00:00', 0, null, 'member4@gmail.com', null),
    (null, 0, '提醒您有一筆客戶預約的2023/09/20某某婚宴場地', '2023-07-01 15:00:00', 1, null, 'vendor2@gmail.com', 'vendor2@gmail.com'),
    (null, 1, '將在2023/12/16舉辦優質廠商活動,請在2023/08/31前報名', '2023-07-01 16:00:00', 0, null, 'vendor3@gmail.com', 'vendor3@gmail.com'),
    ('member8@gmail.com', 1, '某某婚宴場地於9月預約全面8折', '2023-07-01 17:00:00', 1, null, 'member8@gmail.com', null),
    (null, 0, '您有一則客戶的聊聊通知', '2023-07-01 18:00:00', 0, null, 'vendor9@gmail.com', 'vendor9@gmail.com'),
    ('member7@gmail.com', 1, '在2023/10月買婚禮小物,滿300免運費', '2023-07-01 19:00:00', 1, null, 'member7@gmail.com', null);
    


-- 建立優惠活動表
CREATE TABLE activity (
	discount_code VARCHAR(10) NOT NULL COMMENT '優惠代碼' PRIMARY KEY,
	vendor_id VARCHAR(50) COMMENT '廠商_ID(信箱)',
	activity_name VARCHAR(50) NOT NULL COMMENT '活動名稱',
    discount DECIMAL(8, 2) NOT NULL COMMENT '折扣',
    activity_start_time TIMESTAMP NOT NULL COMMENT '活動開始時間',
    activity_end_time TIMESTAMP NOT NULL COMMENT '活動結束時間',
	activity_detail VARCHAR(100) COMMENT '活動內容',
	`status` int not null default 1 comment '0下架, 1上架',
    edit_status int not null default 0 comment '0可修改, 1不可修改',
    CONSTRAINT fk_activity_vendor_id FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id)
) COMMENT '優惠活動表';


INSERT INTO activity (discount_code, vendor_id, activity_name, discount, activity_start_time, activity_end_time, activity_detail, `status`, edit_status)
VALUES 
    ('CODE001', NULL, '夏日優惠', -1000, '2023-07-01 10:00:00', '2023-07-07 23:59:59', '享受1000元折扣。', 1, 0),
    ('CODE002', NULL, '限時特賣', -850, '2023-07-02 09:00:00', '2023-07-02 12:00:00', '3小時限定特價：只要滿850元就可折850元。', 1, 0),
    ('CODE003', NULL, '婚禮特惠', -300, '2023-07-08 18:00:00', '2023-07-10 23:59:59', '結婚相關商品獨家優惠。', 1, 0),
    ('CODE004', NULL, '清倉大拍賣', -50, '2023-07-05 12:00:00', '2023-07-15 23:59:59', '大量商品低至半價，為您的特殊日子提供優惠。', 1, 0),
    ('CODE005', NULL, '節慶促銷', -25, '2023-07-20 08:00:00', '2023-07-25 23:59:59', '慶祝節日，結婚必備品通通折25元。', 1, 0),
    ('CODE006', 'vendor6@gmail.com', '婚禮必備品特賣', 0.2, '2023-07-10 09:00:00', '2023-07-15 23:59:59', '婚禮必備品全線八折優惠。', 1, 0),
    ('CODE007', 'vendor7@gmail.com', '新娘美妝特惠', 0.25, '2023-07-12 10:00:00', '2023-07-18 23:59:59', '讓您在重要的一天展現最佳狀態！新娘美妝產品享受25%折扣。', 1, 0),
    ('CODE008', 'vendor8@gmail.com', '婚禮佈置清倉', 0.4, '2023-07-20 12:00:00', '2023-07-25 23:59:59', '打造完美氛圍，婚禮佈置產品清倉大拍賣，享受40%優惠。', 1, 0),
    ('CODE009', 'vendor9@gmail.com', '婚禮服飾特賣', 0.1, '2023-07-15 09:00:00', '2023-07-20 23:59:59', '婚禮完美服飾享受10%優惠。', 1, 0),
    ('CODE010', 'vendor10@gmail.com', '喜餅優惠', 0.15, '2023-07-25 10:00:00', '2023-07-31 23:59:59', '獨家美味喜餅享受15%優惠。', 1, 0);
       
       

CREATE TABLE `reservation` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT COMMENT '賞廳編號',
  `vendor_id` VARCHAR(50) NOT NULL COMMENT '場商_id 信箱 FK',
  `member_id` VARCHAR(50) NOT NULL COMMENT '會員_id 信箱 FK',
  `contact_name` VARCHAR(200) NOT NULL COMMENT '姓名',
  `contact_number` VARCHAR(10) NOT NULL COMMENT '聯絡電話',
  `event_date` TIMESTAMP NOT NULL COMMENT '宴客日期',
  `reservation_date` TIMESTAMP NOT NULL COMMENT '預約日期時段',
  `reservation_notes` VARCHAR(500) NULL COMMENT '備註',
  `status` int not null default 1 comment '0取消, 1成功',
  PRIMARY KEY (`reservation_id`),
  FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) COMMENT = '會員預約賞聽';


INSERT INTO reservation (vendor_id, member_id, contact_name, contact_number, event_date, reservation_date,status)
VALUES
    ('vendor1@gmail.com', 'member2@gmail.com', 'Jane Smith', '0923456789', '2023-07-11 12:00:00', '2023-07-06 14:30:00',1),
    ('vendor1@gmail.com', 'member2@gmail.com', 'Jane Smith', '0923456789', '2023-07-11 12:00:00', '2023-07-06 14:30:00',1),
    ('vendor1@gmail.com', 'member3@gmail.com', 'Michael Johnson', '0934567890', '2023-07-12 12:00:00', '2023-07-07 19:30:00',1),
    ('vendor1@gmail.com', 'member4@gmail.com', 'Emily Davis', '0945678901', '2023-07-13 12:00:00', '2023-07-08 09:30:00',1),
    ('vendor1@gmail.com', 'member5@gmail.com', 'David Brown', '0956789012', '2023-07-14 12:00:00', '2023-07-09 16:00:00',1),
    ('vendor1@gmail.com', 'member6@gmail.com', 'Jennifer Wilson', '0967890123', '2023-07-15 12:00:00', '2023-07-10 11:30:00',1),
    ('vendor1@gmail.com', 'member7@gmail.com', 'Andrew Miller', '0978901234', '2023-07-16 12:00:00', '2023-07-11 13:30:00',1),
    ('vendor1@gmail.com', 'member8@gmail.com', 'Olivia Taylor', '0989012345', '2023-07-17 12:00:00', '2023-07-12 18:30:00',1),
    ('vendor1@gmail.com', 'member9@gmail.com', 'Daniel Anderson', '0990123456', '2023-07-18 12:00:00', '2023-07-13 15:30:00',1),
    ('vendor1@gmail.com', 'member10@gmail.com', 'Sophia Martinez', '0911234567', '2023-07-19 12:00:00', '2023-07-14 12:30:00',1);



CREATE TABLE `marryme`.`favorites_product` (
 `vendor_id` VARCHAR(50) NOT NULL COMMENT '場商_id 信箱 FK',
  `member_id` VARCHAR(50) NOT NULL COMMENT '會員_id 信箱 FK',
  FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
  )COMMENT = '追蹤廠商';


INSERT INTO `favorites_product` (`vendor_id`, `member_id`) VALUES
 ('vendor1@gmail.com', 'member1@gmail.com'),
  ('vendor2@gmail.com', 'member2@gmail.com'), 
  ('vendor3@gmail.com', 'member3@gmail.com'), 
  ('vendor4@gmail.com', 'member4@gmail.com'), 
  ('vendor5@gmail.com', 'member5@gmail.com'), 
  ('vendor6@gmail.com', 'member6@gmail.com');
    
CREATE TABLE `assess` (
  `rating_id` INT NOT NULL AUTO_INCREMENT COMMENT '評價_id 流水號 ',
  `vendor_id` VARCHAR(50) NOT NULL COMMENT '廠商_id 信箱 FK',
  `member_id` VARCHAR(50) NOT NULL COMMENT '會員_id 信箱 FK',
  `assess_score` INT NOT NULL COMMENT '評分',
  `assess_title` VARCHAR(200) NOT NULL COMMENT '標題',
  `assess_context` VARCHAR(500) NULL COMMENT '內容',
  PRIMARY KEY (`rating_id`),
  FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
)COMMENT = '廠商評價';

INSERT INTO `assess` (`vendor_id`, `member_id`, `assess_score`, `assess_title`, `assess_context`) VALUES
  ('vendor1@gmail.com', 'member1@gmail.com', 4, '非常好的體驗', '他們的服務非常出色，產品品質也很好。強烈推薦給大家！'),
  ('vendor2@gmail.com', 'member2@gmail.com', 5, '服務優秀', '這家店的服務簡直是無可挑剔的，他們總是能夠迅速解決我的問題。'),
  ('vendor3@gmail.com', 'member3@gmail.com', 3, '一般的體驗', '他們的產品質量一般，價格稍微有些高。'),
  ('vendor4@gmail.com', 'member4@gmail.com', 4, '對產品滿意', '這款產品的性能很出色，我對它感到非常滿意。'),
  ('vendor5@gmail.com', 'member5@gmail.com', 2, '客戶支援差', '每次我詢問問題時，他們的客戶支援都沒有給我滿意的答案。'),
  ('vendor6@gmail.com', 'member6@gmail.com', 5, '強烈推薦', '我非常喜歡這家店的產品，他們的服務也非常好。絕對值得推薦！'),
  ('vendor7@gmail.com', 'member7@gmail.com', 4, '產品品質好', '他們的產品質量非常好，堅固耐用，使用起來很舒適。'),
  ('vendor8@gmail.com', 'member8@gmail.com', 3, '價格公道', '這個價格對於所提供的產品來說是公道的，但有些功能稍微有所欠缺。'),
  ('vendor9@gmail.com', 'member9@gmail.com', 4, '送貨迅速', '他們的送貨速度很快，產品到達時都是完好無損的。'),
  ('vendor10@gmail.com', 'member10@gmail.com', 5, '表現卓越', '這家店的產品表現真的非常出色，我非常滿意他們的服務。');
  
  
  
CREATE TABLE `album` (
  `album_id` INT NOT NULL AUTO_INCREMENT  COMMENT '廠商相簿_id 流水號',
  `vendor_id` VARCHAR(50) NOT NULL COMMENT '廠商_id 信箱 FK',
  `album_video` VARCHAR(200) NULL COMMENT '廠商影片 用連接',
  `album_picture01` LONGBLOB NULL COMMENT '圖片1',
  `album_picture02` LONGBLOB NULL COMMENT '圖片2',
  `album_picture03` LONGBLOB NULL COMMENT '圖片3',
  `album_picture04` LONGBLOB NULL COMMENT '圖片4',
  `album_picture05` LONGBLOB NULL COMMENT '圖片5',
  `album_picture06` LONGBLOB NULL COMMENT '圖片6',
  `album_picture07` LONGBLOB NULL COMMENT '圖片7',
  `album_picture08` LONGBLOB NULL COMMENT '圖片8',
  `album_picture09` LONGBLOB NULL COMMENT '圖片9',
  `album_picture10` LONGBLOB NULL COMMENT '圖片10',
  `album_picture11` LONGBLOB NULL COMMENT '圖片11',
  `album_picture12` LONGBLOB NULL COMMENT '圖片12',
  `album_picture13` LONGBLOB NULL COMMENT '圖片13',
  `album_picture14` LONGBLOB NULL COMMENT '圖片14',
  `album_picture15` LONGBLOB NULL COMMENT '圖片15',
  `album_picture16` LONGBLOB NULL COMMENT '圖片16',
  `album_picture17` LONGBLOB NULL COMMENT '圖片17',
  `album_picture18` LONGBLOB NULL COMMENT '圖片18',
  `album_picture19` LONGBLOB NULL COMMENT '圖片19',
  `album_picture20` LONGBLOB NULL COMMENT '圖片20',
  PRIMARY KEY (`album_id`),
  FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
)COMMENT = '廠商相簿';



INSERT INTO `album` (`vendor_id`) VALUES
  ('vendor1@gmail.com'),
  ('vendor2@gmail.com'),
  ('vendor3@gmail.com'),
  ('vendor4@gmail.com'),
  ('vendor5@gmail.com'),
  ('vendor6@gmail.com'),
  ('vendor7@gmail.com'),
  ('vendor8@gmail.com'),
  ('vendor9@gmail.com'),
  ('vendor10@gmail.com');


-- 建立商品訂單--
CREATE TABLE orders (
		order_id int not null auto_increment comment '訂單_ID',
		member_id varchar(50) not null comment '會員_ID(信箱)',
        recipient_name varchar(50) not null comment '收件人姓名',
        recipient_phone varchar(20) not null comment '收件人電話',
        recipient_address varchar(50) not null comment '收件人地址',
		order_status TINYINT not null comment '訂單狀態(0待付款, 1待出貨, 2待收貨, 3已完成, 4取消)',
		order_date TIMESTAMP not null default NOW() comment '訂單日期',
		payment_method int not null comment '付款方式(0轉帳, 1刷卡)',
		payment_deadline TIMESTAMP not null comment '付款期限',
		payment_state int not null comment '付款狀態(0已成立, 1處理中, 2已付清)',
		shipping_fee int comment '運費',
		total_amount int not null comment '總金額' check (total_amount > 0 ),
		PRIMARY KEY (order_id),
  		FOREIGN KEY (member_id) REFERENCES member(member_id)
        )
		COMMENT '商品訂單';

INSERT INTO orders (member_id, recipient_name, recipient_phone, recipient_address, order_status, payment_method, payment_deadline, payment_state, shipping_fee, total_amount)
VALUES 
    ('member1@gmail.com', '林小一', '0910763485', '新北市三重區忠孝路三段47號5樓', 0, 0, '2023-07-25 18:00:00', 1, 120, 8920),
    ('member2@gmail.com', '蔡雄大', '0911904530', '台北市南港區三重路41巷15號8樓', 1, 1, '2023-07-26 19:00:00', 2, 120, 4620),
    ('member3@gmail.com', '金城武', '0912659093', '基隆市七堵區明德一路2巷3弄18號1樓', 2, 1, '2023-07-27 18:00:00', 2, 120, 14120),
    ('member4@gmail.com', '黃小雞', '0913859034', '台南市永康區大同街413巷17號2樓', 3, 0, '2023-07-28 18:00:00', 2, 120, 2620),
    ('member5@gmail.com', '劉小六', '0914980537', '高雄市三民區立忠路95巷310號12樓', 4, 1, '2023-07-29 18:00:00', 1, 120, 19120),
    ('member6@gmail.com', '李永哲', '0915764983', '彰化縣彰化市中華西路283巷67弄4樓', 0, 0, '2023-07-30 18:00:00', 1, 120, 2520),
    ('member7@gmail.com', '廖小二', '0916983875', '台中市中區中山路143巷310號3樓', 1, 1, '2023-07-31 19:00:00', 2, 120, 7120),
    ('member8@gmail.com', '白小黑', '0917490560', '新竹市北區中正路626巷280號9樓', 1, 1, '2023-08-01 18:00:00', 2, 120, 5120),
    ('member9@gmail.com', '羅大偉', '0918654321', '桃園市八德區介壽路二段490巷78號6樓', 0, 0, '2023-08-02 18:00:00', 1, 120, 12120),
    ('member10@gmail.com', '呂小王', '0919938403', '花蓮縣吉安鄉建國路一段162號1樓', 1, 0, '2023-08-03 18:00:00', 2, 120, 4520);

           
           
CREATE TABLE plan_place (
  place_id int primary key not null auto_increment comment'場地_ID',
  vendor_id varchar(50) not null comment '廠商_ID為信箱,{FK}',
  place_picture Blob comment '主圖片',
  place_title varchar(10) not null comment '標題', 
  numbeOfTables varchar(10) not null comment '建議桌數',
  place_Introduction varchar(1000) not null comment'廳別簡介',
  place_pictures2 longblob comment '圖片',
  place_pictures3 longblob comment '圖片',
  place_pictures4 longblob comment '圖片',
  place_pictures5 longblob comment '圖片',
   `status` int not null default 1 comment '0下架, 1上架',
  edit_status int not null default 0 comment '0可修改, 1不可修改',
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
  ) comment '婚宴場地' ;

INSERT INTO plan_place (vendor_id, place_title, numbeOfTables, place_Introduction, `status`, edit_status)
VALUES
('vendor1@gmail.com', '軒景廳', '21-31', '雍容時尚的軒景廳，以沉靜的莫蘭迪藍，擄獲各個女神新娘的目光',1 ,0),
('vendor1@gmail.com', '維也納廳', '11-29', '使用金屬鏡面與典雅棕色的宴會廳，呈現出貴族般的富麗堂皇卻又不失細膩溫馨，使幸福婚禮更趨近完美等級。',1 ,0),
('vendor1@gmail.com', '凡爾賽廳', '29', '造型水晶燈與典雅佈置妝點婚禮的甜蜜氣氛，象徵兩人幸福的未來，見證兩人美好的愛情開花結果',1 ,0),
('vendor1@gmail.com', '星空廳', '6', '絲質絨布落地窗簾在柔和燈光反射下，營造滿室浪漫華麗氛圍',1 ,0),
('vendor1@gmail.com', '歐佩拉廳', '25-27', '雅致風格的空間搭配高規格尖端設計感，呈現整體大器感',1 ,0),
('vendor1@gmail.com', '薔薇廳', '20-25', '雅致的空間設計，以穩定灰色調搭配白色，適合典雅浪漫的婚禮氛圍。',1 ,0),
('vendor1@gmail.com', '凱撒廳', '35-38', '黑鏡烤漆牆面現代感十足，天花板上兩排奢華水晶燈，黑鏡烤漆設計，璀璨燈光如繁星閃爍！',1 ,0),
('vendor2@gmail.com', '愛麗絲物語', '11-45', '粉色的玫瑰花語，代表的是美好高貴與純真善良的愛情，在典雅浪漫的花海布置下，完成屬於兩人的幸福盟約',1 ,0),
('vendor2@gmail.com', '翡儷廳', '12-19', '廳房主色調莫蘭迪藍，跳色搭配活潑的檸檬黃，輕婚禮的時尚感更成為現在的趨勢',1 ,0),
('vendor2@gmail.com', '寶儷廳', '26', '從步入紅毯的那一刻起，彷彿走入王子與公主的舞會，洋溢幸福的樂章',1 ,0),
('vendor2@gmail.com', '璀璨', '10-27', '紫色系維多利亞風',1 ,0),
('vendor2@gmail.com', '金枝玉葉', '10-27', '金綠色系童話風',1 ,0),
('vendor2@gmail.com', '蜷川', '12-19', '【萬眾矚目.全球唯一】跨界聯名打造絕美藝術空間',1 ,0),
('vendor3@gmail.com', '仙侶奇緣', '16-30', '白金色系古典精緻風',1 ,0),
('vendor3@gmail.com', '星空國際宴會廳', '30-99', '首選高規格大型喜慶宴席',1 ,0);


CREATE TABLE plan_product (
  plan_product_id int primary key not null auto_increment comment'方案商品_ID',
  vendor_id varchar(50) not null comment '廠商_ID = 信箱,{FK}',
  plan_picture blob comment'主圖片',
  plan_title varchar(20) not null comment'標題名稱',
  plan_introduction varchar(200) not null comment'方案簡介',
  `status` int not null default 1 comment'商品狀態,0下架、1上架',
  edit_status int not null default 0 comment '0可修改, 1不可修改',
  update_time Timestamp not null comment'更新時間',
  plan_pictures1 longblob comment'圖片1',
  plan_picture_intro1 varchar(20) comment'圖片簡介1',
  plan_pictures2 longblob comment'圖片2',
  plan_picture_intro2 varchar(20) comment'圖片簡介2',
  plan_pictures3 longblob comment'圖片3',
  plan_picture_intro3 varchar(20) comment'圖片簡介3',
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
)comment = '方案商品';


INSERT INTO plan_product (vendor_id, plan_title, plan_introduction, `status`, edit_status, update_time)
VALUES
('vendor1@gmail.com', '台北韓系小桌數專案', '水水新娘，妳能擁有的網美級場地，跟神助手婚企團隊，免另外找廠商，也可以享受超美的婚禮佈置，跟專業婚禮主持人', 1, 0, NOW()),
('vendor1@gmail.com', '戶外｜室內證婚儀式', '屬於你的網美證婚場地#戶外高空證婚 #室內網美證婚給你滿滿的儀式感，讓婚禮每一張照片都美到想狂發IG', 1, 0, NOW()),
('vendor1@gmail.com', '日日好婚日', '2023女神成家｜囍上加囍，+1好幸福', 1, 0, NOW()),
('vendor2@gmail.com', '2023 輕鬆成家 微婚禮🤍超幸福', '【2023小桌數婚宴專案】', 1, 0, NOW()),
('vendor2@gmail.com', '夢幻婚禮方案', '♥ 婚禮服務內容 ♥\n婚禮主持及流程規劃(45天前)\n新娘專屬管家服務\n現場宴會督導及流程掌控\n優質婚禮廠商推薦', 1, 0, NOW()),
('vendor2@gmail.com', '戶外證婚專案', '★儀式備品提供★\n．甜茶6-12人份、湯圓6-12人份、雞腿1隻、傳統高低椅一組、聘禮桌', 1, 0, NOW());

CREATE TABLE plan_item (
  plan_item_id int primary key not null auto_increment comment'方案加購項目_ID',
  vendor_id varchar(50) not null comment '廠商_ID = 信箱,{FK}',
  item_type int not null comment'項目種類,0試菜,1菜價,2婚禮企劃團隊服務,3婚禮佈置,4婚禮主持人,5婚禮小物,6其他',
  item_select varchar(400)not null comment'選項',
  item_description varchar(500)not null comment'描述',
  item_deposit int not null comment'訂金',
  item_total int not null comment'金額',
  `status` int not null default 1 comment '0下架, 1上架',
  edit_status int not null default 0 comment '0可修改, 1不可修改',
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
)comment = '方案加購項目訂購明細';

INSERT INTO plan_item (vendor_id, item_type, item_select, item_description, item_deposit, item_total, `status`, edit_status) VALUES
('vendor1@gmail.com', 0, '一桌', '試菜價8折', 4000, 10000, 1, 0),
('vendor1@gmail.com', 0, '兩桌', '可討論想試的菜色，第一次試菜完畢後可供二次試菜並定案', 12000, 30000, 1, 0),
('vendor1@gmail.com', 1, '基本菜色', '一桌的價格', 6400, 16000, 1, 0),
('vendor1@gmail.com', 1, '豪華澎拜甲吼飽飽飽', '一桌的價格', 8000, 20000, 1, 0),
('vendor1@gmail.com', 2, '基本企劃', '簡易流程規劃', 40000, 100000, 1, 0),
('vendor1@gmail.com', 2, '豪華浪漫企劃', '豪華浪漫企劃從頭到尾幫你包辦', 80000, 200000, 1, 0),
('vendor1@gmail.com', 3, '花草主題', '大自然的元素', 6400, 16000, 1, 0),
('vendor1@gmail.com', 3, '仙女風格', '看過住城堡的公主嗎？', 12800, 32000, 1, 0),
('vendor1@gmail.com', 3, '貴氣逼人', '奢華程度史上第一，後無來者', 80000, 200000, 1, 0),
('vendor1@gmail.com', 4, '基本主持', '簡單的婚禮必備', 2400, 6000, 1, 0),
('vendor1@gmail.com', 4, '嗨起來，遊戲唱歌樣樣精通', '想要熱鬧開心的婚禮一定要選', 6400, 16000, 1, 0),
('vendor1@gmail.com', 4, '藝人&網紅', '邀請大咖藝人', 80000, 200000, 1, 0),
('vendor1@gmail.com', 5, '棉花糖', '二進&送客所需的小禮物', 400, 1000, 1, 0),
('vendor1@gmail.com', 5, '手工花朵金沙巧克力', '二進&送客所需的小禮物', 4000, 10000, 1, 0),
('vendor1@gmail.com', 6, '西式證婚', ' 證婚儀式', 12000, 30000, 1, 0),
('vendor1@gmail.com', 6, '輕食吧', '內含：麵包棒、香橙磅蛋糕、手工餅乾、水果兩款、果汁暢飲', 4000, 10000, 1, 0),
('vendor1@gmail.com', 1, '一桌', '一套試完口味、菜色可調整', 4800, 12000, 1, 0),
('vendor1@gmail.com', 2, '基本', '菜價', 4800, 12000, 1, 0),
('vendor1@gmail.com', 3, '基本', '婚禮企劃團隊服務', 4000, 10000, 1, 0),
('vendor1@gmail.com', 4, '基本', '婚禮佈置', 8000, 20000, 1, 0);

CREATE TABLE plan_product_detail (
    plan_product_detail_id int primary key not null auto_increment comment'方案商品明細_ID',
    plan_product_id int comment'方案商品_ID',
    place_id int comment'場地_ID',
    FOREIGN KEY (plan_product_id) REFERENCES plan_product(plan_product_id)
)comment = '方案商品明細(會有多個場地或加購項目，數量不一定對等，可為null，非關聯關係）';

INSERT INTO plan_product_detail (plan_product_id, place_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (3, 1),
    (3, 2),
    (3, null);


CREATE TABLE member_coupon_list (
  `member_id` varchar(50) not null comment '會員_ID FK',
  `discount_code` varchar(10) null comment '優惠代碼  FK',
  `coupon_status` int null comment '使用狀態(0:已使用, 1:已過期,2:未使用)',
  CONSTRAINT member_coupon_list_member_id_FK FOREIGN KEY (member_id) REFERENCES member (member_id),
  CONSTRAINT member_coupon_list_discount_code_FK FOREIGN KEY (discount_code) REFERENCES activity (discount_code),
  PRIMARY KEY (member_id) comment '會員所擁有的優惠');
  
  
INSERT INTO member_coupon_list(member_id, discount_code, coupon_status)
VALUES('member1@gmail.com', 'CODE001', 1),
	  ('member2@gmail.com', 'CODE002', 0),
      ('member3@gmail.com', 'CODE003', 0),
      ('member4@gmail.com', 'CODE004', 0),
      ('member5@gmail.com', 'CODE005', 2),
      ('member6@gmail.com', 'CODE006', 2),
      ('member7@gmail.com', 'CODE007', 0),
      ('member8@gmail.com', 'CODE008', 1),
      ('member9@gmail.com', 'CODE009', 0),
      ('member10@gmail.com', 'CODE010', 2);
      
      
      
-- 建立商品訂單明細
CREATE TABLE order_detail (
	order_detail_id int not null auto_increment comment '訂單明細_ID',
	order_id int not null comment '訂單_ID',
	product_id int not null comment '商品_ID',
	quantity int not null comment '數量',
	amount int not null comment '購買總金額' check (amount > 0),
	PRIMARY KEY (order_detail_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES product(product_id)
) COMMENT '商品訂單明細';

INSERT INTO order_detail (order_id, product_id, quantity, amount)
VALUES
	(1, 1, 2, 8000),
	(1, 3, 1, 800),
	(2, 2, 3, 4500),
	(3, 4, 2, 14000),
	(4, 5, 1, 2500),
	(5, 1, 4, 16000),
	(5, 2, 2, 3000),
	(6, 3, 3, 2400),
	(7, 4, 1, 7000),
	(8, 5, 2, 5000),
    (9, 8, 2, 12000),
    (10, 9, 2, 4400);
        
        
CREATE TABLE unavailable_dates (
  unavailable_dates_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '不可預約時段_ID 流水號',
  place_id INT NOT NULL COMMENT '場地_id FK',
  unavailable_date date not null comment'不可預約日期',
  unavailable_time int not null comment'不可預約時間,0中午、1晚上',
  unique key UK_unavailable_dateAndTime(place_id,unavailable_date,unavailable_time),
  FOREIGN KEY (place_id) REFERENCES plan_place(place_id)
  )COMMENT = '不可預約時段'; 
  
  
INSERT INTO unavailable_dates (place_id, unavailable_date, unavailable_time)
VALUES
('1', '20230711', '1'),
('1', '20240314', '0'),
('1', '20241114', '0'),
('1', '20240112', '0'),
('1', '20240314', '1'),
('2', '20240911', '0'),
('2', '20240612', '0'),
('2', '20241124', '0'),
('3', '20250514', '0'),
('3', '20251114', '0'),
('3', '20260112', '0'),
('3', '20240811', '0'),
('3', '20240511', '1'),
('3', '20250224', '0'),
('3', '20240927', '0');

CREATE TABLE plan_order (
  plan_order_id int primary key not null auto_increment comment'方案訂單_ID',
  member_id varchar(50) not null comment '會員_ID=信箱{FK}',
  plan_product_id int not null comment'方案商品_ID{FK}',
  place_id int not null comment'場地_ID{FK}',
  unavailable_dates_id int not null comment'不可預約時段_ID{FK}',
  order_tables int not null comment'實際桌數',
  order_status int comment'訂單狀態,0已成立、1處理中、2已聯繫廠商、3廠商已確認訂購品項、4已完成、5已取消',
  payment_method int not null comment'付款方式, 0轉帳、1刷卡',
  payment_state int comment'付款狀態,0未付款、1已付訂、2已付清、3取消',
  total_amount int comment'總金額',
  order_dateTime Timestamp not null comment'訂單時間',
  grant_amount int not null comment'餘額',
  original_price int comment'原價',
  discount_price DECIMAL comment'折扣價',
  discount_code char(10) comment'優惠代碼{FK}',
  FOREIGN KEY (member_id) REFERENCES member(member_id),
  FOREIGN KEY (plan_product_id) REFERENCES plan_product(plan_product_id),
  FOREIGN KEY (place_id) REFERENCES plan_place(place_id),
  FOREIGN KEY (unavailable_dates_id) REFERENCES unavailable_dates(unavailable_dates_id),
  FOREIGN KEY (discount_code) REFERENCES member_coupon_list  (discount_code)
)comment = '方案訂單';

INSERT INTO plan_order (member_id, plan_product_id, place_id, unavailable_dates_id, order_tables,
order_status, payment_method, payment_state, total_amount, order_dateTime, grant_amount)
VALUES
    ('member1@gmail.com', 1, 1, 1, 21, 0, 1, 1, 100000, NOW(), 60000),
    ('member2@gmail.com', 2, 1, 2, 22, 1, 1, 1, 100000, NOW(), 60000),
    ('member3@gmail.com', 3, 1, 3, 23, 2, 0, 2, 100000, NOW(), 60000),
    ('member4@gmail.com', 4, 1, 4, 24, 3, 1, 2, 100000, NOW(), 60000),
    ('member5@gmail.com', 5, 1, 5, 25, 4, 0, 3, 100000, NOW(), 60000);
    
    
CREATE TABLE plan_order_detail (
  plan_order_detail_id int primary key not null auto_increment comment'方案訂購明細_ID',
  plan_order_id int not null comment'方案訂單_ID',
  plan_item_id int not null comment'方案加購項目_ID',
  FOREIGN KEY (plan_order_id) REFERENCES plan_order(plan_order_id),
  FOREIGN KEY (plan_item_id) REFERENCES plan_item(plan_item_id)
)comment = '方案加購項目訂購明細';


insert into plan_order_detail(plan_order_id,plan_item_id) values
(1,1),
(1,3),
(1,5),
(1,7),
(1,10),
(1,13),
(1,15),
(2,17),
(2,18),
(2,19),
(2,20);