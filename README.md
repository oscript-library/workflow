# workflow

[![Stars](https://img.shields.io/github/stars/khorevaa/workflow.svg?label=Github%20%E2%98%85&a)](https://github.com/khorevaa/workflow/stargazers)
[![Release](https://img.shields.io/github/tag/khorevaa/workflow.svg?label=Last%20release&a)](https://github.com/khorevaa/workflow/releases)
[![Открытый чат проекта https://gitter.im/EvilBeaver/oscript-library](https://badges.gitter.im/khorevaa/workflow.png)](https://gitter.im/EvilBeaver/oscript-library)

[![Build Status](https://travis-ci.org/khorevaa/workflow.svg?branch=master)](https://travis-ci.org/khorevaa/workflow)
[![Coverage Status](https://coveralls.io/repos/github/khorevaa/workflow/badge.svg?branch=master)](https://coveralls.io/github/khorevaa/workflow?branch=master)

# Библиотека для workflow

> Короткое название `workflow`

## Возможности

Данная библиотека предназначена для формирования простых и условых бизнес-процессов выполнения методов в OScript.
Реализует основные классы:
`БизнесПроцесс` - основной класс работы
`ЗадачаБизнесПроцесса` - основная задача бизнес процесса
`УсловиеБизнесПроцесса` - задача с условием бизнес процесса, выполняет в зависимости от условия разные ветки бизнес процесса (по факту вложенные бизнес процессы)

## Установка

Для установки необходимо:
* Скачать файл workflow*.ospx из раздела [releases](https://github.com/khorevaa/workflow/releases)
* Воспользоваться командой:

```
opm install -f <ПутьКФайлу>
```
или установить с хаба пакетов

```
opm install workflow
```

## Пример работы

* Выполнение задач с использованием нескольких задач
```bsl

	БизнесПроцесс = Новый БизнесПроцесс("Тестовый бизнес процесс");
	БизнесПроцесс.ДобавитьЗадачу("Задача1", ЭтотОбъект, "ПроцедураБезПараметров");
	БизнесПроцесс.ДобавитьЗадачу("Задача2", ЭтотОбъект, "ПроцедураБезПараметров");
	БизнесПроцесс.ДобавитьЗадачу("Задача3", ЭтотОбъект, "ПроцедураБезПараметров");
	БизнесПроцесс.Запустить();

	Ожидаем.Что(БизнесПроцесс.Завершен(), "Бизнес процесс должен быть завершен").ЕстьИстина();

```

* Выполнение задач с использованием общего контекста
```bsl

	МассивПараметровЗадачи = Новый Массив();
	МассивПараметровЗадачи.Добавить("Параметр1ИзМассива");

	КонтекстВыполнения = БизнесПроцессы.НовыйКонтекстВыполнения();

	БизнесПроцесс = Новый БизнесПроцесс("Тестовый бизнес процесс");
	БизнесПроцесс.ДобавитьЗадачу("Задача1", ЭтотОбъект, "ПроцедураПомещенияВКонтекстЗначения", МассивПараметровЗадачи, КонтекстВыполнения);
	БизнесПроцесс.ДобавитьЗадачу("Задача2", ЭтотОбъект, "ПроцедураПолученияИзКонтекстаЗначения", МассивПараметровЗадачи, КонтекстВыполнения);
	БизнесПроцесс.Запустить();

```

* Выполнение задач с условием выполнения
```bsl

	МассивПараметровЗадачи = Новый Массив();
	МассивПараметровЗадачи.Добавить(Истина);

	БизнесПроцесс = Новый БизнесПроцесс("Тестовый бизнес процесс");
	КонтекстБизнесПроцесса = БизнесПроцесс.ПолучитьКонтекст();
	БизнесПроцесс.ДобавитьЗадачу("Задача1", ЭтотОбъект, "ПроцедураСКонтекстом", МассивПараметровЗадачи, КонтекстБизнесПроцесса);
	Условие1 = БизнесПроцесс.НовоеУсловие("Условие1");

	МассивПараметровЗадачи = Новый Массив();
	МассивПараметровЗадачи.Добавить(Ложь);
	Условие1.ДляЗначения(Истина).ДобавитьЗадачу("ЗадачаИстины", ЭтотОбъект, "ПроцедураСКонтекстом", МассивПараметровЗадачи, КонтекстБизнесПроцесса);
    Условие1.ПоУмолчанию().ДобавитьЗадачу("ЗадачаПоУмолчанию", ЭтотОбъект, "ПроцедураСКонтекстомПоУмолчанию", МассивПараметровЗадачи, КонтекстБизнесПроцесса);

	БизнесПроцесс.Запустить();

```

## Публичный интерфейс

[Документация публичного интерфейса (в разработке)](docs/README.md)

## Доработка

Доработка проводится по git-flow. Жду ваших PR.

## Лицензия

Смотри файл [`LICENSE`](LICENSE).
