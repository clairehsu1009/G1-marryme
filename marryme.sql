create database if not exists marryme;
use marryme;


DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS notification;
DROP TABLE IF EXISTS reservation;

DROP TABLE IF EXISTS plan_place;
DROP TABLE IF EXISTS unavailable_dates;
DROP TABLE IF EXISTS plan_item;
DROP TABLE IF EXISTS plan_product;
DROP TABLE IF EXISTS plan_product_detail;
DROP TABLE IF EXISTS plan_order;
DROP TABLE IF EXISTS plan_order_detail;


DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS vendor;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;
  

CREATE TABLE member (
  `member_id` varchar(50) not null comment '會員_ID (信箱)' ,
  `member_password` varchar(100) not null comment '密碼',
  `member_name` varchar(50) null comment '姓名',
  `member_phone` varchar(20) null comment '手機',
  `member_address` varchar(50) null comment '地址',
  `member_gender` int null comment '性別(0:男; 1:女)',
  `member_registration_time` date null comment '註冊時間',
  `member_last_login_time` date null comment '最後登入時間',
  `member_registration_ip` varchar(50) null comment '註冊IP',
  `member_login_ip` varchar(50) null comment '最後登入IP',
  `verification_status` int null comment '驗證狀態(0:未驗證, 1:驗證成功,2:驗證失敗)',
  PRIMARY KEY (member_id))
  comment '會員資料表';
  
  
  CREATE TABLE vendor (
  `vendor_id` varchar(50) not null comment '廠商_ID (信箱)',
   `vendor_password` varchar(100) not null comment '密碼',
  `vendor_phone` varchar(20) null comment '電話號碼',
  `vendor_name` varchar(50) null comment '品牌名稱',
  `vendor_location` varchar(50) null comment '服務地區',
  `vendor_address` varchar(50) null comment '地址',
  `vendor_website` text null comment '官方網站',
  `vendor_fb` varchar(50) null comment 'facebook',
  `vendor_ig` varchar(50) null comment 'IG',
  `company_id` varchar(50) null comment '統一編號',
  `contact_person` varchar(50) null comment '聯絡人',
  `vendor_registration_time` date null comment '註冊日期',
  `vendor_status` int null comment '處理狀態(0:未處理; 1:審核中;2:審核通過)',
  `basic_introduction` varchar(500) null comment '基本介紹',
  `googlemap` text null comment 'google地圖',
  `manufacturer_category` int null comment '廠商類別(0:商品 , 1:服務)',
  PRIMARY KEY (vendor_id))
  comment '廠商資料表';

  
INSERT INTO member (member_id, member_password, member_name, member_phone, member_address, member_gender, member_registration_time, member_last_login_time, verification_status)  
VALUES ('member1@gmail.com', 'xtr1234'  ,'林小一', '0910763485', '新北市三重區忠孝路三段47號5樓', 1, STR_TO_DATE('2002-11-17','%Y-%m-%d'), STR_TO_DATE('2005-03-21','%Y-%m-%d'), 0),
       ('member2@gmail.com',  'yue5432'  ,'蔡雄大', '0911904530', '台北市南港區三重路41巷15號8樓', 1, STR_TO_DATE('2021-06-30','%Y-%m-%d'), STR_TO_DATE('2022-07-21','%Y-%m-%d'), 1),
       ('member3@gmail.com', 'uoi5832'  ,'金城武', '0912659093', '基隆市七堵區明德一路2巷3弄18號1樓', 0, STR_TO_DATE('2014-04-15','%Y-%m-%d'), STR_TO_DATE('2016-01-31','%Y-%m-%d'), 2),
       ('member4@gmail.com', 'die6534'  ,'黃小雞', '0913859034', '台南市永康區大同街413巷17號2樓', 1, STR_TO_DATE('2016-12-09','%Y-%m-%d'), STR_TO_DATE('2017-05-17','%Y-%m-%d'), 0),
	   ('member5@gmail.com', 'ile4326'  ,'劉小六', '0914980537', '高雄市三民區立忠路95巷310號12樓', 1, STR_TO_DATE('2015-03-15','%Y-%m-%d'), STR_TO_DATE('2016-08-04','%Y-%m-%d'), 1),
	   ('member6@gmail.com', 'jid7693' ,'李永哲', '0915764983', '彰化縣彰化市中華西路283巷67弄4樓', 0, STR_TO_DATE('2018-05-19','%Y-%m-%d'), STR_TO_DATE('2019-08-13','%Y-%m-%d'), 2),
       ('member7@gmail.com', 'iem9853'  ,'廖小二', '0916983875', '台中市中區中山路143巷310號3樓', 1, STR_TO_DATE('2020-01-14','%Y-%m-%d'), STR_TO_DATE('2020-12-12','%Y-%m-%d'), 0),
       ('member8@gmail.com', 'ioe7823' ,'白小黑', '0917490560', '新竹市北區中正路626巷280號9樓', 1, STR_TO_DATE('2005-08-16','%Y-%m-%d'), STR_TO_DATE('2006-11-11','%Y-%m-%d'), 0),
       ('member9@gmail.com', 'oeu9854'  ,'羅大偉', '0918654321', '桃園市八德區介壽路二段490巷78號6樓', 0, STR_TO_DATE('2007-02-18','%Y-%m-%d'), STR_TO_DATE('2008-03-31','%Y-%m-%d'), 1),
       ('member10@gmail.com', 'yti2387' ,'呂小王', '0919938403', '花蓮縣吉安鄉建國路一段162號1樓', 1, STR_TO_DATE('2008-07-04','%Y-%m-%d'), STR_TO_DATE('2010-04-19','%Y-%m-%d'), 1);

       
