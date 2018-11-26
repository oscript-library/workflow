#использовать "../src"
#Использовать asserts
#Использовать logos

Перем юТест;
Перем Лог;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;

	ИменаТестов = Новый Массив;

	// ИменаТестов.Добавить("ТестДолжен_ВывестиГрафВыполненияПростогоБизнесПроцесса");
	// ИменаТестов.Добавить("ТестДолжен_ВывестиГрафВыполненияБизнесПроцессаСУсловием");
	
	Возврат ИменаТестов;

КонецФункции

Процедура ТестДолжен_ВывестиГрафВыполненияПростогоБизнесПроцесса() Экспорт

	МассивПараметровЗадачи = Новый Массив();
	МассивПараметровЗадачи.Добавить(Истина);

	БизнесПроцесс = Новый БизнесПроцесс("Тестовый бизнес процесс");
	КонтекстБизнесПроцесса = БизнесПроцесс.ПолучитьКонтекст();
	БизнесПроцесс.ДобавитьЗадачу("Задача1", ЭтотОбъект, "ПроцедураСКонтекстом", МассивПараметровЗадачи, КонтекстБизнесПроцесса);
	Условие1 = БизнесПроцесс.НовоеУсловие("Условие1");

	МассивПараметровЗадачи = Новый Массив();
	МассивПараметровЗадачи.Добавить(Ложь);
	Условие1.ДляЗначения(Истина).ДобавитьЗадачу("ЗадачаИстины", ЭтотОбъект, "ПроцедураСКонтекстом", МассивПараметровЗадачи, КонтекстБизнесПроцесса);

	
	БизнесПроцесс.НапечататьГрафВыполнения();
	
	// Ожидаем.Что(БизнесПроцесс.Завершен(), "Бизнес процесс должен быть завершен").ЕстьЛожь();
	// Ожидаем.Что(КонтекстБизнесПроцесса.Получить("Условие1"), "Бизнес процесс должен быть завершен").ЕстьЛожь();

КонецПроцедуры

Процедура ПроцедураСКонтекстом(КонтекстВыполнения, Условие1) Экспорт
	
	КонтекстВыполнения.Добавить("Условие1", Условие1);

КонецПроцедуры

Процедура ПроцедураСКонтекстомПоУмолчанию(КонтекстВыполнения, Условие1) Экспорт
	
	КонтекстВыполнения.Добавить("Условие2", Условие1);

КонецПроцедуры