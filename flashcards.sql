--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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
-- Name: decks; Type: TABLE; Schema: public; Owner: carlosbuitrago
--

CREATE TABLE public.decks (
    id integer NOT NULL,
    continent text NOT NULL
);


ALTER TABLE public.decks OWNER TO carlosbuitrago;

--
-- Name: decks_id_seq; Type: SEQUENCE; Schema: public; Owner: carlosbuitrago
--

CREATE SEQUENCE public.decks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decks_id_seq OWNER TO carlosbuitrago;

--
-- Name: decks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlosbuitrago
--

ALTER SEQUENCE public.decks_id_seq OWNED BY public.decks.id;


--
-- Name: flashcards; Type: TABLE; Schema: public; Owner: carlosbuitrago
--

CREATE TABLE public.flashcards (
    id integer NOT NULL,
    country text NOT NULL,
    capital text NOT NULL,
    deck_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    last_viewed timestamp without time zone
);


ALTER TABLE public.flashcards OWNER TO carlosbuitrago;

--
-- Name: flashcards_id_seq; Type: SEQUENCE; Schema: public; Owner: carlosbuitrago
--

CREATE SEQUENCE public.flashcards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flashcards_id_seq OWNER TO carlosbuitrago;

--
-- Name: flashcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlosbuitrago
--

ALTER SEQUENCE public.flashcards_id_seq OWNED BY public.flashcards.id;


--
-- Name: decks id; Type: DEFAULT; Schema: public; Owner: carlosbuitrago
--

ALTER TABLE ONLY public.decks ALTER COLUMN id SET DEFAULT nextval('public.decks_id_seq'::regclass);


--
-- Name: flashcards id; Type: DEFAULT; Schema: public; Owner: carlosbuitrago
--

ALTER TABLE ONLY public.flashcards ALTER COLUMN id SET DEFAULT nextval('public.flashcards_id_seq'::regclass);


--
-- Data for Name: decks; Type: TABLE DATA; Schema: public; Owner: carlosbuitrago
--

COPY public.decks (id, continent) FROM stdin;
1	Africa
2	Asia
3	Europe
6	Oceania
8	Americas
7	Antarctic
\.


--
-- Data for Name: flashcards; Type: TABLE DATA; Schema: public; Owner: carlosbuitrago
--

