--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: flo
--

CREATE TABLE public.recommendations (
    user_id bigint NOT NULL,
    reco character varying(500)
);


ALTER TABLE public.recommendations OWNER TO flo;

--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: flo
--

CREATE TABLE public.restaurants (
    restaurant_id integer NOT NULL,
    name character varying(100),
    links character varying(200),
    description character varying(500)
);


ALTER TABLE public.restaurants OWNER TO flo;

--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.restaurants_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_restaurant_id_seq OWNER TO flo;

--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flo
--

ALTER SEQUENCE public.restaurants_restaurant_id_seq OWNED BY public.restaurants.restaurant_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: flo
--

CREATE TABLE public.reviews (
    review_id bigint NOT NULL,
    user_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    stars integer NOT NULL
);


ALTER TABLE public.reviews OWNER TO flo;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_id_seq OWNER TO flo;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flo
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: flo
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    password character varying(200) NOT NULL,
    initiallogin boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO flo;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: flo
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO flo;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flo
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.user_id;


--
-- Name: restaurants restaurant_id; Type: DEFAULT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurants_restaurant_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: flo
--

COPY public.recommendations (user_id, reco) FROM stdin;
28	[2.9749999046325684, -0.27399998903274536, 1.8949999809265137, -0.23600000143051147, 0.3490000069141388, -0.1850000023841858, 0.42399999499320984, -0.5580000281333923, -0.39500001072883606, -0.07699999958276749, 2.428999900817871, 2.4779999256134033, -0.9259999990463257, -0.40299999713897705, 0.31700000166893005, 3.0369999408721924, 3.2820000648498535, 3.2790000438690186, -0.5740000009536743, 3.2829999923706055]
30	[4.281000137329102, 0.7409999966621399, 2.2049999237060547, 0.24500000476837158, 1.1009999513626099, 0.05400000140070915, 1.2619999647140503, 0.5450000166893005, 0.3540000021457672, 0.05000000074505806, 3.48799991607666, 2.753999948501587, 0.15600000321865082, 0.703000009059906, 1.5989999771118164, 3.740000009536743, 4.156000137329102, 4.163000106811523, 0.2150000035762787, 4.005000114440918]
15	[0.9419999718666077, 0.14300000667572021, 0.49399998784065247, 0.04399999976158142, 0.23199999332427979, 0.006000000052154064, 0.26600000262260437, 0.09600000083446503, 0.06199999898672104, 0.00800000037997961, 0.7670000195503235, 0.6200000047683716, 0.00800000037997961, 0.13199999928474426, 0.3310000002384186, 0.8339999914169312, 0.925000011920929, 0.9259999990463257, 0.028999999165534973, 0.8939999938011169]
17	[1.4579999446868896, 0.1509999930858612, 0.7979999780654907, 0.03099999949336052, 0.32100000977516174, -0.009999999776482582, 0.3709999918937683, 0.06499999761581421, 0.039000000804662704, 0.0020000000949949026, 1.187999963760376, 1.0099999904632568, -0.07999999821186066, 0.125, 0.44200000166893005, 1.3300000429153442, 1.465999960899353, 1.465999960899353, -0.019999999552965164, 1.4279999732971191]
14	[0.9419999718666077, 0.14300000667572021, 0.49399998784065247, 0.04399999976158142, 0.23100000619888306, 0.006000000052154064, 0.26600000262260437, 0.09600000083446503, 0.06199999898672104, 0.00800000037997961, 0.7680000066757202, 0.6200000047683716, 0.00800000037997961, 0.13199999928474426, 0.3310000002384186, 0.8339999914169312, 0.9240000247955322, 0.925000011920929, 0.028999999165534973, 0.8939999938011169]
10	[0.9229999780654907, 1.565000057220459, -0.0689999982714653, 0.9129999876022339, 0.7020000219345093, 0.7490000128746033, 1.031000018119812, 1.4620000123977661, 0.9200000166893005, 0.5099999904632568, 0.5950000286102295, 0.36800000071525574, 1.6619999408721924, 1.5709999799728394, 1.3600000143051147, 0.7250000238418579, 0.6600000262260437, 0.5230000019073486, 0.9810000061988831, 0.3449999988079071]
29	[3.361999988555908, 0.4020000100135803, 1.8140000104904175, 0.10100000351667404, 0.7689999938011169, -0.00800000037997961, 0.8880000114440918, 0.21400000154972076, 0.13199999928474426, 0.014000000432133675, 2.739000082015991, 2.2909998893737793, -0.11400000005960464, 0.3499999940395355, 1.0740000009536743, 3.0380001068115234, 3.3529999256134033, 3.3559999465942383, 0.003000000026077032, 3.257999897003174]
5	[4.2270002365112305, 1.2269999980926514, 1.9479999542236328, 0.49900001287460327, 1.3489999771118164, 0.19499999284744263, 1.5299999713897705, 1.128000020980835, 0.7549999952316284, 0.11699999868869781, 3.440000057220459, 2.365000009536743, 0.8050000071525574, 1.25600004196167, 2.0789999961853027, 3.4170000553131104, 3.8550000190734863, 3.86299991607666, 0.6679999828338623, 3.6389999389648438]
7	[1.777999997138977, 0.6570000052452087, 0.7540000081062317, 0.28200000524520874, 0.6420000195503235, 0.12200000137090683, 0.7239999771118164, 0.6420000195503235, 0.4320000112056732, 0.0689999982714653, 1.4459999799728394, 0.8939999938011169, 0.5230000019073486, 0.6869999766349792, 1.0149999856948853, 1.3589999675750732, 1.5520000457763672, 1.555999994277954, 0.4099999964237213, 1.4420000314712524]
12	[1.7419999837875366, 0.6240000128746033, 0.7480000257492065, 0.26600000262260437, 0.6179999709129333, 0.11400000005960464, 0.6980000138282776, 0.6060000061988831, 0.40700000524520874, 0.06499999761581421, 1.4170000553131104, 0.8899999856948853, 0.4869999885559082, 0.6510000228881836, 0.9750000238418579, 1.3420000076293945, 1.5290000438690186, 1.5329999923706055, 0.3840000033378601, 1.4240000247955322]
4	[3.571000099182129, 1.7740000486373901, 1.156999945640564, 0.9490000009536743, 1.343999981880188, 0.6449999809265137, 1.690999984741211, 1.6859999895095825, 1.059000015258789, 0.2980000078678131, 2.7679998874664307, 1.843000054359436, 1.4839999675750732, 1.940999984741211, 2.3389999866485596, 2.743000030517578, 3.0329999923706055, 2.930000066757202, 1.1109999418258667, 2.9519999027252197]
1	[4.394000053405762, 4.004000186920166, 0.3869999945163727, 2.0, 2.234999895095825, 1.6100000143051147, 3.578000068664551, 3.500999927520752, 2.2320001125335693, 1.6440000534057617, 3.503999948501587, 1.6449999809265137, 3.8529999256134033, 4.349999904632568, 4.691999912261963, 3.565000057220459, 3.313999891281128, 3.052000045776367, 3.125999927520752, 4.184999942779541]
36	[0.0, -0.0, 0.0, -0.0, 0.0, -0.0, -0.0, -0.0, -0.0, -0.0, 0.0, 0.0, -0.0, -0.0, -0.0, 0.0, 0.0, 0.0, -0.0, 0.0]
41	[0.0, -0.0, 0.0, -0.0, 0.0, -0.0, -0.0, -0.0, -0.0, -0.0, 0.0, 0.0, -0.0, -0.0, -0.0, 0.0, 0.0, 0.0, -0.0, 0.0]
2	[5.354000091552734, 3.2090001106262207, 1.7029999494552612, 1.4859999418258667, 2.5820000171661377, 0.7149999737739563, 2.885999917984009, 3.3980000019073486, 2.305000066757202, 0.38100001215934753, 4.348999977111816, 1.8140000104904175, 3.188999891281128, 3.4609999656677246, 4.297999858856201, 3.4100000858306885, 4.057000160217285, 4.078999996185303, 2.36299991607666, 3.561000108718872]
3	[4.4120001792907715, 1.2879999876022339, 2.0309998989105225, 0.5239999890327454, 1.4119999408721924, 0.20499999821186066, 1.600000023841858, 1.1859999895095825, 0.7940000295639038, 0.12399999797344208, 3.5920000076293945, 2.4630000591278076, 0.8489999771118164, 1.3170000314712524, 2.174999952316284, 3.562999963760376, 4.020999908447266, 4.0289998054504395, 0.703000009059906, 3.7950000762939453]
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: flo
--

