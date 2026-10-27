--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

-- Started on 2026-10-27 23:09:27 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3654 (class 0 OID 17447)
-- Dependencies: 216
-- Data for Name: cinemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cinemas (id, "Название", "Адрес", "Телефон") FROM stdin;
1	Кинотеатр Аврора	Невский проспект, 60	+7 (812) 123-45-67
2	Кинотеатр Кронверк Синема	Кронверкский проспект, 31	+7 (812) 234-56-78
3	Кинотеатр Синема Парк	Улица Заставская, 6	+7 (812) 345-67-89
4	Кинотеатр Балтийский	Улица Марата, 2	+7 (812) 456-78-90
5	Кинотеатр Октябрь	Греческий проспект, 3	+7 (812) 567-89-01
6	Кинотеатр Родина	Улица Ленина, 17	+7 (812) 678-90-12
7	Кинотеатр Сказка	Улица Восстания, 5	+7 (812) 789-01-23
8	Кинотеатр Маяк	Улица Рубинштейна, 24	+7 (812) 890-12-34
9	Кинотеатр Пионер	Улица Фучика, 15	+7 (812) 901-23-45
10	Кинотеатр Невский	Невский проспект, 100	+7 (812) 012-34-56
\.


--
-- TOC entry 3656 (class 0 OID 17465)
-- Dependencies: 218
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, "Название", "Год выхода", "Жанр", "Режисер", "Рейтинг") FROM stdin;
1	Начало	2010-07-16	Фантастика	Кристофер Нолан	8.8
2	Побег из Шоушенка	1994-09-23	Драма	Фрэнк Дарабонт	9.3
3	Крестный отец	1972-03-24	Криминал	Фрэнсис Форд Коппола	9.2
4	Криминальное чтиво	1994-10-14	Криминал	Квентин Тарантино	8.9
5	Темный рыцарь	2008-07-18	Экшн	Кристофер Нолан	9
6	Бойцовский клуб	1999-10-15	Драма	Дэвид Финчер	8.8
7	Форрест Гамп	1994-07-06	Драма	Роберт Земекис	8.8
8	Матрица	1999-03-31	Фантастика	Лана Вачовски, Лилли Вачовски	8.7
9	Властелин колец: Возвращение короля	2003-12-17	Фэнтези	Питер Джексон	8.9
10	Гладиатор	2000-05-05	Экшн	Ридли Скотт	8.5
11	Интерстеллар	2014-11-07	Фантастика	Кристофер Нолан	8.6
12	Молчание ягнят	1991-02-14	Триллер	Джонатан Демме	8.6
13	Спасти рядового Райана	1998-07-24	Военный	Стивен Спилберг	8.6
14	Подозрительные лица	1995-08-16	Криминал	Брайан Сингер	8.5
15	Семь	1995-09-22	Триллер	Дэвид Финчер	8.6
16	Отступники	2006-10-06	Криминал	Мартин Скорсезе	8.5
17	Социальная сеть	2010-10-01	Биография, Драма	Дэвид Финчер	7.7
18	Престиж	2006-10-20	Драма, Мистика, Фантастика	Кристофер Нолан	8.5
19	Король Лев	1994-06-15	Анимация, Приключения, Драма	Роджер Аллерс, Роб Минкофф	8.5
20	Назад в будущее	1985-07-03	Приключения, Комедия, Фантастика	Роберт Земекис	8.5
21	Парк юрского периода	1993-06-11	Приключения, Фантастика, Триллер	Стивен Спилберг	8.1
22	Титаник	1997-12-19	Драма, Мелодрама	Джеймс Кэмерон	7.8
23	Аватар	2009-12-18	Экшн, Приключения, Фэнтези	Джеймс Кэмерон	7.8
24	Бешеные псы	1992-09-02	Криминал, Триллер	Квентин Тарантино	8.3
25	Убить Билла: Том 1	2003-10-10	Экшн, Криминал, Триллер	Квентин Тарантино	8.1
26	Бесславные ублюдки	2009-08-21	Приключения, Драма, Военный	Квентин Тарантино	8.3
27	Джанго освобожденный	2012-12-25	Драма, Вестерн	Квентин Тарантино	8.4
28	Однажды в... Голливуде	2019-07-26	Комедия, Драма	Квентин Тарантино	7.6
29	Большой куш	1998-08-28	Комедия, Криминал, Триллер	Гай Ричи	8.2
30	Карты, деньги, два ствола!	2000-01-21	Комедия, Криминал, Триллер	Гай Ричи	8.3
31	Шерлок Холмс	2009-12-25	Экшн, Приключения, Мистика	Гай Ричи	7.6
32	Безумный Макс: Дорога ярости	2015-05-15	Экшн, Приключения, Фантастика	Джордж Миллер	8.1
33	Отель «Гранд Будапешт»	2014-03-28	Приключения, Комедия, Криминал	Уэс Андерсон	7.8
34	Ла Ла Лэнд	2016-12-09	Комедия, Драма, Музыка	Дэмьен Шазелл	8
\.


