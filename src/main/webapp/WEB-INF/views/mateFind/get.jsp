<script>
	let dayElement = doucument.getElementById('Date');
	let day = new Date(new Date().getTime() 
			- new Date().getTimezoneOffset()* 60000).toISOString().slice(0, 5);
	dayElement.value = day;
	dayElement.setAttribute("day", day);

	let dateElement = document.getElementById('mtime');
	let date = new Date(new Date().getTime()
			- new Date().getTimezoneOffset() * 60000).toISOString().slice(11, 16);
	dateElement.value = date;
	dateElement.setAttribute("min", date);

	function setMinValue() {
		if (dayElement.value = day) {
			if (dateElement.value < date) {
				swal("", "번개 모임시간은 이전 시간에 모집할 수 없습니다. \n모임시간을 다시 설정해 주세요.",
						"error");
				dateElement.value = date;
			}
		}
	}
</script>