COPY public.restaurants (restaurant_id, name, links, description) FROM stdin;
1	LOsteria	https://losteria.net/de/	Die beste beste Pizza, Pasta d’amore und eine einzigartige Atmosphäre – ein unschlagbares Rezept
2	Burger Mafia	https://www.speisekarte.de/saarbr%C3%BCcken/restaurant/burger_mafia/speisekarte	Burgergrill im amerikanischen Diner-Stil mit großen Portionen, Donut-Milchshakes und Live-Fußball.
3	Hashimoto	https://hashimoto-saar.de/	Japanisches Restaurant mit original japanischen Rezepten
4	LaBastille	https://www.restaurant-labastille.de/	Entrecote, Crème brulée und saarländische "Dibbelabbes" im urigen Lokal mit nostalgischen Werbeschildern.
5	Osaka	https://www.sushi-saarbruecken.de/	Mit japanischer Schlichtheit dekoriertes Restaurant, das Sushi, Nudelsuppen und Teppanyaki-Speisen anbietet.
6	Krua Thai	https://www.speisekarte.de/saarbr%C3%BCcken/restaurant/krua_thai_restaurant/speisekarte	Das mit transparenten Stoffbahnen und bunten Blumen gestaltete Restaurant serviert thailändische Gerichte.
7	Okinii	https://okinii.de/okinii-menu-sushi-salate-suppen-und-mehr-japanische-spezialitaeten/	Das Restaurant mit dezenten asiatischen Stilelementen bietet All-you-can-eat Sushi und japanische Gerichte an.
8	Asia Restaurant	https://grand-asia.de/	Das schlichte, in warmen Farben gestaltete Lokal serviert Sushi, Gegrilltes und andere japanische Speisen.
9	Ristorante Roma	https://www.roma-saarbruecken.de/	Gehobenes italienisches Restaurant in elegantem, schwarz-weißem Ambiente mit Dinner-Boot auf der Saar.
10	PaoloTonio	https://speisekarte.menu/restaurants/saarbruecken/paolo-tonio-1	Authentisch italienische Küche mit einer Prise Sardinien.
11	Aryan Grill /ParkausGrill	https://de-de.facebook.com/pages/category/Fast-Food-Restaurant/Arian-Grill-Parkdeck-D%C3%B6ner-121349157922670/	Fast-Food-Restaurant in Saarbrücken.
12	Die Kartoffel	https://www.die-kartoffel-sb.de/	Das moderne Lokal ist in dezenten Grün- und warmen Brauntönen gestaltet und serviert herzhafte Speisen.
13	Buffalo Steakhaus	http://www.buffalo-saar.de/speisekarte.html	Grillspezialitäten, Burger und ein reichhaltiges Salatbuffet zwischen Holzbohlen und Deko im Südamerika-Stil.
14	ElSombrero	https://www.el-sombrero.de/	Klassisch mexikanische Küche mit vegetarischem Angebot zwischen Palmen und Kakteen. Kinderspielecke vorhanden.
15	Restaurant Flammkuchenhaus	http://dasflammkuchenhaus.de/	Rustikales Brauereirestuarant mit Spielplatz und Biergarten bereitet Flammkuchen vor den Augen der Gäste zu.
16	Cafe Especial Mexican Restaurant Cantina	https://www.cafe-especial.com/	Auf der Speisekarte des gemütlichen Lokals stehen Tex-Mex-Gerichte, Cocktails und zahlreiche Tequilasorten.
17	Vapiano	https://www.vapiano-lieferservice.de/de/restaurant/desb1/saarbrucken-rathaus	Kette für Pasta, Pizza und mehr im modernen Cafeteria-Stil mit Bar und Bestellung an der Theke.
18	Burgerrei	https://www.dieburgerei.de/?gclid=Cj0KCQjw1PSDBhDbARIsAPeTqrcZ5ZGGf6_rZXsumX0lAXp7pbCXKtLxVJUQqcZpQy6AsVSg8ECzQm0aAizBEALw_wcB	Im kleinen Lokal mit Backsteinwänden werden zu den Burgervariationen hausgemachte Pommes und Soßen serviert.
19	SaarKebab	https://www.facebook.com/therealsaarkebab/	Fase-Food-Restaurant in Saarbrücken.
20	Kalinski	https://www.kalinskibrueder.de/	Moderne Wurstwirtschaft in Bistro-Ambiente mit Fleisch von saarländischen Landmetzgereien und veganen Speisen.
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: flo
--

