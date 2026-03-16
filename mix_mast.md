# 🎶 Miksing og mastering

![alt text](mix.png)

Dette hefter gir en innføring og miksing og mastering. Den retter seg mot nybegynner som jobber hobbypreget og som trenger hjelp til å komme i gang, lære seg noe om teknikker, terminologi og bestandeler. Vi jobber på Logic Pro og ser ikke på audio-problematikk eller vokal.

Med miksing mener man det å balanserer instrumentene ift. til hverandre, sørge for at de har nok luft, at de har passe relativt volum, at stereobildet og arrangement oppleves optimalt, samtidig som man unngår clipping og har nok headroom til effektiv mastering. Mastering består i den avsluttende prosesseringen av output-lyden, hvilket inkludere arbeid med kompressorer, limiters etc. bl.a. for å øke det totale lydnivået (loudness) opp til kommersielt nivå.

Vi begynner med mastering for å se hva som teknisk bør vektlegges i miksingen.

---

## Generelle tips

I tillegg til dette er det en del generelle tips i prosessen som er viktige:

1. Ta hyppige pauser. Ørene blir fort “blinde”. Jobb aldri lenger enn en kanskje 30–40 min før du tar en pause på 10 min. 

2. Ikke venn deg til å spille høyt i hodetelefoner. Skal man jobbe mye med musikk, vil dette være ensbetydende med tinnitus.

3. Eksporter ofte og hør på dette i bilen, på andre høyttalere osv. Problemer avsluttes ofte først da.

4. Bruk en referanselåt. Importer en profesjonell låt i samme stil inn i prosjektet. Skru den ned så den har omtrent samme nivå som egen miks og sammenlign.

---

## Mastering

En vanlig problemstilling er at man ender opp med et produkt som er altfor lavt ift. profesjonell musikk. Man må skru opp lyden nesten mot maks for at volumet skal oppleves høyt. Selv om man har lagt seg så høyt som mulig uten clipping, blir sluttresultatet pulsete. (Clipping oppstår når lydsignalet blir høyere enn det digitale maksimumsnivået (0 dBFS). Da kuttes signaltoppene, lydbølger mister form og det oppstår forvrengning).

Det man gjør i miksingen er å legge seg et godt stykke under clipping-nivået i miksingen (master peaks rundt -6 dB er vanlig), for siden å stole på masteringen for å heve volumet.

I mastering i Logic Pro opererer man på på output-track'et, dvs. på Stereo Out. Man har i tillegg et master track, som er fint å bruke til fade in/fade out, men som ellers kun er for kontroll av flere output-kilder. Dvs. pugins som brukes i mastering legges etter hverandre i Stereo Out.

Det er flere plugins som kan brukes, men det helt grunnleggende (det minimale som vi skal fokusere på) er:

- Channel EQ
- Compressor
- Adaptive Limiter
- Loudness Meter

Det fins også andre, som 

- saturation
- multiband compression
- stereo imaging

man kan fokusere mer på siden.

Som regel er det kun små endringer som gjøres med EQ-frekvensene i mastering, men dette er naturlig det første "boksen" på Stereo Out. Kompressoren komprimerer lyden (dvs. den reduserer forskjellen mellom høye og lave nivåer (dynamikken)), mens limiteren stopper peaks hardt over et bestemt nivå (som f.eks. -1 dB, men på en intelligent måte). Til slutt har vi Loudness Meter som ikke påvirker lyden, men som er en måler for opplevd lydstyrke (ift. referansepunktet på maks digitalt nivå (0 dBFS)). Med dette får man et objektiv, tallbasert mål for endelig lydstyrke som man kan styre etter.

---

### Loudness Meter

Loudness Meter kommer til slutt i kjeden, men må diskuteres først, siden den nevnes underveis i omtalen av de andre. Den gir altså et tall på lydstyrken. Denne oppgis i såkalte LUFS (Loudness Units relative to Full Scale). Meteret viser typisk:

- Integrated LUFS → gjennomsnittlig loudness for hele låten

- Short-term LUFS → loudness akkurat nå (målt over noen sekunder)

og tallene kan illustreres ved:

