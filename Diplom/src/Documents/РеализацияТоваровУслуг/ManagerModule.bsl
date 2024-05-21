
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда
    
    #Область ПрограммныйИнтерфейс
    
    Функция ДобавитьКомандуСоздатьНаОсновании(КомандыСозданияНаОсновании) Экспорт
        
        Если ПравоДоступа("Добавление", Метаданные.Документы.РеализацияТоваровУслуг) Тогда
            
            КомандаСоздатьНаОсновании = КомандыСозданияНаОсновании.Добавить();
            КомандаСоздатьНаОсновании.Менеджер = Метаданные.Документы.РеализацияТоваровУслуг.ПолноеИмя();
            КомандаСоздатьНаОсновании.Представление = ОбщегоНазначения.ПредставлениеОбъекта(Метаданные.Документы.РеализацияТоваровУслуг);
            КомандаСоздатьНаОсновании.РежимЗаписи = "Проводить";
            
            Возврат КомандаСоздатьНаОсновании;
            
        КонецЕсли;
        
        Возврат Неопределено;
        
    КонецФункции   
    
        //ВКМ 12.04.2024 {  
    Процедура ДобавитьКомандыПечати(КомандыПечати) Экспорт
        
        КомандаПечати = КомандыПечати.Добавить(); 
        КомандаПечати.Идентификатор = "АктОбОказанныхУслугах";
        КомандаПечати.Представление = НСтр("ru = 'Акт об оказанных услугах'");
        КомандаПечати.Порядок = 5; 
        
    КонецПроцедуры  
    
    Процедура Печать(МассивОбъектов, ПараметрыПечати, КоллекцияПечатныхФорм, ОбъектыПечати, ПараметрыВывода) Экспорт
        
        ПечатнаяФорма = УправлениеПечатью.СведенияОПечатнойФорме(КоллекцияПечатныхФорм,"АктОбОказанныхУслугах");
        Если ПечатнаяФорма <> Неопределено Тогда
            ПечатнаяФорма.ТабличныйДокумент = ПечатьЗаказа(МассивОбъектов, ОбъектыПечати); 
            ПечатнаяФорма.СинонимМакета = НСтр("ru = 'Акт об оказанных услугах'");
            ПечатнаяФорма.ПолныйПутьКМакету = "Документ.РеализацияТоваровУслуг.ВКМ_ПФ_MXL_АктОбОказанныхУслугах";
        КонецЕсли;
        
    КонецПроцедуры   
    
    // } ВКМ 12.04.2024
    
    #КонецОбласти  
    
    
    // ВКМ 12.04.2024 { 
    #Область СлужебныеПроцедурыИФункции
    
    Функция ПечатьЗаказа(МассивОбъектов, ОбъектыПечати)
        
        ТабличныйДокумент = Новый ТабличныйДокумент; 
        ТабличныйДокумент.КлючПараметровПечати = "ПараметрыПечати_АктОбОказанныхУслугах";
        
        Макет = УправлениеПечатью.МакетПечатнойФормы("Документ.РеализацияТоваровУслуг.ВКМ_ПФ_MXL_АктОбОказанныхУслугах"); 
        
        ДанныеДокументов = ПолучитьДанныеДокументов (МассивОбъектов);      
        
        ПервыйДокумент = Истина;
        
        Пока ДанныеДокументов.Следующий() Цикл
            
            Если Не ПервыйДокумент Тогда
                // Все документы нужно выводить на разных страницах.
                ТабличныйДокумент.ВывестиГоризонтальныйРазделительСтраниц();
            КонецЕсли;
            
            НомерСтрокиНачало = ТабличныйДокумент.ВысотаСтраницы + 1; 
            ВывестиРеквизитыСторон(ДанныеДокументов, ТабличныйДокумент, Макет); 
            ВывестиЗаголовокЗаказа(ДанныеДокументов, ТабличныйДокумент, Макет);
            ВывестиУслуги(ДанныеДокументов, ТабличныйДокумент, Макет);
            ВывестиПодвалЗаказа(ДанныеДокументов, ТабличныйДокумент, Макет);   
            
            УправлениеПечатью.ЗадатьОбластьПечатиДокумента(ТабличныйДокумент, 
            НомерСтрокиНачало, ОбъектыПечати, ДанныеДокументов.Ссылка);	
            
        КонецЦикла;  
        
        Возврат ТабличныйДокумент;
        
    КонецФункции // ()   
    
    Функция ПолучитьДанныеДокументов (МассивОбъектов)
        
        Запрос = Новый Запрос;
        Запрос.Текст = 
        "ВЫБРАТЬ
        |   РеализацияТоваровУслуг.Ссылка КАК Ссылка,
        |   РеализацияТоваровУслуг.Номер КАК Номер,
        |   РеализацияТоваровУслуг.Дата КАК Дата,
        |   РеализацияТоваровУслуг.Организация КАК Организация,
        |   РеализацияТоваровУслуг.Контрагент КАК Контрагент,
        |   РеализацияТоваровУслуг.Договор КАК Договор,
        |   РеализацияТоваровУслуг.Ответственный КАК Ответственный,
        |   РеализацияТоваровУслуг.Услуги.(
        |       Ссылка КАК Ссылка,
        |       НомерСтроки КАК НомерСтроки,
        |       Номенклатура КАК Номенклатура,
        |       Количество КАК Количество,
        |       Цена КАК Цена,
        |       Сумма КАК Сумма
        |   ) КАК Услуги
        |ИЗ
        |   Документ.РеализацияТоваровУслуг КАК РеализацияТоваровУслуг
        |ГДЕ
        |   РеализацияТоваровУслуг.Ссылка В(&МассивОбъектов)";
        
        Запрос.УстановитьПараметр("МассивОбъектов", МассивОбъектов);
        
        РезультатЗапроса = Запрос.Выполнить();
        
        ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
        
        Возврат ВыборкаДетальныеЗаписи; 
        
    КонецФункции // ()
    
    Процедура ВывестиРеквизитыСторон(ДанныеДокументов, ТабличныйДокумент, Макет)
        
        ОбластьПоставщик = Макет.ПолучитьОбласть("Поставщик"); 
        ОбластьПокупатель = Макет.ПолучитьОбласть("Покупатель"); 
        
        ДанныеПечати = Новый Структура; 
        ДанныеПечати.Вставить("ПредставлениеПоставщика", ДанныеДокументов.Организация); 
        ДанныеПечати.Вставить("ПредставлениеПокупателя", ДанныеДокументов.Контрагент); 
        ДанныеПечати.Вставить("Основание", ДанныеДокументов.Договор); 
        
        ОбластьПоставщик.Параметры.Заполнить(ДанныеПечати); 
        ТабличныйДокумент.Вывести(ОбластьПоставщик); 
        
        ОбластьПокупатель.Параметры.Заполнить(ДанныеПечати); 
        ТабличныйДокумент.Вывести(ОбластьПокупатель); 
        
    КонецПроцедуры
    
    Процедура ВывестиЗаголовокЗаказа(ДанныеДокументов, ТабличныйДокумент, Макет)
        
        ОбластьЗаголовокДокумента = Макет.ПолучитьОбласть("Заголовок");
        
        ДанныеПечати = Новый Структура;
        
        ШаблонЗаголовка = "Акт об оказанных услугах %1 от %2";
        ТекстЗаголовка = СтрШаблон(ШаблонЗаголовка,
        ПрефиксацияОбъектовКлиентСервер.НомерНаПечать(ДанныеДокументов.Номер),
        Формат(ДанныеДокументов.Дата, "ДЛФ=DD"));
        ДанныеПечати.Вставить("ТекстЗаголовка", ТекстЗаголовка);
        
        ОбластьЗаголовокДокумента.Параметры.Заполнить(ДанныеПечати);
        ТабличныйДокумент.Вывести(ОбластьЗаголовокДокумента);
        
    КонецПроцедуры
    
    Процедура ВывестиУслуги(ДанныеДокументов, ТабличныйДокумент, Макет)
        
        ОбластьШапкаТаблицы = Макет.ПолучитьОбласть("ШапкаТаблицы");
        ОбластьСтрока = Макет.ПолучитьОбласть("Строка");
        ОбластьПодвал = Макет.ПолучитьОбласть("Подвал");
        ОбластьИтого = Макет.ПолучитьОбласть("Итого"); 
        ОбластьСуммаПрописью = Макет.ПолучитьОбласть("СуммаПрописью");
        
        ТабличныйДокумент.Вывести(ОбластьШапкаТаблицы);
        
        СуммаУслугИтого = 0;//? 
        
        ВыборкаУслуги = ДанныеДокументов.Услуги.Выбрать();
        Пока ВыборкаУслуги.Следующий() Цикл
            ОбластьСтрока.Параметры.Заполнить(ВыборкаУслуги);
            ТабличныйДокумент.Вывести(ОбластьСтрока);
            СуммаУслугИтого = СуммаУслугИтого + ВыборкаУслуги.Сумма;
        КонецЦикла;
        
        СуммаПрописью = ЧислоПрописью(СуммаУслугИтого, "Л = ru_RU; ДП = Истина", "рубль, рубля, рублей, м, копейка, копейки, копеек, ж, 2");
        
        ТабличныйДокумент.Вывести(ОбластьПодвал);
        
        ДанныеПечати = Новый Структура;
        ДанныеПечати.Вставить("Всего", СуммаУслугИтого);
        ДанныеПечати.Вставить("СуммаПрописью", СуммаПрописью);
        
        ОбластьИтого.Параметры.Заполнить(ДанныеПечати);
        ТабличныйДокумент.Вывести(ОбластьИтого); 
        
        ОбластьСуммаПрописью.Параметры.Заполнить(ДанныеПечати);
        ТабличныйДокумент.Вывести(ОбластьСуммаПрописью);
        
    КонецПроцедуры
    
    Процедура ВывестиПодвалЗаказа(ДанныеДокументов, ТабличныйДокумент, Макет)
        
        ОбластьПодвалЗаказа = Макет.ПолучитьОбласть("ПодвалЗаказа"); 
        
        ТабличныйДокумент.Вывести(ОбластьПодвалЗаказа); 
        
    КонецПроцедуры
    
    #КонецОбласти  
    // } ВКМ 12.04.2024 
    
    
#КонецЕсли