COPY public.reviews (review_id, user_id, restaurant_id, stars) FROM stdin;
2	1	2	3
3	1	3	4
4	1	4	0
5	1	5	3
6	1	6	0
7	1	7	5
8	1	8	5
9	1	9	4
10	1	10	2
11	1	11	4
12	1	12	0
13	1	13	4
14	1	14	3
15	1	15	5
16	1	16	3
17	1	17	5
18	1	18	5
19	1	19	3
21	2	1	5
22	2	2	5
23	2	3	4
24	2	4	4
25	2	5	4
26	2	6	1
27	2	7	3
28	2	8	2
29	2	9	0
30	2	10	0
31	2	11	5
32	2	12	3
33	2	13	4
34	2	14	5
35	2	15	2
36	2	16	4
37	2	17	3
38	2	18	5
39	2	19	2
40	2	20	1
41	3	1	4
42	3	2	3
43	3	3	0
44	3	4	0
45	3	5	0
46	3	6	0
47	3	7	0
48	3	8	0
49	3	9	0
50	3	10	0
51	3	11	5
52	3	12	2
53	3	13	0
54	3	14	0
55	3	15	5
56	3	16	4
57	3	17	3
58	3	18	5
59	3	19	2
60	3	20	4
61	4	1	5
62	4	2	3
63	4	3	0
64	4	4	0
65	4	5	0
66	4	6	0
67	4	7	0
68	4	8	0
69	4	9	4
70	4	10	0
71	4	11	4
72	4	12	0
73	4	13	3
74	4	14	0
75	4	15	4
76	4	16	0
77	4	17	4
78	4	18	3
79	4	19	0
80	4	20	4
82	5	2	0
83	5	3	0
84	5	4	0
85	5	5	0
86	5	6	0
87	5	7	0
88	5	8	5
89	5	9	0
90	5	10	0
91	5	11	5
92	5	12	4
93	5	13	0
94	5	14	0
95	5	15	4
96	5	16	5
97	5	17	3
98	5	18	0
99	5	19	0
100	5	20	5
101	6	1	5
102	6	2	4
103	6	3	0
104	6	4	3
105	6	5	0
106	6	6	0
107	6	7	2
108	6	8	4
109	6	9	4
110	6	10	0
111	6	11	4
112	6	12	0
113	6	13	4
114	6	14	4
115	6	15	4
116	6	16	3
117	6	17	3
118	6	18	5
119	6	19	0
120	6	20	0
122	7	2	0
123	7	3	0
124	7	4	0
125	7	5	0
126	7	6	0
127	7	7	0
128	7	8	0
129	7	9	0
130	7	10	0
131	7	11	4
132	7	12	0
133	7	13	0
134	7	14	3
135	7	15	0
136	7	16	0
137	7	17	4
138	7	18	0
139	7	19	0
140	7	20	0
141	8	1	0
142	8	2	0
143	8	3	0
144	8	4	0
145	8	5	0
146	8	6	0
147	8	7	0
148	8	8	0
149	8	9	0
150	8	10	0
151	8	11	0
152	8	12	0
153	8	13	0
154	8	14	0
155	8	15	0
156	8	16	0
157	8	17	0
121	7	1	0
81	5	1	1
158	8	18	0
159	8	19	3
160	8	20	0
161	9	1	4
162	9	2	0
163	9	3	0
164	9	4	0
165	9	5	0
166	9	6	0
167	9	7	3
168	9	8	0
169	9	9	0
170	9	10	0
171	9	11	0
172	9	12	0
173	9	13	0
174	9	14	0
175	9	15	0
176	9	16	0
177	9	17	3
178	9	18	3
179	9	19	0
180	9	20	0
182	10	2	0
183	10	3	5
184	10	4	0
185	10	5	0
186	10	6	0
187	10	7	0
188	10	8	0
189	10	9	0
190	10	10	0
191	10	11	3
192	10	12	0
193	10	13	0
194	10	14	5
195	10	15	0
196	10	16	0
197	10	17	0
198	10	18	0
199	10	19	0
200	10	20	0
201	11	1	4
202	11	2	3
203	11	3	0
204	11	4	0
205	11	5	1
206	11	6	1
207	11	7	0
208	11	8	2
209	11	9	3
210	11	10	0
211	11	11	1
212	11	12	1
213	11	13	3
214	11	14	4
215	11	15	5
216	11	16	4
217	11	17	3
218	11	18	5
219	11	19	3
220	11	20	4
222	12	2	0
223	12	3	0
224	12	4	0
225	12	5	0
226	12	6	0
227	12	7	3
228	12	8	0
229	12	9	0
230	12	10	1
231	12	11	1
232	12	12	0
233	12	13	1
234	12	14	1
235	12	15	0
236	12	16	3
237	12	17	3
238	12	18	0
239	12	19	0
240	12	20	0
241	13	1	5
242	13	2	0
243	13	3	0
244	13	4	0
245	13	5	0
246	13	6	0
247	13	7	4
248	13	8	0
249	13	9	0
250	13	10	0
251	13	11	0
252	13	12	0
253	13	13	0
254	13	14	0
255	13	15	0
256	13	16	3
257	13	17	4
258	13	18	4
259	13	19	0
260	13	20	5
261	14	1	3
262	14	2	0
263	14	3	0
264	14	4	0
265	14	5	0
266	14	6	0
267	14	7	0
268	14	8	0
269	14	9	0
270	14	10	0
271	14	11	0
272	14	12	0
273	14	13	0
274	14	14	0
275	14	15	0
276	14	16	0
277	14	17	3
278	14	18	0
279	14	19	0
280	14	20	0
282	15	2	0
283	15	3	0
284	15	4	0
285	15	5	0
286	15	6	0
287	15	7	0
288	15	8	0
289	15	9	0
290	15	10	0
291	15	11	0
292	15	12	0
293	15	13	0
294	15	14	0
295	15	15	0
296	15	16	0
297	15	17	3
298	15	18	0
299	15	19	0
300	15	20	0
301	16	1	3
302	16	2	0
303	16	3	0
304	16	4	0
305	16	5	0
306	16	6	0
307	16	7	0
308	16	8	0
309	16	9	0
310	16	10	0
311	16	11	2
312	16	12	0
313	16	13	0
314	16	14	0
281	15	1	0
315	16	15	0
316	16	16	3
317	16	17	2
318	16	18	4
319	16	19	0
320	16	20	5
321	17	1	0
322	17	2	0
323	17	3	0
324	17	4	0
325	17	5	0
326	17	6	0
327	17	7	0
328	17	8	0
329	17	9	0
330	17	10	0
331	17	11	0
332	17	12	0
333	17	13	0
334	17	14	0
335	17	15	2
336	17	16	1
337	17	17	4
338	17	18	0
339	17	19	0
340	17	20	4
341	18	1	4
342	18	2	0
343	18	3	0
344	18	4	0
345	18	5	0
346	18	6	0
347	18	7	3
348	18	8	0
349	18	9	0
350	18	10	0
351	18	11	5
352	18	12	0
353	18	13	0
354	18	14	3
355	18	15	0
356	18	16	0
357	18	17	0
358	18	18	4
359	18	19	0
360	18	20	5
361	19	1	4
362	19	2	3
363	19	3	0
364	19	4	0
365	19	5	0
366	19	6	0
367	19	7	4
368	19	8	5
369	19	9	0
370	19	10	0
371	19	11	4
372	19	12	0
373	19	13	5
374	19	14	4
375	19	15	5
376	19	16	0
377	19	17	3
378	19	18	0
379	19	19	5
380	19	20	1
381	20	1	5
382	20	2	0
383	20	3	0
384	20	4	0
385	20	5	4
386	20	6	0
387	20	7	4
388	20	8	0
389	20	9	0
390	20	10	0
391	20	11	0
392	20	12	0
393	20	13	0
394	20	14	0
395	20	15	4
396	20	16	0
397	20	17	4
398	20	18	4
399	20	19	4
400	20	20	0
401	21	1	5
402	21	2	0
403	21	3	3
404	21	4	0
405	21	5	4
406	21	6	0
407	21	7	0
408	21	8	0
409	21	9	0
410	21	10	0
411	21	11	5
412	21	12	3
413	21	13	0
414	21	14	0
415	21	15	3
416	21	16	4
417	21	17	4
418	21	18	0
419	21	19	0
420	21	20	5
421	22	1	2
422	22	2	3
423	22	3	2
424	22	4	3
425	22	5	5
426	22	6	5
427	22	7	3
428	22	8	4
429	22	9	4
430	22	10	1
431	22	11	2
432	22	12	4
433	22	13	3
434	22	14	2
435	22	15	3
436	22	16	3
437	22	17	2
438	22	18	2
439	22	19	3
440	22	20	5
441	23	1	2
442	23	2	4
443	23	3	0
444	23	4	0
445	23	5	0
446	23	6	0
447	23	7	1
448	23	8	1
449	23	9	0
450	23	10	0
451	23	11	2
452	23	12	1
453	23	13	0
454	23	14	0
455	23	15	0
456	23	16	1
457	23	17	1
458	23	18	0
459	23	19	0
460	23	20	5
461	24	1	4
462	24	2	2
463	24	3	0
464	24	4	0
465	24	5	5
466	24	6	0
467	24	7	0
468	24	8	3
469	24	9	0
470	24	10	0
471	24	11	4
472	24	12	2
473	24	13	0
474	24	14	5
475	24	15	4
476	24	16	5
477	24	17	2
478	24	18	3
479	24	19	3
480	24	20	5
481	25	1	3
482	25	2	3
483	25	3	3
484	25	4	4
485	25	5	4
486	25	6	0
487	25	7	3
488	25	8	4
489	25	9	4
490	25	10	0
491	25	11	4
492	25	12	4
493	25	13	4
494	25	14	3
495	25	15	3
496	25	16	4
497	25	17	4
498	25	18	4
499	25	19	0
500	25	20	4
501	26	1	3
502	26	2	0
503	26	3	4
504	26	4	0
505	26	5	0
506	26	6	0
507	26	7	0
508	26	8	0
509	26	9	0
510	26	10	0
511	26	11	5
512	26	12	4
513	26	13	0
514	26	14	0
515	26	15	0
516	26	16	0
517	26	17	2
518	26	18	4
519	26	19	0
520	26	20	0
521	27	1	0
522	27	2	0
523	27	3	5
524	27	4	0
525	27	5	0
526	27	6	0
527	27	7	0
528	27	8	0
529	27	9	0
530	27	10	0
531	27	11	2
532	27	12	5
533	27	13	0
534	27	14	0
535	27	15	0
536	27	16	4
537	27	17	4
538	27	18	5
539	27	19	0
540	27	20	0
541	28	1	0
542	28	2	0
543	28	3	5
544	28	4	0
545	28	5	0
546	28	6	0
547	28	7	0
548	28	8	0
549	28	9	0
550	28	10	0
551	28	11	2
552	28	12	5
553	28	13	0
554	28	14	0
555	28	15	0
556	28	16	4
557	28	17	4
558	28	18	5
559	28	19	0
560	28	20	0
561	29	1	5
562	29	2	0
563	29	3	0
564	29	4	0
565	29	5	0
566	29	6	0
567	29	7	4
568	29	8	0
569	29	9	0
570	29	10	0
571	29	11	0
572	29	12	0
573	29	13	0
574	29	14	0
575	29	15	0
576	29	16	3
577	29	17	4
578	29	18	4
579	29	19	0
580	29	20	5
582	30	2	0
583	30	3	3
584	30	4	0
585	30	5	4
586	30	6	0
587	30	7	0
588	30	8	0
589	30	9	0
590	30	10	0
591	30	11	5
592	30	12	3
593	30	13	0
594	30	14	0
595	30	15	3
596	30	16	4
597	30	17	4
598	30	18	0
599	30	19	0
600	30	20	5
20	1	20	2
1	1	1	5
181	10	1	5
581	30	1	1
221	12	1	1
601	36	0	0
602	36	1	0
603	36	2	0
604	36	3	0
605	36	4	0
606	36	5	0
607	36	6	0
608	36	7	0
609	36	8	0
610	36	9	0
611	36	10	0
612	36	11	0
613	36	12	0
614	36	13	0
615	36	14	0
616	36	15	0
617	36	16	0
618	36	17	0
619	36	18	0
620	36	19	0
681	41	0	0
682	41	1	0
683	41	2	0
684	41	3	0
685	41	4	0
686	41	5	0
687	41	6	0
688	41	7	0
689	41	8	0
690	41	9	0
691	41	10	0
692	41	11	0
693	41	12	0
694	41	13	0
695	41	14	0
696	41	15	0
697	41	16	0
698	41	17	0
699	41	18	0
700	41	19	0
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: flo
--