```python
-14 LUFS  → moderat loudness
-10 LUFS  → ganske høy
 -8 LUFS  → veldig høy
```

Integrated LUFS er den viktigste parameteren. Det forteller om låtens generelle lydnivå. Som referanse kan man nevne typisk lydnivå på vanlige låter hos:

| Plattform   | Loudness            |
| ----------- | ------------------- |
| Spotify     | ca **-14 LUFS**     |
| Apple Music | ca **-16 LUFS**     |
| EDM         | **-8 til -10 LUFS** |

(EDM er et samlebegrep for elektronisk klubb- og dansemusikk (som house, techno, dubstep osv.))

Integrated LUFS forteller selvsagt ikke alt. De fleste låter har en naturlig dynamikk mellom rolige og mer intense partier. Et for konstant nivå virker kunstig, flatt og livløst.

Her er en balansert illustrasjon:

```python
Intro       -18 LUFS
Vers        -15 LUFS
Refreng     -11 LUFS
Outro       -16 LUFS
```

---

### Channel EQ

Channel EQ er kun ment for små (typisk ±1–3 dB) avsluttende justeringer i frekvensbalansen. For store endringer kan endre karakteren og bør unngås, men man kan finjustere litt på midrange, justere high-pass eller low-cut etc.

---

### Compressor

I Logic Pro finnes det flere kompressor-modeller (Platinum, Studio VCA, Studio FET, Vintage Opto osv.), men de viktigste parameterne er de samme.

Det kan anbefales å begynne med 
**Platinum Digital**. Den er

- ren
- nøytral
- lett å forstå

Senere kan man eksperimentere med:

| Type         | Karakter  |
| ------------ | --------- |
| Studio VCA   | punchy    |
| Studio FET   | aggressiv |
| Vintage Opto | smooth    |


#### Her er de viktigste parametrene.

📌 **Input Gain**

Input gain angir styrken på som signalet som sendes inn i kompressoren, altså nivået før kompresjonen skjer. Hvis man øker Input Gain, 
vil mer av signalet går over Threshold og dermed gi mer kompresjon.

📌 **Threshold**

Signal over Threshold blir komprimert, signal under påvirkes ikke.

- Lav Threshold betyr at mer av signalet blir komprimert.
- Høy Threshold tilsier at bare de høyeste toppene komprimeres.

Eksempel:

```python
Threshold: -20 dB
```

👉 *Merk at dB i Logic Pro er dBFS (decibels full scale) der 0 dBFS er maks digitalt nivå*

📌 **Ratio**

Bestemmer hvor hardt signalet presses ned etter Threshold.

| Ratio | Effekt            |
| ----- | ----------------- |
| 2:1   | mild kompresjon   |
| 4:1   | vanlig kompresjon |
| 8:1   | kraftig           |
| ∞:1   | limiter           |

Mer konkret

```python
3:1:   3 dB over Threshold → blir til 1 dB over Threshold ut
4:1:   4 dB over Threshold → blir til 1 dB over Threshold ut
```

Eksempler

```python
3:1
Threshold: -20 dB
Input:     -17 dB (3 over)
3 over blir til 1 over, altså output -19 dB
```

```python
4:1
Threshold: -20 dB
Input:     -17 dB (3 over)
3 over blir til 3*1/4 = 0,75 over, altså output -19.25 dB
```

For en bestemt, fast Input Gain er det altså Threshold og Ratio som angir kompresjonsstyrke.

📌 **Attack**

Attack sier hvor raskt (i ms) kompressoren reagerer.

- rask attack → temmer transients (kick, snare)

- langsom attack → lar transienten slippe gjennom


📌 **Release**

Release angir hvor lenge (i ms) kompressoren jobber etter aktivisering før den slipper taket:

- kort → mer energi og pumping

- lang → jevnere og roligere

📌 **Makeup Gain**

Makeup Gain juster volumet opp igjen etter at kompressoren har dempet signalet. Man justerer vanligvis slik at volumet etter kompresjon matcher volumet før. Blir det økning, vil ørene lett tro på en forbedring, selv om lyden bare er høyere.

