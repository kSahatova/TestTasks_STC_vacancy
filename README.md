# Задание 1. Реализация простого ситезатора частот

*Входные данные :*   набор частот в звуковом диапазоне, частота дискретизации, продолжительность сигнала в секундах.

*Выходные данные :*  сигнал синтезированных частот (тип данных - int16)

*Используемый алгоритм :* Алгоритм Карплуса-Стронга

Алгоритм используется для синтеза звука, похожего на звук струны, извлекаемый медиатором или тэппингом, либо на звуки некоторых ударных инструментов в зависимости от входных параметров и параметров фильтра. В оригинальном алгоритме фильтр состоял из усреднителя двух смежных отсчетов, поскольку такой фильтр позволяет обойтись без умножителя и использовать только операции сложения и битового сдвига. Характеристики фильтра являются определяющими для гармонической структуры затухающего сигнала.

Для реализации данного алгоритма был сформирован набор опорных частот f0 в диапазоне от 392 Гц до 92 Гц. Исходя из частоты дискретизации и опорной частоты, сформирован вектор задержек delay в функции karplus_strong, где также посчитан выходной вектор для каждой из частот путем усреднения соседних значений входного сигнала в виде белого шума с величиной задержки. Значение задержки напрямую связано с отношением частоты дискретизации к опорной частоте и рассчитывается по соответствующей формуле. Полученные значения аккорда приводятся к типу int16 и записываются в файл output.txt.          

# Задание 2. Реализация метода МНК

*Входные данные :*   набор зашуленных сгенерированных значений

*Выходные данные :* функция, полином 5й степени, аппроксимирующая исходные данные

Метод наименьших квадратов является наиболее распространенным  для оценки параметров модели  путем минимизации функционала невязки между модельными и фактическими данными. В приведенных файлах метод реализован в матричной форме, где решается уравнение
*betta = [A' * A]^(-1) * A' * y* ,
где *betta* - вектор оценок параметров,
*А* - матрица, составленная из входных значений на объект, 
*y* - выходные значения.