COPY public.users (user_id, name, email, password, initiallogin) FROM stdin;
3	test_user3	test@test3.de	$2b$10$14Uky670F.vCocRDQZtOne2PQxsxFfbZdFke63y99YdNtBHnkjLn.	t
4	test_user4	test@test4.de	$2b$10$/kp3/xV8CjmU0rnlSpYGYeQHRHzFKH/ekLihRlZoOKF.dgiXz5CoW	t
6	test_user6	test@test6.de	$2b$10$uoPltAgnM9tlvIeNQa6z6OPz2wLAHplebN.spFCUDK0uhe1LEh1Tq	t
8	test_user8	test@test8.de	$2b$10$Lwjr9hjOAIYdQst39deaVOFfqVabiyk.AWoD70KxVBLusyfJfu/6G	t
9	test_user9	test@test9.de	$2b$10$A0W18UxYIc8GLx4ksz/nSe9vYhTV8wvvGkS10K5k7D5u0mUUaA0V2	t
11	test_user11	test@test11.de	$2b$10$KNyuplQl6.0iTUq.Ib8KyuoDEUqwAbPLbuZQ9ibLoqKzNbHlplG/O	t
13	test_user13	test@test13.de	$2b$10$ZFGk5pq.Q2cZNmf75bfkg.M5jgDtH0qmpQISbMwViDU/9Bv1OBMNa	t
14	test_user14	test@test14.de	$2b$10$WR48GoQu1Y8iPKt8ghTW/eMSJ7qLPtcAItpxJgkwCL07Bga1u0Zc.	t
16	test_user16	test@test16.de	$2b$10$cxto5sUP8yq5cWZXlkbmm.GbMCh.M36uMov03rBAW7fQk93dGMUzK	t
17	test_user17	test@test17.de	$2b$10$BafvPIoKJXAbm563WzqFE.7RguQLPeiwX1K2kYJN4l1NMsiZER7MG	t
18	test_user18	test@test18.de	$2b$10$QIXsQL1XoLB3Zc86MIRvduSJDAhY8CNLMX3ouwlEgoPHiZ4OPBkcm	t
30	test_user30	test@test30.de	$2b$10$RA4VIHmLVAftKKDXMEsoxea8f9Nkoaptoxj9VDLX8nt9Vjg2BS2jC	f
35	test_user40	test@test40.de	$2b$10$xjjt3CCGasGyghCDC571AOrEs2vmnNrlhOTOaMbgiFvxUPE9nDKTe	f
36	test50	test@test50.de	$2b$10$Cq9MmBsbmXKM8FNaj1d..ewUSpW2rY4imcRTDHOdIvAl39zJqUtom	f
37	test_user100	test@test100.de	$2b$10$kgqEFKfiMCEB7tzrwdF9Je3TFrlXW3M9mgEKDD4UUKOjwMa7yf1vK	t
41	test_userXY	test@testXY.de	$2b$10$u3HbarZD.k9mssAuNgrwmeRIW2U9Pt9zr1/YWVGSee2C4c7Hk2vvC	f
19	test_user19	test@test19.de	$2b$10$B04ihcJSYz95U52nPIY4lujETKxnPGfW3E.cokONIIlInTp70MKfy	t
20	test_user20	test@test20.de	$2b$10$2ThzQ2sr8wQ.m6mYi2a8DO/PVqcYgHXlmZMsZimvdAwNgrLJeE.VC	t
21	test_user21	test@test21.de	$2b$10$FKicaoE1ajXkn9bqU7HnCO8/RX1LM3r2JNg1WeUDY.YIuJX401aqm	t
22	test_user22	test@test22.de	$2b$10$21B32WH1JDRB0g9M5MBxFurIIWBTrA.JCaHn62gWwYQ/.nRsOH..W	t
23	test_user23	test@test23.de	$2b$10$9VYQPCp4wopDayN.GR3h8OT8pP1ORc.hSNh1x/SqlwJmoUV1uVFhW	t
24	test_user24	test@test24.de	$2b$10$QPLEr/Ywq/FvDjN4iHvO.uaBaSl.2bIQyfJabCrTaDarEcOyKrFRi	t
26	test_user26	test@test26.de	$2b$10$Sqqzn6bSUAeLq7RkQ4T0nu6SMqbIkmHDk2RCF3nOh/6QO3pisX/xG	t
27	test_user27	test@test27.de	$2b$10$FPt2UZ6a8kfLt0eK/Q4uiubbGFVyzRfXA8mKTyKLqNmYWrUrhH2kS	t
28	test_user28	test@test28.de	$2b$10$6vT5IPph4uf0/oW/mk6HOeB.9PTKAOptVYgIVtR5eHaA8rl/TfvHC	t
29	test_user29	test@test29.de	$2b$10$g5MPSp8MJMv9MpElDTsVn.C.6vGA9dDBuCTflm559owPP/jfG8yVS	t
31	test_user31	test@test31.de	$2b$10$XHpVAuI0eOdZMmmWuIzJt.k4ZqwKE2Y5U12o0iWDkB0nsO5gbO59O	t
2	test_user2	test@test2.de	$2b$10$GqJZR/G7gbZ5VR6dicyg4e2wfLdUPeQ9tna47J2JGzLuNf6JzYguC	t
25	test_user25	test@test25.de	$2b$10$iKYGPEEuLEUXDDiPlaOs8u4QVN3yTAouHH64xpf8IRRMwM9dlaSbi	t
5	test_user5	test@test5.de	$2b$10$B8Z07fN15W4r4JWftdPNXusJSzSU16Dte44gmC1joYWdyhS0aZu8W	t
10	test_user10	test@test10.de	$2b$10$pgvJ89mG8V9OK66j1xdet.9Lv.iBnf3CNL99hsgrkg2TDAMojG3fi	f
12	test_user12	test@test12.de	$2b$10$z82Hkxn3kSTP/8y98zCEQ.MJuNW4hK3nYAAcokjI7BKK6BKbjrL9e	f
7	test_user7	test@test7.de	$2b$10$.kI1zMBDsJaoo5A0WAOCgeTOAkzMvdV17dYl13PHwKJe3wxBuoDTq	f
15	test_user15	test@test15.de	$2b$10$Q0dGQ2sG3OQBC6JcWx19V.y9iua/VsDlyUUT2T3HrVhtMlaMjcbLC	f
1	test_user1	test@test1.de	$2b$10$0MGaNhNHYNRWIpqBc6OKuuhingpE/S6eEn7UD68/frjOHYYCTLQV6	f
38	test_user200	test@test200.de	$2b$10$92Dwbh8SROKtND6KpHzBWeLwndjxRESgm9uxEutCeCg4EJR6o3RA.	t
\.


--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.restaurants_restaurant_id_seq', 20, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 700, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flo
--

SELECT pg_catalog.setval('public.users_id_seq', 41, true);


--
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (user_id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (restaurant_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: flo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