👉 *Transienter er veldig korte, plutselige topper i lydsignalet (på noen få millisekunder), vanligvis helt i starten av en lyd, som f.eks. fra en gitar eller et piano*

👉 *Flere kompressorer har en Auto Gain-checkbox som setter Makeup Gain automatisk. Mange skrur denne av for å høre virkningen av selve kompresjonen under arbeid.*

####  Innstillinger og bruk

For det første er det bare kraftige lyder som i utgangspunktet dempes av kompressoren. Svake lyder heves ikke direkte. Men når hele lydstyrken heves i Makeup Gain, vil også det svake nivået heves og ligge nærmere det kraftige nivået enn det opprinnelig gjorde.

Her er en relativ mild kompresjon:

```python
Input Gain: 0 dB
Threshold: juster til 1–3 dB gain reduction
Ratio: 2:1
Attack: 20 ms
Release: 100 ms
Makeup Gain: +1 til +3 dB
```

hvor man for Threshold her prøver å si at man under avspilling

- justerer Threshold gradvis
- ser på Gain Reduction-måleren til den viser omtrent -1 dB til -3 dB

👉 *Gain Reduction (GR) sier hvor mange dB signalet blir dempet av prosessoren*.

👉 *Gain Reduction vises typisk sentralt i konsollen, ofte via et nål-basert meter*.

Her er en mer kraftig kompresjon:

```python
Input Gain: 0 til +2 dB
Threshold: juster til 3–6 dB gain reduction
Ratio: 4:1
Attack: 10–15 ms
Release: 80 ms
Makeup Gain: +3 til +5 dB
```

- Input Gain gis et lett boost for mer signal over threshold
- Threshold og ratio økes for mer kompresjon
- Attack kortes for å temme transienter mer
- Release slippes raskere for mer energi
- Makeup Gain kompenserer mer for det tapte


👉 *Når man jobber med kompresjon, er det lurt skru kompresjonen av og på for å høre virkningen tydeligere*.

👉 *Det kan hende man må gå tilbake og justere innstillingene når man jobber med Limiter. Disse må samspille, men i utgangspunktet skrus Limiter av under innstillingsarbeidet*.

---

### Limiter

En limiter kan beskrives som en intelligent og kontrollert måte å stoppe topper på før de klipper. I stedet for at signalet bare blir kuttet brutalt ved 0 dBFS (hard clipping), gjør limiteren dette:

- ser transienten komme (lookahead)

- senker nivået veldig raskt

- slipper signalet opp igjen etterpå

Resultatet er mye mindre hørbar forvrengning enn vanlig clipping.

Det er ofte tegn på en god miks at Limiter jobber lite.

Typisk:

```python
Limiter gain reduction: 1–3 dB
```

Da fanges de siste toppene, og gjennomsnittsvolumet løftes litt. 

Hvis Limiter isteden stadig gjør:

```python
6–10 dB gain reduction
```

kan flere ting skje:

- transienter mister punch
- lyden blir flat
- det kan oppstå pumping
- diskant kan bli hard eller sprø

Dette betyr ofte:

- miksen har for store peaks
- mye frekvenskamp
- dynamikken er ikke kontrollert tidligere
- kompressorene i miksen gjør ikke nok arbeid

Også for Limiter er det flere plugins å velge mellom. Den enkleste å starte med er Adaptive Limiter. Den har få parametre, har visuell Gain-Reduction og justerer nivået automatisk uten at man trenger å finjustere mange ting.

Andre alternativer er

- Limiter

- Multipressor
  
### Viktige parametre

📌 **Gain**

Gain øker volumet opp mot Output Ceiling. Hvis Limiter må redusere nivået for å holde signalet under grensen, vises dette som Gain Reduction. Når man skrur opp Gain, bør man følge med på Gain Reduction, gjerne vist som en vertikal bar eller en nål.

Økning av Gain:

```python
→ signalet prøver å gå over ceiling
→ Limiter presser det ned igjen
→ Gain Reduction-måleren viser hvor mye
```

📌 **Output Ceiling**

