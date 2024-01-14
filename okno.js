document.querySelector("form").addEventListener("submit", function(event) {
  event.preventDefault();
  
  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const telephone = document.getElementById("telephone").value;
  const date = document.getElementById("date").value;
  
  const reservationInfo = document.getElementById("reservation-info");
  reservationInfo.textContent = `Вы предварительно забронировали время на ${date}. Ваше имя: ${name}, ваш email: ${email}, ваш телефон: ${telephone}.`;

  // Создание XMLHttpRequest объекта
  const xhr = new XMLHttpRequest();
  
  // Отправка POST запроса к серверу, обрабатывающему данные формы
  xhr.open("POST", "обработчик_формы.php", true);
  
  // Установка заголовка запроса
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  
  // Отправка данных формы в формате URL-кодирования
  xhr.send(`name=${encodeURIComponent(name)}&email=${encodeURIComponent(email)}&telephone=${encodeURIComponent(telephone)}&date=${encodeURIComponent(date)}`);
});
  