INSERT INTO vendor(vendor_id, vendor_password, vendor_phone,  vendor_name, vendor_location, vendor_address,  vendor_website, company_id, contact_person, vendor_registration_time, vendor_status, basic_introduction, googlemap, manufacturer_category)
	VALUES('vendor1@gmail.com', 'feide7830', '02-7728-3610 轉 8293', '新莊典華', '新北市', '新北市新莊區中央路469號', 'https://www.denwell.com/', '89735473', '蔡曉明', '2001-12-01', 1, '「新莊典華」為新北最大宴會場地，共有14個主題宴會廳，4座觀禮儀式堂。全層無柱、挑高的場地設計，可容納1~100桌的大小宴會。宴會廳內附有典華著名的專利設備，升降星光大道、幸福纜車、鉛錘及婚禮互動機，增加出場驚喜感及特別性。', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7228.6440690666595!2d121.446779!3d25.057072!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a881c7e33d81%3A0xb2a91fef75d529a4!2zMjQy5paw5YyX5biC5paw6I6K5Y2A5Lit5aSu6LevNDY56Jmf!5e0!3m2!1szh-TW!2stw!4v1692084764098!5m2!1szh-TW!2stw" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', 1),
		  ('vendor2@gmail.com', 'ielel9384', '02-7728-3610 轉 7215', '煙波大飯店-新竹湖濱館', '新竹市', '新竹市東區新竹市明湖路773號', 'https://hsinchu.lakeshore.com.tw/latest-news/wedding-special/', '82894654', '王小黑', '2001-12-01', 1, '煙波婚宴企劃團隊，以專業規劃、貼心服務，與您攜手打造理想中的夢幻婚宴。除歐風典雅宴會場地及精緻菜式，更結合飯店優勢，打造專屬戶外證婚場地、新娘、親友住房等周邊完整服務，陽光灑落，大片綠意隨之映出光芒，為新人獻上最閃亮的祝福。', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7245.127875747214!2d120.968496!3d24.776136!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34684a0c742c1037%3A0x4ec26e42a41a771e!2zMzAw5paw56u55biC5p2x5Y2A5piO5rmW6LevNzcz6Jmf!5e0!3m2!1szh-TW!2stw!4v1692084792104!5m2!1szh-TW!2stw" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', 1),
		  ('vendor3@gmail.com', 'joiwn8993', '02-7728-3610 轉 4006',  '雅悅會館台南館', '台南市', '台南市東區台南市東區中華東路一段366號5樓(南紡夢時代)', 'https://www.glb.com.tw/', '83495763', '李小白', '2012-03-12', 1, '給您六個非選「雅悅會館 台南館」的原因:✔奢華宴會廳_打造頂級獨立宴會廳、挑高大空間 寬敞舒適還有專屬新娘的高級休息室，享受成為公主的一天!!!✔大台南唯一空中花園證婚_夢幻婚禮，一起留下最美好的回憶時刻✔頂級設備_高級聲光音響設備，LED對開巨幕、KPOP互動舞台編織出最精采的難忘婚宴!!!✔最強婚企團隊_專屬婚企團隊精心幫您規劃婚禮流程，處理婚宴大小事讓您什麼都不擔心，舉辦婚禮好簡單!!!✔主題風格佈置_主題拍照區、專屬拍照背板、禮桌佈置，讓您拍照好美麗!!!✔經典料理_非傳統又美味的五星等級料理讓與會人員都能吃的開心、吃的放心!!!', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7345.795564297032!2d120.232703!3d22.990786!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e76bea4df0e25%3A0xe307d34670241186!2z5Y2X57Sh6LO854mp5Lit5b-D!5e0!3m2!1szh-TW!2stw!4v1692084805916!5m2!1szh-TW!2stw" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', 1),
		  ('vendor4@gmail.com', 'eisid3892', '02-7728-3610 轉 9662',  '新天地崇德旗艦店', '台中市', '台中市北屯區崇德五路345號', 'https://www.newpalace.com.tw/branch/shungtak', '84904654', '廖筱琦', '2015-03-01', 0, '新天地《崇德旗艦店》高達6200坪營業面積，為中台灣最大的婚宴會館之一，外觀有如中世紀壯闊浪漫的城堡聖殿，從華麗水晶燈、歐式蝴蝶展梯到適合各類大小型婚宴、工商聚餐的宴會廳、西式或日式證婚儀式堂，千萬等級的高規裝潢與精湛廚藝佳餚，深受在地好評，也是文定喜宴辦桌聚餐的高人氣首選。一樓樂食自助百匯每日提供的上百道中式、法式、日式各國海陸佳餚，新鮮美味一次品嚐；各樓層設置的豪華貴賓室、獨立包廂、大小型宴會廳，無論是舉辦婚禮喜宴、餐會酒會、國際會議 或朋友相聚、工商聯 誼、家庭聚餐、生日宴會等…，應有盡有，一應具全。', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7279.589672630858!2d120.68432600000001!3d24.178927!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346917c15ad924a9%3A0x22a93492625d879f!2zNDA25Y-w54Gj5Y-w5Lit5biC5YyX5bGv5Y2A5bSH5b635LqU6LevMzQ16Jmf!5e0!3m2!1szh-TW!2sus!4v1692084820362!5m2!1szh-TW!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', 1),
		  ('vendor5@gmail.com', 'oeedw8392', '02-7728-3610 轉 4547', '青青格麗絲莊園', '桃園市', '桃園市蘆竹區南崁路46號', 'https://www.grace-wed.com/', '87894654', '游小孟', '2011-09-19', 1, '青青格麗絲莊園，完美打造大桃園另一股歐式戶外婚禮的潮流。已經準備攜手踏上紅毯的佳偶們，可把握時機，讓心中的美夢成真。維持青青婚宴文創集團DNA，完美戶外婚禮三部曲，包括：(一)溫馨歡樂的迎賓茶會、(二)神聖浪漫的觀禮儀式、(三)創意主題婚宴。', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7229.35838240158!2d121.296629!3d25.044959!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34681fd821487bc7%3A0xdaa46f0b595a8b59!2zMzM45Y-w54Gj5qGD5ZyS5biC6JiG56u55Y2A5Y2X5bSB6LevNDbomZ8!5e0!3m2!1szh-TW!2sus!4v1692084835639!5m2!1szh-TW!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', 1),
		  ('vendor6@gmail.com', 'aieoe9384', '02-7728-3610 轉 11270',  'HEARTS ON FIRE', '台南市', '台南市南區金華路一段507號', null, '86898354', '羅小曼', '2019-10-12', 2, '寶華珠寶已在台南深耕23年，老闆是擁有40年資歷的金工師傅，因此對於珠寶工藝非常講究。目前二代開始接手，並考取GIA(美國寶石研究院)證照，除了戒台的工藝對於寶石的篩選更是嚴格，平價也能擁有精品級的珠寶。', 'https://www.google.com/maps/place/702%E5%8F%B0%E7%81%A3%E5%8F%B0%E5%8D%97%E5%B8%82%E5%8D%97%E5%8D%80%E9%87%91%E8%8F%AF%E8%B7%AF%E4%B8%80%E6%AE%B5507%E8%99%9F/@22.97457,120.1907,16z/data=!4m6!3m5!1s0x346e75da5553c4ab:0xeecb5cc695fa9aa2!8m2!3d22.97457!4d120.1907!16s%2Fg%2F11c20xlfvh?hl=zh-TW&entry=ttu', 0),
		  ('vendor7@gmail.com', 'qieop3829', '02-7728-3610 轉 9731',  'DAYOU 大祐', '桃園市', '桃園市蘆竹區南崁路一段110號1樓', 'http://www.dayou.tw/', '85388894', '劉孟學', '2010-04-18', 1, '大祐珠寶在鑽石產業，由1986年開始至今已逾30年，是繼鑽石批發產業之後，首度整合婚戒、貴重珠寶，提供消費者完善以及多樣化的產品服務。每顆鑽石都經過專家精挑細選。', 'https://www.google.com/maps?ll=25.052032,121.287905&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=1+338%E6%A1%83%E5%9C%92%E5%B8%82%E8%98%86%E7%AB%B9%E5%8D%80%E5%8D%97%E5%B4%81%E8%B7%AF%E4%B8%80%E6%AE%B5110%E8%99%9F', 0),
		  ('vendor8@gmail.com', 'kmiei9839', '02-7728-3610 轉 9384',  'AMOUREUX純愛甜心', '台中市', '台中市西區西區五權西三街7號', 'https://www.amoureux.com.tw/', '87632894', '洪小語', '1993-03-15', 1, 'AMOUREUX希望能將濃情蜜意的愛，款待給每一位放在您心頭上的人而AMOUREUX 相信每個人都值得擁有幸福，便以能滿足新人、長輩和親友的美味甜點為使命，要在每個重要的日子裡，為您悉心款待每一位放在心頭上的家人與夥伴。', 'https://www.google.com/maps?ll=24.139727,120.663216&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=403%E5%8F%B0%E4%B8%AD%E5%B8%82%E8%A5%BF%E5%8D%80%E4%BA%94%E6%AC%8A%E8%A5%BF%E4%B8%89%E8%A1%977%E8%99%9F', 0),
		  ('vendor9@gmail.com', 'uelme8304', '02-7728-3610 轉 11244', '舊振南', '高雄市', '高雄市大寮區捷西路298號', 'https://www.jzn.com.tw/tw/index', '88356494', '吳智湧', '2004-06-28', 1, '舊振南餅店創立於1890年，傳承百年手工製餅技藝，將漢餅的精神價值，演繹在送禮哲學上，讓每一份舊振南禮品，都能觸動送禮者與收禮者的內心。舊振南，將台灣味道與在地特色推廣到世界各地。', 'https://www.google.com/maps?ll=22.622309,120.389496&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=831%E9%AB%98%E9%9B%84%E5%B8%82%E5%A4%A7%E5%AF%AE%E5%8D%80%E6%8D%B7%E8%A5%BF%E8%B7%AF298%E8%99%9F', 0),
		  ('vendor10@gmail.com', 'rjele0394', '02-7728-3610 轉 11188',  'PETITPOT', '台北市', '台北市北投區北投路一段7號', 'https://www.173cake.com/', '89829394', '張無絃', '2019-08-18', 1, '一之鄉創立於台灣，許多生活在台灣的人，一生中美好的記憶總是有著一之鄉蜂蜜蛋糕的香甜滋味不論是迎接新生命的喜悅、走入兩人的新生活、或是為情誼增溫的貼心問候，這滋味總是溫柔的存在這些幸福時刻，每一口單純美好的氣息總叫人難以忘懷！', 'https://www.google.com/maps?ll=25.121736,121.501814&z=16&t=m&hl=zh-TW&gl=US&mapclient=embed&q=112%E5%8F%B0%E5%8C%97%E5%B8%82%E5%8C%97%E6%8A%95%E5%8D%80%E5%8C%97%E6%8A%95%E8%B7%AF%E4%B8%80%E6%AE%B57%E8%99%9F', 0);
     
          
          
set auto_increment_offset=1;
set auto_increment_increment=1;
CREATE TABLE emp (
  `emp_id` int auto_increment not null comment '員工_ID',
  `emp_password` varchar(50) not null comment '密碼',
  `emp_name` varchar(50) null comment '員工姓名',
  `hiredate` date  null comment '入職時間',
  `emp_gender` int null comment '性別(0:男 , 1:女)',
  `birthday` date  null comment '生日',
  `emp_email` varchar(50) null comment '信箱',
  `emp_phone` varchar(10) null comment '手機 ',
  `emp_address` varchar(50) null comment '地址 ',
  `emp_status` int null comment '員工狀態(0:已離職; 1:在職中)',
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
	   ('vendor8@gmail.com', 3, '婚禮小物1', NULL, 1000, 800, 30, NULL, NOW(), 1),
	   ('vendor9@gmail.com', 4, '婚紗/禮服1', NULL, 8000, 7000, 20, NULL, NOW(), 1),
	   ('vendor10@gmail.com', 5, '高跟鞋/西裝鞋1', NULL, 3000, 2500, 40, NULL, NOW(), 1),
	   ('vendor6@gmail.com', 2, '喜餅2', NULL, 1800, 1600, 80, '超好吃的喜餅喔', NOW(), 1),
	   ('vendor7@gmail.com', 3, '婚禮小物2', NULL, 900, 700, 15, '可愛的婚禮巧克力', NOW(), 1),
	   ('vendor8@gmail.com', 4, '婚紗/禮服2', NULL, 7500, 6000, 25, '新娘穿上會超美', NOW(), 1),
	   ('vendor9@gmail.com', 5, '高跟鞋/西裝鞋2', NULL, 2800, 2200, 60, '超美的高跟鞋', NOW(), 1),
	   ('vendor10@gmail.com', 1, '婚戒2', NULL, 4800, 4200, 35, '超讚的婚戒', NOW(), 1);




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
    ('vendor1@gmail.com', 'member2@gmail.com', 'Jane Smith', '0923456789', '2023-07-11 18:00:00', '2023-07-06 14:30:00',1),
    ('vendor1@gmail.com', 'member3@gmail.com', 'Michael Johnson', '0934567890', '2023-07-12 18:00:00', '2023-07-07 19:30:00',1),
    ('vendor1@gmail.com', 'member4@gmail.com', 'Emily Davis', '0945678901', '2023-07-13 12:00:00', '2023-07-08 19:30:00',1),
    ('vendor1@gmail.com', 'member5@gmail.com', 'David Brown', '0956789012', '2023-07-14 12:00:00', '2023-07-09 16:00:00',1),
    ('vendor1@gmail.com', 'member6@gmail.com', 'Jennifer Wilson', '0967890123', '2023-07-15 12:00:00', '2023-07-10 12:30:00',1),
    ('vendor1@gmail.com', 'member7@gmail.com', 'Andrew Miller', '0978901234', '2023-07-16 12:00:00', '2023-07-11 13:30:00',1),
    ('vendor1@gmail.com', 'member8@gmail.com', 'Olivia Taylor', '0989012345', '2023-07-17 12:00:00', '2023-07-12 18:30:00',1),
    ('vendor1@gmail.com', 'member9@gmail.com', 'Daniel Anderson', '0990123456', '2023-07-18 12:00:00', '2023-07-13 15:30:00',1),
    ('vendor1@gmail.com', 'member10@gmail.com', 'Sophia Martinez', '0911234567', '2023-07-19 12:00:00', '2023-07-14 12:30:00',1);




-- 建立商品訂單--
CREATE TABLE orders (
		order_id int auto_increment comment '訂單_ID',
		member_id varchar(50) not null comment '會員_ID(信箱)',
        vendor_id varchar(50) not null comment '廠商_ID(信箱)',
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
  		FOREIGN KEY (member_id) REFERENCES member(member_id),
        FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
        )
		COMMENT '商品訂單';

INSERT INTO orders (member_id, vendor_id, recipient_name, recipient_phone, recipient_address, order_status, payment_method, payment_deadline, payment_state, shipping_fee, total_amount)
VALUES 
    ('member1@gmail.com', 'vendor6@gmail.com', '林小一', '0910763485', '新北市三重區忠孝路三段47號5樓', 0, 0, '2023-07-25 18:00:00', 1, 120, 5720),
    ('member2@gmail.com', 'vendor7@gmail.com', '蔡雄大', '0911904530', '台北市南港區三重路41巷15號8樓', 1, 1, '2023-07-26 19:00:00', 2, 120, 2320),
    ('member3@gmail.com', 'vendor8@gmail.com', '金城武', '0912659093', '基隆市七堵區明德一路2巷3弄18號1樓', 2, 1, '2023-07-27 18:00:00', 2, 120, 6920);

           
           
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
('vendor1@gmail.com', 2, '基本企劃', '為你客製化量身打造', 40000, 100000, 1, 0),
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
('vendor1@gmail.com', 2, '基本', '基本流程', 4800, 12000, 1, 0),
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
	(1, 1, 1, 4000),
	(1, 6, 1, 1600),
	(2, 2, 1, 1500),
	(2, 7, 1, 700),
	(3, 3, 1, 800),
	(3, 8, 1, 6000);
        
        
CREATE TABLE unavailable_dates (
  unavailable_dates_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '不可預約時段_ID 流水號',
  place_id INT NOT NULL COMMENT '場地_id FK',
  unavailable_date varchar(20) not null comment'不可預約日期',
  unavailable_time int not null comment'不可預約時間,0中午、1晚上',
  unique key UK_unavailable_dateAndTime(place_id,unavailable_date,unavailable_time),
  FOREIGN KEY (place_id) REFERENCES plan_place(place_id)
  )COMMENT = '不可預約時段'; 
  
  
INSERT INTO unavailable_dates (place_id, unavailable_date, unavailable_time)
VALUES
('1', '2023-07-11', '1'),
('1', '2024-03-14', '0'),
('1', '2024-11-14', '0'),
('1', '2024-01-12', '0'),
('1', '2024-03-14', '1'),
('2', '2024-09-11', '0'),
('2', '2024-06-12', '0'),
('2', '2024-11-24', '0'),
('3', '2025-05-14', '0'),
('3', '2025-11-14', '0'),
('3', '2026-01-12', '0'),
('3', '2024-08-11', '0'),
('3', '2024-05-11', '1'),
('3', '2025-02-24', '0'),
('3', '2024-09-27', '0');

CREATE TABLE plan_order (
  plan_order_id int primary key not null auto_increment comment'方案訂單_ID',
  member_id varchar(50) not null comment '會員_ID=信箱{FK}',
  vendor_id varchar(50) not null comment '廠商_ID=信箱{FK}',
  plan_product_id int not null comment'方案商品_ID{FK}',
  place_id int not null comment'場地_ID{FK}',
  unavailable_dates_id int not null comment'不可預約時段_ID{FK}',
  order_tables int not null comment'實際桌數',
  order_status int comment'訂單狀態,0已成立、1處理中、2已聯繫廠商、3廠商已確認訂購品項、4已完成、5已取消',
  payment_method int comment'付款方式, 0轉帳、1刷卡',
  payment_state int comment'付款狀態,0未付款、1已付訂、2已付清、3取消',
  total_amount bigint comment'總金額',
  order_dateTime Timestamp not null comment'訂單時間',
  grant_amount int not null comment'餘額',
  FOREIGN KEY (member_id) REFERENCES member(member_id),
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id),
  FOREIGN KEY (plan_product_id) REFERENCES plan_product(plan_product_id),
  FOREIGN KEY (unavailable_dates_id) REFERENCES unavailable_dates(unavailable_dates_id)
)comment = '方案訂單';

INSERT INTO plan_order (member_id, vendor_id, plan_product_id, place_id, unavailable_dates_id, order_tables,
order_status, payment_state, total_amount, order_dateTime, grant_amount)
VALUES
    ('member1@gmail.com', 'vendor1@gmail.com', 1, 1, 1, 21, 0, 1, 100000, NOW(), 60000),
    ('member2@gmail.com', 'vendor1@gmail.com', 2, 1, 2, 22, 1, 1, 100000, NOW(), 60000),
    ('member3@gmail.com', 'vendor1@gmail.com', 3, 1, 3, 23, 2, 2, 100000, NOW(), 60000),
    ('member4@gmail.com', 'vendor2@gmail.com', 4, 1, 4, 24, 3, 2, 100000, NOW(), 60000),
    ('member5@gmail.com', 'vendor2@gmail.com', 5, 1, 5, 25, 4, 3, 100000, NOW(), 60000);
    
    
CREATE TABLE plan_order_detail (
  plan_order_detail_id int primary key not null auto_increment comment'方案訂購明細_ID',
  plan_order_id int not null comment'方案訂單_ID',
  plan_item_id int not null comment'方案加購項目_ID',
  FOREIGN KEY (plan_order_id) REFERENCES plan_order(plan_order_id)
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