Output Ceiling et trygt maksimalt nivået for Stereo Out (ofte -0.3 dB) for å unngå clipping Dersom Limiter er siste plugin (som påvirker lyd), vil i prinsippet ikke clipping da skje, selv om det *vil kunne* skje ved overgangen fra digitalt til analogt signal.

📌 **Lookahead**

Lookahead viser langt frem Limiter ser i signalet for å forhindre at transienter klipper. Verdier på 0–5 ms er vanlig. Mer lookahead kan gi mykere lyd, men med mindre punch/energi. Ved små verdier kan bli transienter klippet  ubehandlet.

📌 **Adaptiv funksjon**

Adaptive Limiter justerer seg selv dynamisk for å hindre pumping og sikre jevn output. For nybegynnere er det lurt å velge default og heller fokusér på Gain og Output Ceiling.

####  Innstillinger og bruk

Som sagt er karakterisere Gain Reduction hvor mye Limiter jobber:

```python
1–3 dB  → lett limiting (ofte ideelt)
3–5 dB  → moderat
6 dB +  → hard limiting
```

En veldig nyttig test for en miks man kan gjøre i Logic:

- Sett Output Ceiling til -0.3 dB
- Øk Gain til ca +6 dB
- Se på Gain Reduction.

```python
1–3 dB → veldig bra miks
3–6 dB → normalt
8–10 dB → miksen er krevende
```

---

### Side Chain Compressing
 
Det er også noe som heter Side Chain Compressing. Det kan brukes som en hjelp der to lyder konkurrerer om de samme frekvensene til samme tid. Kick og bass er et vanlig eksempel. Da kan man f.eks. sette opp at kompresjonen på bassen styres av kicken. Dette er veldig enkelt å få til i Logic Pro:

- Legg kompressor på bassen
- Øverst i plugin'en finnes Side Chain
- Velg kick-kanalen
- Juster Threshold og Release

---

## Miksing

Vi skal så se på miksingen. Den starter når alt er ferdig innspilt, ferdig strukturert og man har en fungerende grovmiks.

Man setter Stereo Out fader til 0.0 dB, panorer alle tracks til senter og starter med alle spor-volum av.

---

### Spor-volume

Volumet åpnes suksessivt iht. det følgende:

1. kick + bass
2. trommer
3. hovedinstrument
4. pads / atmosfære
5. voice loops / FX

Med tanke på det viktige arbeidet med EQ senere, er det fint å å separert instrumenter mest mulig, f.eks. at basstrommer og hi-hats er på separate spor, at basstangenter i en pad er på annet spor en lyse toner osv.

Ørene er beste hjelpemiddel, men la oss likevel gi noen tips.

👉 *Starte med kick-peak rundt -10 til -8 dB. Velg kick litt tydeligere enn bass*.

👉 *Lytt gjerne på litt lavere volum*.

👉 *Når miksen nesten er ferdig, dra alle faders og miks igjen veldig raskt*.

Husk også å ende opp med tilstrekkelig headroom (maks -6dB på Stereo Out).

De neste stegen etter dette er typisk:

- Panorering
- EQ
- Kompresjon på enkeltspor
- Reverb, delay ect., typisk på busser
- Buss-kompresjon

La oss ta disse i tur og orden.

---

### Panorering

Noen elementer bør nesten alltid være midtstilt fordi de er fundamentet i låten.

Typisk:

- kick
- bass
- snare / clap
- hoved-lead

Disse skal gi stabilitet og punch. Instrumenter som ikke er hovedfokus kan flyttes ut til sidene.

Typisk:

- pads
- gitar
- arpeggio-synth
- hi-hats
- percussion
- atmosfæriske effekter

Dette gir mer plass i midten, større stereobilde og klarere miks. Men ikke pan alt litt. Det er gjerne bedre å være tydelig:

- 0 %
- 30–40 %
- 60–80 %

Dette gir balanse.

Hi-hats og lyse synths kan ofte panoreres ganske bredt uten problemer.

Bass og lave frekvenser bør derimot være nær midten, fordi:

- lave frekvenser fungerer dårlig i stereo
- de da fort mister kraft

Husk at panorering kan forenkle EQ-arbeidet.

---

### EQ

