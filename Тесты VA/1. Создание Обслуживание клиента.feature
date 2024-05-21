﻿#language: ru

@tree

Функционал: Создание трех обслуживаний на специалистов от имени Менеджера

Как тестировщик я хочу
показать процесс создания простого сценария тестирования 
чтобы разобрать процесс созданий обслуживаний    

Сценарий: Создание трех обслуживаний на специалистов от имени Менеджера
  			И я подключаю TestClient "УправлениеITФирмой" логин "Менеджер" пароль ""
    	И В командном интерфейсе я выбираю 'Добавленные объекты' 'Обслуживание клиента'
Тогда открылось окно 'Обслуживание клиента'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Обслуживание клиента (создание)'
И я нажимаю кнопку выбора у поля с именем "Клиент"
Тогда открылось окно 'Контрагенты'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000001' | 'ООО "Бигуди"' |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "Договор"
Тогда открылось окно 'Договоры контрагентов'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000001' | 'Основной'     |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "Специалист"
Тогда открылось окно 'Сотрудники'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000001' | 'Петров'       |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '08.05.2024'
И в поле с именем 'ВремяНачалаРабот' я ввожу текст ' 9:00:00'
И в поле с именем 'ВремяОкончанияРабот' я ввожу текст '11:00:00'
И в поле с именем 'ОписаниеПроблемы' я ввожу текст 'Диагностика'
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд
Тогда открылось окно 'Обслуживание клиента'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Обслуживание клиента (создание)'
И я нажимаю кнопку выбора у поля с именем "Клиент"
Тогда открылось окно 'Контрагенты'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование'          |
	| '000000004' | 'ООО "Френч Косметикс"' |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "Договор"
Тогда открылось окно 'Договоры контрагентов'
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "Специалист"
Тогда открылось окно 'Сотрудники'
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '08.05.2024'
И в поле с именем 'ВремяНачалаРабот' я ввожу текст ' 9:30:00'
И в поле с именем 'ВремяОкончанияРабот' я ввожу текст '11:30:00'
И в поле с именем 'ОписаниеПроблемы' я ввожу текст 'Устранить проблему'
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд
Тогда открылось окно 'Обслуживание клиента'
И я нажимаю на кнопку с именем 'ФормаСоздать'
Тогда открылось окно 'Обслуживание клиента (создание)'
И из выпадающего списка с именем "Клиент" я выбираю точное значение 'АО "Пятерочка"'
И я нажимаю кнопку выбора у поля с именем "Договор"
Тогда открылось окно 'Договоры контрагентов'
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "Специалист"
Тогда открылось окно 'Сотрудники'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000002' | 'Сидоров'      |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Обслуживание клиента (создание) *'
И я нажимаю кнопку выбора у поля с именем "ДатаПроведенияРабот"
И в поле с именем 'ДатаПроведенияРабот' я ввожу текст '08.05.2024'
И в поле с именем 'ВремяНачалаРабот' я ввожу текст '10:00:00'
И в поле с именем 'ВремяОкончанияРабот' я ввожу текст '12:00:00'
И в поле с именем 'ОписаниеПроблемы' я ввожу текст 'Знакомство'
И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
И я жду закрытия окна 'Обслуживание клиента (создание) *' в течение 20 секунд
		* И я проверяю наличие новых строк в "Обслуживание клиента"
			И таблица "Список" содержит строки: 
				| 'Клиент'               | 'Договор'    |'Специалист'|'Начало'  |'Окончание'|'Описание проблемы' |
				| 'ООО "Бигуди"'         | 'Основной'   |'Петров'    |'9:00:00' |'11:00:00 '|'Диагностика'       |
				| 'ООО "Френч Косметикс"'| '№1'         |'Иванов'    |'9:30:00' |'11:30:00 '|'Устранить проблему'|
				| 'АО "Пятерочка"'       | '05052024'   |'Сидоров'   |'10:00:00'|'12:00:00 '|'Знакомство'        |
