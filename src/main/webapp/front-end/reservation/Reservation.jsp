<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<!DOCTYPE html>
			<html lang="zh-Hant">

			<head>

				<!-- 引入JQUERY -->
				<!-- <script src="js/reservation.js"></script> -->
				<link rel="stylesheet" type="text/css" href="css/reservation.css">
			</head>


			<body>

				<div id="pop">
					<div class="pop-casemain radius_3">


						<h3 class="title_center">
							預約賞廳 <a class="close" href="javascript:void('0');" onclick="destroyObj();tb_remove();">X</a>
						</h3>
						<div id="reserve_form" class="pop-casemain-inner">
							<div class="form_wrap">
								<div class="pop_accentArea_wrap">
									<!-- <div class="pop_accentArea_title"><img
                                src="https://statics.marry.com.tw/img/icon/tips_doubt_yellow.svg">
                            <p>為什麼要透過結婚吧預約賞廳？</p>
                        </div> -->

								</div>

								<a class="venueInfo" target="_blank" href="跳轉到場商頁面"><span class="venueInfo_pic"> <img
											src="https://imgs.gvm.com.tw/upload/gallery/20221204/125075.jpg"></span>
									<span class="venueInfo_content"> <span class="venueVendor">貓咪怕怕會館</span>
									</span> <span class="showMore"> <img
											src="https://statics.marry.com.tw/img/icon/arrow_SolidGray55.png">
									</span> </a>

								<form id="venueReserve_form" class="venueReserve_form">

									<span><i>*</i>廠商</span> <span class="sattus" style="display: none;"></span> <input
										class="form_input input_code" type="text" value="vendor9@gmail.com"
										name="vendor_id" id="vendor_id" placeholder="廠商ID" autocomplete="off">
									<span><i>*</i>會員</span>
									<span class="sattus" style="display: none;"></span> <input
										class="form_input input_code" type="text" value="member8@gmail.com"
										name="member_id" id="member_id" placeholder="會員ID" autocomplete="off">
									<span><i>*</i>預約大名</span>
									<span class="sattus" style="display: none;"></span> <input
										class="form_input input_code" type="text" value="KEN" name="contact_name"
										id="contact_name" placeholder="輸入名字" autocomplete="off">
									<span><i>*</i>聯絡電話</span> <span class="sattus" style="display: none;"></span> <input
										class="form_input input_code" type="text" value="0912345678"
										name="contact_number" id="contact_number" placeholder="輸入電話" autocomplete="off"
										maxlength="10">

									<div class="form_wrap_half">
										<span>宴客日期</span> <span class="sattus" style="display: none;"></span>
										<input class="form_input input_code datepicker hasDatepicker" rel_status="2"
											type="date" value="" placeholder="預計婚期" id="event_date" name="event_date"
											autocomplete="off">
									</div>

									<div class="form_wrap_half">
										<span> <i>*</i>宴客時段
										</span> <span class="sattus" style="display: none;"></span> <select
											class="form_select input_code" id="event_hi" name="event_hi">
											<option value="">選擇預約時段</option>
											<option value="12:00:00">中午</option>
											<option value="18:00:00">晚上</option>
										</select>
									</div>



									<div class="form_wrap_half">
										<span> <i>*</i>預約日期
										</span> <span class="sattus" style="display: none;"></span> <input
											class="form_input m_r_8 input_code form_select datepicker hasDatepicker"
											type="date" value="" placeholder="選擇預約日期" id="reservation_date"
											name="reservation_date" autocomplete="off">
									</div>

									<div class="form_wrap_half">
										<span> <i>*</i>預約時段
										</span> <span class="sattus" style="display: none;"></span> <select
											class="form_select input_code" id="reservation_hi" name="reservation_hi">
											<option value="">選擇預約時段</option>
											<option value="12:00:00">12:00</option>
											<option value="12:30:00">12:30</option>
											<option value="13:00:00">13:00</option>
											<option value="13:30:00">13:30</option>
											<option value="14:00:00">14:00</option>
											<option value="14:30:00">14:30</option>
											<option value="15:00:00">15:00</option>
											<option value="15:30:00">15:30</option>
											<option value="16:00:00">16:00</option>
											<option value="16:30:00">16:30</option>
											<option value="17:00:00">17:00</option>
											<option value="17:30:00">17:30</option>
											<option value="18:00:00">18:00</option>
											<option value="18:30:00">18:30</option>
											<option value="19:00:00">19:00</option>
											<option value="19:30:00">19:30</option>
											<option value="20:00:00">20:00</option>
										</select>
									</div>

									<span>備註</span>
									<textarea class="form_input input_note" type="text" name="reservation_notes"
										id="reservation_notes" placeholder="其他事項" autocomplete="off"></textarea>
							
								</form>
							</div>
							<div class="btnArea">
								<a class="submitBtn data-g-reserve-pop-form-send" href="javascript:;"
									id="submitReservation">確認送出 </a>
							</div>
						</div>
					</div>
				</div>


				<script>


					var btnArea = document.querySelector("#submitReservation");

					btnArea.addEventListener('click', function (event) {
						event.preventDefault();
						var vendorId = document.querySelector("#vendor_id").value.trim();
						var memberId = document.querySelector("#member_id").value.trim();
						var contactName = document.querySelector("#contact_name").value.trim();
						var contactNumber = document.querySelector("#contact_number").value.trim();
						var reservationNotes = document.querySelector("#reservation_notes").value.trim();



						// 獲取日期和時間的輸入值
						var eventDateO = document.querySelector("#event_date").value;;
						var eventTime = document.querySelector("#event_hi").value;


						var selectedDate = document.querySelector("#reservation_date").value;
						var selectedTime = document.querySelector("#reservation_hi").value;

						// 將日期和時間合並為完整的值
						var eventDate = (eventDateO && (eventDateYear >= 1000 && eventDateYear <= 9999)) ? eventDateO + " " + eventTime : '2017-01-18 16:00:00';
						var reservationDate = selectedDate + " " + selectedTime;
						
					
						if (contactName === "") {
						    alert("請輸入名稱");
						    retuen;
						}
						if (contactNumber.length != 10) {
						    alert("請輸入電話");
						    return;
						}
						if (reservationDate.trim() === "") {
						    alert("請輸入預約日期");
						    return;
						} 
						
						var data = {
							vendorId: vendorId,
							memberId: memberId,
							contactName: contactName,
							contactNumber: contactNumber,
							eventDate: eventDate,
							reservationNotes: reservationNotes,
							reservationDate: reservationDate,
							funcName: "insertR",
						};
						



<<<<<<< HEAD
						fetch('/marryme/reservation', {
=======
						fetch('/marryMe/reservation', {
>>>>>>> d5af96d7be687fd235c20e294eafc8492a5eae7e
							method: 'POST',
							headers: {
								'Content-Type': 'application/json',
							},
							body: JSON.stringify(data),
						})
							.then(response => {
								if (!response.ok) {
									throw new Error(`HTTP error! status: ${response.status}`);
								} else {
									return response.text()
								}
							})
							.then(data => {
								try {
									return JSON.parse(data);
								} catch {
									console.error("This is not JSON format", data);
									return {};
								}
							})
							.then(data => console.log(data))
							.catch(error => console.log('Error:', error));
					});

					function init() {

					}








				</script>

			</body>

			</html>