EQ er ofte det mest krevende steget i miksing, men også det som gir størst forbedring når man får kontroll på det. Nøkkelen er å gjøre det systematisk og forsiktig. Her er en praktisk metode man kan følge.

To viktige regler:

1. Ikke EQ i solo for lenge: EQ skal få instrumenter til å fungere sammen, ikke alene.

2. Små endringer er ofte nok: ±1–3 dB gjør ofte stor forskjell

📌 **High-pass**

High-pass fjerner lave frekvenser, men slipper gjennom høye. Dette er ofte det første man gjør.

Mange spor inneholder unødvendig lavfrekvent energi som bare gjør miksen grumsete.

| Instrument    | High-pass  |
| ------------- | ---------- |
| vokal / loops | 80–120 Hz  |
| gitar         | 80–120 Hz  |
| synth         | 80–200 Hz  |
| pads          | 100–250 Hz |
| hi-hats       | 200–400 Hz |

La kick og bass beholde low-end. Disse tingene alene kan gjøre miksen mye klarere.

📌 **Fjern “mud”**

Det mest problematiske området i mikser er ofte området 200–500 Hz. For mye aktivitet her gir:

- grumsete lyd
- lite definisjon
- dårlig punch

Prøv små kutt: -2 til -4 dB med middels smal Q.

📌 **Finn problemfrekvenser**

En vanlig teknikk: Lag en smal EQ boost (6–8 dB), sweep gjennom frekvensene, og når noe høres stygt ut → kutt der.

Dette finner:

- resonanser
- harde frekvenser
- maskering

📌 **Lag plass mellom instrumenter**

Dette er kanskje den viktigste EQ-oppgaven.

Eksempel:

Hvis lead synth er viktig rundt 2 kHz, kan du kutte litt der i pads.


```python
lead +2 dB @ 2 kHz
pad  -2 dB @ 2 kHz
```


Dette kalles ofte complementary EQ.

📌 **Litt “presence”**

For å gjøre instrumenter tydeligere kan man booste litt i 2–5 kHz. Dette gir:

- klarhet
- attack
- definisjon

Men vær forsiktig – for mye gir hard lyd.

📌 **Luft**

High-shelf betegner det å løfte volumet til noen høye frekvenser (fra angitt verdi og oppover). Legg gjerne litt high shelf rundt 8–12 kHz. Dette kan gi litt luft og åpenhet i synths og pads, ofte bare +1 eller +2 dB

👉 *Se på Logic sin Channel EQ . Den viser litt frekvensanalyse, hvor hvor energien ligger og hvor instrumenter overlapper*.

👉 *Ikke booste mange frekvenser. Dette gir mer rot og mindre headroom. Ofte er det bedre å kutte i andre spor*.

👉 *Hvis miksen føles uklar selv etter EQ, er problemet ofte for mange lag i mid-range (300–2000 Hz) – ikke dårlig EQ*.


Her har vi en liten oppdeling av frekvensspekteret som kan være nyttig.


1. **Ca. 200–500 Hz: Mud / grums**

Dette området gir ofte:

- uklar miks
- lite definisjon
- “tåke” i lydbildet

Problemet oppstår når mange instrumenter har energi her samtidig:

pads
gitar
piano
synths
vokal

Typisk løsning: -2 til -4 dB cut på *enkelte* spor i dette området.

2. **ca. 500–900 Hz: Boxy / papp-lyd**

Dette området kan gi en litt:

- hul
- pappaktig
- boksete lyd

Vanlig i:

- gitar
- synth leads
- trommeloops

Små kutt her kan gjøre miksen renere og mer moderne.

3. **Ca. 2–4 kHz: Hardhet / skarphet**

Dette området er veldig sensitivt for øret. Det gir:

- tydelighet
- attack
- presence

Men for mye gir:

- hard lyd
- lyttetretthet

Dette er ofte problemområdet i:

- hi-hats
- aggressive synths
- gitar

Løsning kan være -1 til -3 dB hvis noe føles skarpt.


4. **8–12 kHz; Air / luft**

Et ekstra viktig område. Her kan man ofte gjøre små boosts for å gi:

- mer åpen lyd
- mer detalj

