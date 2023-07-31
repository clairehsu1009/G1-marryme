  
  const init = () => {
    // 使用Fetch API呼叫後端Servlet取得商品資料
    fetch('http://localhost:8080/marryme/weddingVenue') // 替換成實際的Servlet URL
        .then(response => response.json())
        .then(data => {
 		const serviceList = document.getElementById("service_list");
 		 data.forEach((item) => {
 				 `
 				 <ul class="shop_box" id="data-cltk-id_6167">
                    <li class="shop_pic">
                        <a class="shop_pic_a cltk_click" data-cltk-id="data-cltk-id_6167" href="#"
                            title="${weddingVenue.placeTitle}">
                            <picture>
                               
                               <img class="shop_pic_img" title="孫立人將軍官邸 - 官邸文囍"
                                    alt="貓貓官邸"
                                    src="data:image/png;base64,"+ ${item.image}>
                            </picture>
                        </a>
                    </li>
                    <li class="shop_info">
                        <h2><a class="shop_name cltk_click" data-cltk-id="data-cltk-id_6167" href="#"
                                title="貓貓官邸">貓貓官邸</a>
                        </h2>
                        <div class="shop_title"><a class="evaluate cltk_click" data-cltk-id="data-cltk-id_6167"
                                href="#"><img src="https://statics.marry.com.tw/img/public/selected.svg">
                                5.0&nbsp;<span class="evaluate_counts">(3)</span></a><span class="shop_work_wrap">
                                <a class="shop_work cltk_click" data-cltk-id="data-cltk-id_6167" href="#">廳房 4</a>
                                <a class="shop_work cltk_click" data-cltk-id="data-cltk-id_6167" href="#">方案&nbsp;4</a>

                            </span></div>
                        <ul class="tag_row">
                        </ul>
                        <div class="shop_add">
                            <img src="https://statics.marry.com.tw/img/public/vendorprofile/location_gray_20.svg"><span>
                                台北市&nbsp;中正區</span>
                        </div>
                    </li>
                </ul>
         	}       
         }
         
      }

window.addEventListener('load', init);