COPY public.flashcards (id, country, capital, deck_id, created_at, last_viewed) FROM stdin;
1	Dominican Republic	Santo Domingo	8	2025-07-13 18:38:53.383337	\N
2	Guyana	Georgetown	8	2025-07-13 18:38:53.388003	\N
3	Norway	Oslo	3	2025-07-13 18:38:53.388871	\N
4	United Arab Emirates	Abu Dhabi	2	2025-07-13 18:38:53.38977	\N
5	Azerbaijan	Baku	2	2025-07-13 18:38:53.390558	\N
6	Estonia	Tallinn	3	2025-07-13 18:38:53.391847	\N
7	Guinea-Bissau	Bissau	1	2025-07-13 18:38:53.392837	\N
8	Angola	Luanda	1	2025-07-13 18:38:53.393643	\N
9	Brunei	Bandar Seri Begawan	2	2025-07-13 18:38:53.39437	\N
10	Italy	Rome	3	2025-07-13 18:38:53.395121	\N
11	British Virgin Islands	Road Town	8	2025-07-13 18:38:53.395855	\N
12	Czechia	Prague	3	2025-07-13 18:38:53.396613	\N
13	Mayotte	Mamoudzou	1	2025-07-13 18:38:53.397336	\N
14	Nicaragua	Managua	8	2025-07-13 18:38:53.398067	\N
15	North Korea	Pyongyang	2	2025-07-13 18:38:53.398874	\N
16	Syria	Damascus	2	2025-07-13 18:38:53.399681	\N
17	Bahrain	Manama	2	2025-07-13 18:38:53.400472	\N
18	Martinique	Fort-de-France	8	2025-07-13 18:38:53.401245	\N
19	Albania	Tirana	3	2025-07-13 18:38:53.402006	\N
20	Kiribati	South Tarawa	6	2025-07-13 18:38:53.40277	\N
21	Mozambique	Maputo	1	2025-07-13 18:38:53.403489	\N
22	American Samoa	Pago Pago	6	2025-07-13 18:38:53.404201	\N
23	Philippines	Manila	2	2025-07-13 18:38:53.404929	\N
24	Lithuania	Vilnius	3	2025-07-13 18:38:53.405688	\N
25	Pitcairn Islands	Adamstown	6	2025-07-13 18:38:53.406399	\N
26	Colombia	Bogotá	8	2025-07-13 18:38:53.407282	\N
27	Seychelles	Victoria	1	2025-07-13 18:38:53.408723	\N
28	Bolivia	Sucre	8	2025-07-13 18:38:53.409924	\N
29	Malta	Valletta	3	2025-07-13 18:38:53.411359	\N
30	Greece	Athens	3	2025-07-13 18:38:53.412569	\N
31	Saint Lucia	Castries	8	2025-07-13 18:38:53.413883	\N
32	Kazakhstan	Astana	2	2025-07-13 18:38:53.415473	\N
33	Bosnia and Herzegovina	Sarajevo	3	2025-07-13 18:38:53.416745	\N
34	Fiji	Suva	6	2025-07-13 18:38:53.418051	\N
35	Montenegro	Podgorica	3	2025-07-13 18:38:53.419561	\N
36	Saudi Arabia	Riyadh	2	2025-07-13 18:38:53.420724	\N
37	South Georgia	King Edward Point	7	2025-07-13 18:38:53.421944	\N
38	Eswatini	Mbabane	1	2025-07-13 18:38:53.423288	\N
39	Comoros	Moroni	1	2025-07-13 18:38:53.424607	\N
40	Montserrat	Plymouth	8	2025-07-13 18:38:53.426005	\N
41	Niue	Alofi	6	2025-07-13 18:38:53.427257	\N
42	United States Virgin Islands	Charlotte Amalie	8	2025-07-13 18:38:53.428476	\N
43	Guatemala	Guatemala City	8	2025-07-13 18:38:53.429627	\N
44	Palau	Ngerulmud	6	2025-07-13 18:38:53.430544	\N
45	United Kingdom	London	3	2025-07-13 18:38:53.431776	\N
46	Denmark	Copenhagen	3	2025-07-13 18:38:53.433032	\N
47	Djibouti	Djibouti	1	2025-07-13 18:38:53.434292	\N
48	Israel	Jerusalem	2	2025-07-13 18:38:53.435794	\N
49	Turkmenistan	Ashgabat	2	2025-07-13 18:38:53.437006	\N
50	Micronesia	Palikir	6	2025-07-13 18:38:53.438244	\N
51	Ukraine	Kyiv	3	2025-07-13 18:38:53.439597	\N
52	Solomon Islands	Honiara	6	2025-07-13 18:38:53.441027	\N
53	Honduras	Tegucigalpa	8	2025-07-13 18:38:53.44271	\N
54	Christmas Island	Flying Fish Cove	6	2025-07-13 18:38:53.443994	\N
55	Svalbard and Jan Mayen	Longyearbyen	3	2025-07-13 18:38:53.44532	\N
56	Tajikistan	Dushanbe	2	2025-07-13 18:38:53.446972	\N
57	Cayman Islands	George Town	8	2025-07-13 18:38:53.448362	\N
58	Iraq	Baghdad	2	2025-07-13 18:38:53.449569	\N
59	Uganda	Kampala	1	2025-07-13 18:38:53.450629	\N
60	Russia	Moscow	3	2025-07-13 18:38:53.452116	\N
61	Zimbabwe	Harare	1	2025-07-13 18:38:53.453219	\N
62	Sudan	Khartoum	1	2025-07-13 18:38:53.454456	\N
63	Turks and Caicos Islands	Cockburn Town	8	2025-07-13 18:38:53.455766	\N
64	Haiti	Port-au-Prince	8	2025-07-13 18:38:53.457001	\N
65	Sweden	Stockholm	3	2025-07-13 18:38:53.458148	\N
66	Laos	Vientiane	2	2025-07-13 18:38:53.459633	\N
67	Andorra	Andorra la Vella	3	2025-07-13 18:38:53.461071	\N
68	Turkey	Ankara	2	2025-07-13 18:38:53.462383	\N
69	Lesotho	Maseru	1	2025-07-13 18:38:53.46358	\N
70	Anguilla	The Valley	8	2025-07-13 18:38:53.46502	\N
71	Slovakia	Bratislava	3	2025-07-13 18:38:53.466121	\N
72	Ghana	Accra	1	2025-07-13 18:38:53.467613	\N
73	Finland	Helsinki	3	2025-07-13 18:38:53.468874	\N
74	Morocco	Rabat	1	2025-07-13 18:38:53.470225	\N
75	Niger	Niamey	1	2025-07-13 18:38:53.471727	\N
76	Uruguay	Montevideo	8	2025-07-13 18:38:53.472918	\N
77	Chile	Santiago	8	2025-07-13 18:38:53.474237	\N
78	Barbados	Bridgetown	8	2025-07-13 18:38:53.475589	\N
79	Cambodia	Phnom Penh	2	2025-07-13 18:38:53.476943	\N
80	Burkina Faso	Ouagadougou	1	2025-07-13 18:38:53.478153	\N
81	Rwanda	Kigali	1	2025-07-13 18:38:53.479586	\N
82	Trinidad and Tobago	Port of Spain	8	2025-07-13 18:38:53.481238	\N
83	São Tomé and Príncipe	São Tomé	1	2025-07-13 18:38:53.482746	\N
84	Bangladesh	Dhaka	2	2025-07-13 18:38:53.484159	\N
85	India	New Delhi	2	2025-07-13 18:38:53.48542	\N
86	Republic of the Congo	Brazzaville	1	2025-07-13 18:38:53.486875	\N
87	Oman	Muscat	2	2025-07-13 18:38:53.48826	\N
88	Paraguay	Asunción	8	2025-07-13 18:38:53.489359	\N
89	Togo	Lomé	1	2025-07-13 18:38:53.490701	\N
90	Bulgaria	Sofia	3	2025-07-13 18:38:53.49208	\N
91	El Salvador	San Salvador	8	2025-07-13 18:38:53.493444	\N
92	Faroe Islands	Tórshavn	3	2025-07-13 18:38:53.494623	\N
93	Botswana	Gaborone	1	2025-07-13 18:38:53.495997	\N
94	French Polynesia	Papeetē	6	2025-07-13 18:38:53.497044	\N
95	Portugal	Lisbon	3	2025-07-13 18:38:53.498174	\N
96	Venezuela	Caracas	8	2025-07-13 18:38:53.499404	\N
97	France	Paris	3	2025-07-13 18:38:53.500623	\N
98	Papua New Guinea	Port Moresby	6	2025-07-13 18:38:53.50207	\N
99	Taiwan	Taipei	2	2025-07-13 18:38:53.503276	\N
100	Moldova	Chișinău	3	2025-07-13 18:38:53.504503	\N
101	Ivory Coast	Yamoussoukro	1	2025-07-13 18:38:53.505696	\N
102	Saint Barthélemy	Gustavia	8	2025-07-13 18:38:53.507051	\N
103	Brazil	Brasília	8	2025-07-13 18:38:53.508571	\N
104	Lebanon	Beirut	2	2025-07-13 18:38:53.510063	\N
105	Yemen	Sana'a	2	2025-07-13 18:38:53.51147	\N
106	Curaçao	Willemstad	8	2025-07-13 18:38:53.512962	\N
107	Gambia	Banjul	1	2025-07-13 18:38:53.51457	\N
108	Wallis and Futuna	Mata-Utu	6	2025-07-13 18:38:53.515775	\N
109	Ethiopia	Addis Ababa	1	2025-07-13 18:38:53.517151	\N
110	Sri Lanka	Sri Jayawardenepura Kotte	2	2025-07-13 18:38:53.518576	\N
111	Cameroon	Yaoundé	1	2025-07-13 18:38:53.520136	\N
112	Guernsey	St. Peter Port	3	2025-07-13 18:38:53.521341	\N
113	Central African Republic	Bangui	1	2025-07-13 18:38:53.522795	\N
114	French Guiana	Cayenne	8	2025-07-13 18:38:53.524173	\N
115	Aruba	Oranjestad	8	2025-07-13 18:38:53.52558	\N
116	French Southern and Antarctic Lands	Port-aux-Français	7	2025-07-13 18:38:53.527064	\N
117	Algeria	Algiers	1	2025-07-13 18:38:53.528469	\N
118	Monaco	Monaco	3	2025-07-13 18:38:53.530146	\N
119	Armenia	Yerevan	2	2025-07-13 18:38:53.531582	\N
120	Switzerland	Bern	3	2025-07-13 18:38:53.533023	\N
121	Peru	Lima	8	2025-07-13 18:38:53.534229	\N
122	Iran	Tehran	2	2025-07-13 18:38:53.53599	\N
123	Saint Helena, Ascension and Tristan da Cunha	Jamestown	1	2025-07-13 18:38:53.537138	\N
124	Senegal	Dakar	1	2025-07-13 18:38:53.538416	\N
125	Saint Pierre and Miquelon	Saint-Pierre	8	2025-07-13 18:38:53.539605	\N
126	Saint Vincent and the Grenadines	Kingstown	8	2025-07-13 18:38:53.540794	\N
127	Zambia	Lusaka	1	2025-07-13 18:38:53.542044	\N
128	Somalia	Mogadishu	1	2025-07-13 18:38:53.543553	\N
129	Austria	Vienna	3	2025-07-13 18:38:53.544654	\N
130	Tonga	Nuku'alofa	6	2025-07-13 18:38:53.546347	\N
131	Cape Verde	Praia	1	2025-07-13 18:38:53.547627	\N
132	Thailand	Bangkok	2	2025-07-13 18:38:53.548787	\N
133	Western Sahara	El Aaiún	1	2025-07-13 18:38:53.55031	\N
134	Timor-Leste	Dili	2	2025-07-13 18:38:53.551594	\N
135	South Africa	Pretoria	1	2025-07-13 18:38:53.55294	\N
136	Equatorial Guinea	Malabo	1	2025-07-13 18:38:53.554157	\N
137	Gibraltar	Gibraltar	3	2025-07-13 18:38:53.555133	\N
138	Benin	Porto-Novo	1	2025-07-13 18:38:53.556543	\N
139	Malawi	Lilongwe	1	2025-07-13 18:38:53.557565	\N
140	Australia	Canberra	6	2025-07-13 18:38:53.558989	\N
141	Jamaica	Kingston	8	2025-07-13 18:38:53.560264	\N
142	Chad	N'Djamena	1	2025-07-13 18:38:53.561534	\N
143	Myanmar	Naypyidaw	2	2025-07-13 18:38:53.562953	\N
144	Nigeria	Abuja	1	2025-07-13 18:38:53.564021	\N
145	Mauritania	Nouakchott	1	2025-07-13 18:38:53.565534	\N
146	Bermuda	Hamilton	8	2025-07-13 18:38:53.566942	\N
147	Ecuador	Quito	8	2025-07-13 18:38:53.568082	\N
148	Mauritius	Port Louis	1	2025-07-13 18:38:53.569698	\N
149	Greenland	Nuuk	8	2025-07-13 18:38:53.570904	\N
150	New Caledonia	Nouméa	6	2025-07-13 18:38:53.572885	\N
151	New Zealand	Wellington	6	2025-07-13 18:38:53.574834	\N
152	Argentina	Buenos Aires	8	2025-07-13 18:38:53.576244	\N
153	Costa Rica	San José	8	2025-07-13 18:38:53.577923	\N
154	North Macedonia	Skopje	3	2025-07-13 18:38:53.579079	\N
155	Marshall Islands	Majuro	6	2025-07-13 18:38:53.58105	\N
156	Mali	Bamako	1	2025-07-13 18:38:53.58225	\N
157	Belize	Belmopan	8	2025-07-13 18:38:53.583453	\N
158	Kenya	Nairobi	1	2025-07-13 18:38:53.584952	\N
159	Åland Islands	Mariehamn	3	2025-07-13 18:38:53.586333	\N
160	Jordan	Amman	2	2025-07-13 18:38:53.587856	\N
161	Madagascar	Antananarivo	1	2025-07-13 18:38:53.589277	\N
162	Vatican City	Vatican City	3	2025-07-13 18:38:53.5908	\N
163	Indonesia	Jakarta	2	2025-07-13 18:38:53.591913	\N
164	Iceland	Reykjavik	3	2025-07-13 18:38:53.593271	\N
165	Caribbean Netherlands	Kralendijk	8	2025-07-13 18:38:53.594713	\N
166	Singapore	Singapore	2	2025-07-13 18:38:53.596323	\N
167	Malaysia	Kuala Lumpur	2	2025-07-13 18:38:53.597577	\N
168	Mexico	Mexico City	8	2025-07-13 18:38:53.599097	\N
169	Namibia	Windhoek	1	2025-07-13 18:38:53.600208	\N
170	Puerto Rico	San Juan	8	2025-07-13 18:38:53.60124	\N
171	Afghanistan	Kabul	2	2025-07-13 18:38:53.602407	\N
172	Belarus	Minsk	3	2025-07-13 18:38:53.603752	\N
173	Sint Maarten	Philipsburg	8	2025-07-13 18:38:53.60476	\N
174	Tanzania	Dodoma	1	2025-07-13 18:38:53.606012	\N
175	Isle of Man	Douglas	3	2025-07-13 18:38:53.607356	\N
176	Georgia	Tbilisi	2	2025-07-13 18:38:53.608636	\N
177	Croatia	Zagreb	3	2025-07-13 18:38:53.61004	\N
178	Pakistan	Islamabad	2	2025-07-13 18:38:53.611761	\N
179	Kuwait	Kuwait City	2	2025-07-13 18:38:53.613867	\N
180	Spain	Madrid	3	2025-07-13 18:38:53.615361	\N
181	Liechtenstein	Vaduz	3	2025-07-13 18:38:53.616926	\N
182	Panama	Panama City	8	2025-07-13 18:38:53.618794	\N
183	Antigua and Barbuda	Saint John's	8	2025-07-13 18:38:53.620353	\N
184	Japan	Tokyo	2	2025-07-13 18:38:53.621721	\N
185	DR Congo	Kinshasa	1	2025-07-13 18:38:53.623035	\N
186	China	Beijing	2	2025-07-13 18:38:53.624409	\N
187	Guadeloupe	Basse-Terre	8	2025-07-13 18:38:53.625683	\N
188	Libya	Tripoli	1	2025-07-13 18:38:53.627347	\N
189	Romania	Bucharest	3	2025-07-13 18:38:53.628509	\N
190	Ireland	Dublin	3	2025-07-13 18:38:53.629959	\N
191	Egypt	Cairo	1	2025-07-13 18:38:53.631525	\N
192	British Indian Ocean Territory	Diego Garcia	1	2025-07-13 18:38:53.632594	\N
193	Saint Martin	Marigot	8	2025-07-13 18:38:53.633789	\N
194	Norfolk Island	Kingston	6	2025-07-13 18:38:53.635414	\N
195	Vietnam	Hanoi	2	2025-07-13 18:38:53.636462	\N
196	Latvia	Riga	3	2025-07-13 18:38:53.638021	\N
197	Tunisia	Tunis	1	2025-07-13 18:38:53.639371	\N
198	Germany	Berlin	3	2025-07-13 18:38:53.640895	\N
199	Samoa	Apia	6	2025-07-13 18:38:53.642089	\N
200	Hong Kong	City of Victoria	2	2025-07-13 18:38:53.643651	\N
201	Mongolia	Ulan Bator	2	2025-07-13 18:38:53.644817	\N
202	Qatar	Doha	2	2025-07-13 18:38:53.64609	\N
203	Cuba	Havana	8	2025-07-13 18:38:53.647243	\N
204	United States	Washington, D.C.	8	2025-07-13 18:38:53.648327	\N
205	Guinea	Conakry	1	2025-07-13 18:38:53.649931	\N
206	Bahamas	Nassau	8	2025-07-13 18:38:53.65147	\N
207	Cook Islands	Avarua	6	2025-07-13 18:38:53.652688	\N
208	Slovenia	Ljubljana	3	2025-07-13 18:38:53.653732	\N
209	Northern Mariana Islands	Saipan	6	2025-07-13 18:38:53.654954	\N
210	South Korea	Seoul	2	2025-07-13 18:38:53.656486	\N
211	Kosovo	Pristina	3	2025-07-13 18:38:53.657977	\N
212	Canada	Ottawa	8	2025-07-13 18:38:53.659342	\N
213	Tokelau	Fakaofo	6	2025-07-13 18:38:53.660837	\N
214	Guam	Hagåtña	6	2025-07-13 18:38:53.662251	\N
215	South Sudan	Juba	1	2025-07-13 18:38:53.663422	\N
216	Suriname	Paramaribo	8	2025-07-13 18:38:53.664743	\N
217	Hungary	Budapest	3	2025-07-13 18:38:53.666338	\N
218	Dominica	Roseau	8	2025-07-13 18:38:53.667318	\N
219	Nepal	Kathmandu	2	2025-07-13 18:38:53.668599	\N
220	Gabon	Libreville	1	2025-07-13 18:38:53.66993	\N
221	Belgium	Brussels	3	2025-07-13 18:38:53.670854	\N
222	Liberia	Monrovia	1	2025-07-13 18:38:53.671849	\N
223	United States Minor Outlying Islands	Washington DC	8	2025-07-13 18:38:53.673206	\N
224	Bhutan	Thimphu	2	2025-07-13 18:38:53.674407	\N
225	Réunion	Saint-Denis	1	2025-07-13 18:38:53.675535	\N
226	Sierra Leone	Freetown	1	2025-07-13 18:38:53.676922	\N
227	Netherlands	Amsterdam	3	2025-07-13 18:38:53.678317	\N
228	Eritrea	Asmara	1	2025-07-13 18:38:53.679461	\N
229	Maldives	Malé	2	2025-07-13 18:38:53.680796	\N
230	Luxembourg	Luxembourg	3	2025-07-13 18:38:53.681896	\N
231	Nauru	Yaren	6	2025-07-13 18:38:53.683101	\N
232	San Marino	City of San Marino	3	2025-07-13 18:38:53.684396	\N
233	Saint Kitts and Nevis	Basseterre	8	2025-07-13 18:38:53.685556	\N
234	Cocos (Keeling) Islands	West Island	6	2025-07-13 18:38:53.686995	\N
235	Falkland Islands	Stanley	8	2025-07-13 18:38:53.688385	\N
236	Vanuatu	Port Vila	6	2025-07-13 18:38:53.689862	\N
237	Cyprus	Nicosia	3	2025-07-13 18:38:53.691047	\N
238	Palestine	Ramallah	2	2025-07-13 18:38:53.692408	\N
239	Serbia	Belgrade	3	2025-07-13 18:38:53.693847	\N
240	Burundi	Gitega	1	2025-07-13 18:38:53.694815	\N
241	Grenada	St. George's	8	2025-07-13 18:38:53.695963	\N
242	Tuvalu	Funafuti	6	2025-07-13 18:38:53.697039	\N
243	Jersey	Saint Helier	3	2025-07-13 18:38:53.698226	\N
244	Uzbekistan	Tashkent	2	2025-07-13 18:38:53.699649	\N
245	Kyrgyzstan	Bishkek	2	2025-07-13 18:38:53.700852	\N
246	Poland	Warsaw	3	2025-07-13 18:38:53.702104	\N
\.


--
-- Name: decks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlosbuitrago
--

SELECT pg_catalog.setval('public.decks_id_seq', 8, true);


--
-- Name: flashcards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlosbuitrago
--

SELECT pg_catalog.setval('public.flashcards_id_seq', 246, true);


--
-- Name: decks decks_pkey; Type: CONSTRAINT; Schema: public; Owner: carlosbuitrago
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_pkey PRIMARY KEY (id);


--
-- Name: flashcards flashcards_pkey; Type: CONSTRAINT; Schema: public; Owner: carlosbuitrago
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_pkey PRIMARY KEY (id);


--
-- Name: flashcards unique_country; Type: CONSTRAINT; Schema: public; Owner: carlosbuitrago
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT unique_country UNIQUE (country);


--
-- Name: flashcards flashcards_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlosbuitrago
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.decks(id);


--
-- PostgreSQL database dump complete
--