Men overdrivelse kan gi:

- hiss
- digital skarphet

--- 

### Track- og buss-komprimering

Praktisk EQ-prøveoppsett for flere patcher
1. Sett opp grupper / buss

Lag en buss for hver gruppe av patcher som spiller i samme frekvensområde (f.eks. pads, lead, bass).

Send alle relevante patcher til bussen.

Dette lar deg justere EQ og effekter samlet.

2. High-pass og low-pass

Start med High-pass for å fjerne unødvendig subbass på alle ikke-bass-lag: ca 80–150 Hz.

Low-pass på pads/synt-lag som ikke trenger ekstremt høy frekvens: ca 8–12 kHz.

3. Rydd i mid-range (200–2000 Hz)

Spill gruppen sammen med andre patcher.

Finn frekvenser som maskerer viktige elementer (bass, kick, lead).

Bruk smale EQ-kutt (-2 til -4 dB) først – prøv å dempe overlapping uten å gjøre lyden unaturlig.

Tips:

Automatiser EQ hvis et instrument spiller gjennom forskjellige frekvensområder.

Bruk solo vs mix lytting: slå solo av for å høre hvordan kutt påvirker helheten.

4. Test med buss-effekter

Legg på reverb/delay på bussen, ikke på individuelle patcher.

Juster EQ igjen etter effekter for å holde plass til transienter og klarhet.

5. Headroom

Sørg for at Stereo Out fortsatt har -6 dB max peak før du går til mastering.

Da ser du tydelig hvordan EQ-justeringene påvirker limiter og LUFS senere.

6. Iterativ prosess

Start med bare noen få patcher → legg til mer etter hvert.

Hver gang du legger til et lag, sjekk:

Hvordan det påvirker transienter

Om det maskerer eksisterende instrumenter

Om headroom holdes

💡 Tips for å beholde naturlighet

Små kutt (1–3 dB) virker ofte bedre enn store.

Bruk shelving EQ for brede områder og parametrisk EQ for smale korrigeringer.

Lytt på helheten, ikke bare solo-spor.




Åpne File → Project Alternatives → New Alternative

Gi alternativet et navn (f.eks. “Mix med split pad”)

---

## Trommer og loops

1. Den enkle løsningen: splitte loopen

I Logic kan du ofte gjøre dette:

Finn tromme-loopen du liker.

Konverter til MIDI / Drummer / sampler (hvis mulig).

Da kan du få separate spor for:

kick

snare

hi-hat

percussion

Da får du:

mye bedre mixing

mulighet for variasjon

mindre mekanisk følelse

uten å programmere alt fra scratch.

2. Den raske produsent-metoden

Mange gjør dette:

Behold trommeloopen
men legg oppå:

egen kick

egen snare

egen hihat

Da får du:

loop = groove
egne trommer = punch

Dette er ekstremt vanlig i elektronisk musikk.

3. Litt variasjon uten mye arbeid

For å unngå mekanisk følelse kan du gjøre små ting:

mute hi-hat i noen takter

legg inn ekstra kick før overgang

små fills før nytt parti

automatiser litt volum på loopen

Det tar ofte 2–3 minutter, men gir mye mer liv.

4. En veldig nyttig Logic-teknikk

Du kan også gjøre dette:

Flex Time / Flex Groove

Dette lar deg:

endre timing litt

gjøre loopen mindre perfekt

Resultat:

mindre robot
mer groove
5. En viktig miks-ting med loops

Loops er ofte ferdig prosessert:

kompresjon

EQ

reverb

Det betyr at de kan være vanskelige å mikse.

Et veldig nyttig triks er:

high-pass rundt 40–80 Hz

så loopen ikke konkurrerer med bass og kick.

6. Den psykologiske sannheten

Nesten alle produsenter gjør dette:

komponere med loops
↓
utsette trommer
↓
bli lei
↓
beholde loopen

Så du er i godt selskap. 😄

Et lite tips spesielt for deg

Siden du jobber mye med pads og synth-teksturer, kan du ofte slippe unna med:

én god trommeloop

en ekstra kick

en ekstra snare

og heller fokusere på sounddesign og miks.