--
-- TOC entry 3660 (class 0 OID 17493)
-- Dependencies: 222
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, "Дата и время", "Зал", movie_id, cinema_id) FROM stdin;
1	2023-10-01 18:00:00	Зал 1	1	1
2	2023-10-01 20:30:00	Зал 2	2	7
3	2023-10-02 14:00:00	Зал 1	3	6
4	2023-10-02 16:30:00	Зал 3	15	2
5	2023-10-03 19:00:00	Зал 2	4	3
6	2023-10-03 21:15:00	Зал 1	5	9
7	2023-10-04 15:45:00	Зал 3	30	4
8	2023-10-04 18:30:00	Зал 1	15	10
9	2023-10-05 17:00:00	Зал 2	14	5
10	2023-10-05 19:30:00	Зал 3	17	8
11	2023-10-06 20:00:00	Зал 1	4	8
12	2023-10-06 22:15:00	Зал 2	28	6
\.


--
-- TOC entry 3658 (class 0 OID 17478)
-- Dependencies: 220
-- Data for Name: spectators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spectators (id, "Имя", "Фамилия", "E-mail", "Телефон") FROM stdin;
1	Алексей	Иванов	alexey.ivanov@example.com	+7 900 123-45-67
2	Мария	Петрова	maria.petrova@example.com	+7 900 234-56-78
3	Дмитрий	Сидоров	dmitry.sidorov@example.com	+7 900 345-67-89
4	Елена	Кузнецова	elena.kuznetsova@example.com	+7 900 456-78-90
5	Сергей	Семёнов	sergey.semenov@example.com	+7 900 567-89-01
6	Ольга	Михайлова	olga.mikhaylova@example.com	+7 900 678-90-12
7	Игорь	Федоров	igor.fedorov@example.com	+7 900 789-01-23
8	Анна	Соколова	anna.sokolova@example.com	+7 900 890-12-34
9	Павел	Лебедев	pavel.lebedev@example.com	+7 900 901-23-45
10	Татьяна	Егорова	tatiana.egorova@example.com	+7 900 012-34-56
11	Владимир	Николаев	vladimir.nikolaev@example.com	+7 900 123-45-68
12	Наталья	Зайцева	natalya.zaytseva@example.com	+7 900 234-56-79
13	Роман	Григорьев	roman.grigoryev@example.com	+7 900 345-67-80
14	Ксения	Васильева	kseniya.vasilyeva@example.com	+7 900 456-78-91
15	Андрей	Ковалев	andrey.kovalev@example.com	+7 900 567-89-02
16	Светлана	Борисова	svetlana.borisova@example.com	+7 900 678-90-13
17	Константин	Сергеев	konstantin.sergeev@example.com	+7 900 789-01-24
18	Юлия	Морозова	yulia.morozova@example.com	+7 900 890-12-35
19	Денис	Поляков	denis.polyakov@example.com	+7 900 901-23-46
20	Виктория	Крылова	victoria.krylova@example.com	+7 900 012-34-57
\.


--
-- TOC entry 3662 (class 0 OID 17511)
-- Dependencies: 224
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, "Место", "Цена", session_id, "Статус") FROM stdin;
1	A1	500.00	1	продан
2	A2	500.00	1	доступен
3	A3	500.00	5	продан
4	B1	600.00	2	доступен
5	B2	600.00	4	продан
6	C1	700.00	7	доступен
7	C2	700.00	3	продан
8	D1	400.00	4	доступен
9	D2	400.00	9	доступен
10	E1	800.00	8	продан
11	E2	800.00	10	продан
\.


--
-- TOC entry 3664 (class 0 OID 17527)
-- Dependencies: 226
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, spectator_id, ticket_id) FROM stdin;
1	1	1
2	19	2
3	17	5
4	20	4
5	3	5
6	15	8
7	2	7
8	5	8
9	16	9
10	7	10
11	11	11
12	9	9
13	10	6
\.


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 215
-- Name: cinemas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cinemas_id_seq', 10, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 217
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 34, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 221
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 12, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 219
-- Name: spectators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spectators_id_seq', 20, true);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 223
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 11, true);


-- Completed on 2026-10-27 23:09:27 MSK

--
-- PostgreSQL database dump complete
--

