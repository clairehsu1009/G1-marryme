//實現上傳圖片可以預覽所上傳的圖片,若重新上傳其他圖片,可以移除舊的圖片預覽,只顯示最新的狀態

let myFile = document.getElementById("image");
let preview = document.getElementById('preview');
let oldimg = document.getElementById('oldimg');

function init() {
	myFile.addEventListener('change', function(e) {
		$("#preview").empty();
		let files = e.target.files;
		if (files !== null) {
			let file = files[0];
			if (file.type.indexOf('image') > -1) {
				let reader = new FileReader();
				reader.addEventListener('load', function(e) {
					let result = e.target.result;
					let img = document.createElement('img');
					img.src = result;
					img.style.maxWidth = '100%';
					img.style.maxHeight = '100%';
					preview.append(img);
					oldimg.remove();
				});
				reader.readAsDataURL(file);
			} else {
				alert('請上傳圖片！');
			}
		}
	});
}

window.onload = init;