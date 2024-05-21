///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

#Область ДляВызоваИзДругихПодсистем

// См. ВариантыОтчетовПереопределяемый.ПередДобавлениемКомандОтчетов.
Процедура ПередДобавлениемКомандОтчетов(КомандыОтчетов, Параметры, СтандартнаяОбработка) Экспорт
	
	Если Не ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ВариантыОтчетов") Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ПравоДоступа("Просмотр", Метаданные.Отчеты.ПраваРолей)
	 Или СтандартныеПодсистемыСервер.ЭтоБазоваяВерсияКонфигурации() Тогда
		Возврат;
	КонецЕсли;
	
	КомандаРоли = КомандыОтчетов.Добавить();
	КомандаРоли.МножественныйВыбор = Истина;
	КомандаРоли.Менеджер = "Отчет.ПраваРолей";
	КомандаРоли.КлючВарианта = "ПраваРолей";
	
	Если СтрНачинаетсяС(Параметры.ИмяФормы, "Справочник.ПрофилиГруппДоступа") Тогда
		КомандаПрофили = КомандыОтчетов.Добавить();
		КомандаПрофили.МножественныйВыбор = Истина;
		КомандаПрофили.Менеджер = "Отчет.ПраваРолей";
		КомандаПрофили.КлючВарианта = "ПраваРолиНаОбъектыМетаданных";
		
		Если Параметры.ИмяФормы = "Справочник.ПрофилиГруппДоступа.Форма.ФормаЭлемента" Тогда
			КомандаРоли.Представление    = НСтр("ru = 'Права ролей профиля'");
			КомандаПрофили.Представление = НСтр("ru = 'Права профиля'");
		Иначе
			КомандаРоли.Представление    = НСтр("ru = 'Права ролей профилей'");
			КомандаПрофили.Представление = НСтр("ru = 'Права профилей'");
		КонецЕсли;
	Иначе
		КомандаРоли.Представление = НСтр("ru = 'Права ролей и профилей'");
		КомандаРоли.ТолькоВоВсехДействиях = Истина;
		КомандаРоли.Важность = "СмТакже";
		КомандаРоли.КлючВарианта = "ПраваРолейНаОбъектМетаданных";
	КонецЕсли;
	
КонецПроцедуры

// Параметры:
//   Настройки - см. ВариантыОтчетовПереопределяемый.НастроитьВариантыОтчетов.Настройки.
//   НастройкиОтчета - см. ВариантыОтчетов.ОписаниеОтчета.
//
Процедура НастроитьВариантыОтчета(Настройки, НастройкиОтчета) Экспорт
	
	Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ВариантыОтчетов") Тогда
		МодульВариантыОтчетов = ОбщегоНазначения.ОбщийМодуль("ВариантыОтчетов");
	Иначе
		Возврат;
	КонецЕсли;
	
	МодульВариантыОтчетов.УстановитьРежимВыводаВПанеляхОтчетов(Настройки, НастройкиОтчета, Ложь);
	НастройкиОтчета.ОпределитьНастройкиФормы = Истина;

	НастройкиВарианта = МодульВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "ПраваРолей");
	НастройкиВарианта.Описание = НСтр("ru = 'Показывает права ролей на объекты метаданных.'");
	НастройкиВарианта.ВидимостьПоУмолчанию = Ложь;
	
	НастройкиВарианта = МодульВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "ПраваРолиНаОбъектыМетаданных");
	НастройкиВарианта.Включен = Ложь;

	НастройкиВарианта = МодульВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "ПраваРолейНаОбъектМетаданных");
	НастройкиВарианта.Включен = Ложь;

	НастройкиВарианта = МодульВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "ПодробныеПраваРолиНаОбъектМетаданных");
	НастройкиВарианта.Включен = Ложь;
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецЕсли
