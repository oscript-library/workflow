#использовать "../src"
#Использовать asserts
#Использовать logos

Перем юТест;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;

	ИменаТестов = Новый Массив;

	ИменаТестов.Добавить("ТестДолжен_ПроверитьРаботуКласса");


	Возврат ИменаТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьРаботуКласса() Экспорт

	// Утверждения.ПроверитьРавенство(МеткаВремени, 1514764800, "Полученные числа должны быть равны");

	НоваяЗадача = Новый ЗадачаПроцесса;
	ЗадачаПередВыполнением = Новый ЗадачаПроцесса;
	ЗадачаПослеВыполнения = Новый ЗадачаПроцесса;
	ЗадачаПриОшибке = Новый ЗадачаПроцесса;


	НоваяЗадача.ПередВыполнением(НоваяЗадачаПередВыполнением)
			   .ПослеВыполнения(ЗадачаПослеВыполнения)
			   .ПриОшибке(ЗадачаПриОшибке)
			   .ПриУспешномВыполнении(СледующаяЗадача)
			   .Следующая(СледующаяЗадача)
			   ;


КонецПроцедуры




