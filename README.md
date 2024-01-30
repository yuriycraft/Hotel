# Прототип мобильного приложения для туристического бронирования
# Прототип мобильного приложения для туристического бронирования

<img src="https://github.com/yuriycraft/Hotel/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20-%202024-01-30%20at%2015.36.15.gif" alt="Превью приложения" height="400" /> <img src="https://github.com/yuriycraft/Hotel/blob/main/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-01-30%20at%2015.19.33.png" alt="Превью приложения" height="400" /> <img src="https://github.com/yuriycraft/Hotel/blob/main/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-01-30%20at%2015.19.41.png" alt="Превью приложения" height="400" /> <img src="https://github.com/yuriycraft/Hotel/blob/main/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-01-30%20at%2015.19.51.png" alt="Превью приложения" height="400" />

## Структура приложения

- **HotelScreen:** Экран, отображающий информацию о выбранном отеле. Включает в себя карусель фотографий, основные и подробные данные об отеле, а также кнопку выбора номера.

- **RoomScreen:** Экран с выбором номера, открывающийся после выбора отеля на экране отеля. Включает в себя навигационную панель, блоки с информацией о номерах и кнопку для перехода к экрану бронирования.

- **ReservationScreen:** Экран для бронирования номера с данными о выбранном отеле и номере. Включает в себя навигационную панель, блоки с информацией о брони, информацией о покупателе, информацией о туристах и итоговой ценой.

- **PaymentScreen:** Экран подтверждения оплаты, открывающийся после успешного бронирования. Включает кнопку "Супер!" для возврата на экран отеля.

## Сценарии использования

### 1. Заполнение номера телефона

- На экране бронирования, пользователь кликает на поле "Номер телефона".
- Автоматически применяется маска +7(***)***-**-**.
- Пользователь начинает вводить номер, начиная с цифры 9.
- Цифра 9 заменяет первую звездочку, и пользователь продолжает ввод.
- Все последующие цифры заменяют соответствующие звездочки.

### 2. Заполнение почты

- На экране бронирования, пользователь кликает на поле "Почта".
- Вводит валидную почту, например, john123@true.com.

### 3. Ввод данных о туристе

- На экране бронирования, пользователь раскрывает вкладку туриста.
- Вводит все необходимые данные.
- Пользователь может добавить еще туристов, нажимая на кнопку "Добавить туриста".

### 4. Оплата брони

- На экране бронирования, пользователь нажимает на кнопку "Оплатить".
- Если все поля заполнены, открывается экран "Оплачено".
- В противном случае, отображается ошибка, и незаполненные поля выделяются цветом ошибки.

## Технологический стек

- **iOS:** Swift
- **Архитектура:** MVVM + Coordinator
- **Фреймворк для пользовательского интерфейса:** SwiftUI
- **Реактивное программирование:** Combine

## Установка и запуск

1. Склонируйте репозиторий на свой локальный компьютер.
2. Откройте проект в Xcode.
3. Выберите симулятор устройства и запустите проект.
