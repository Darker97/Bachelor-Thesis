# Abstract
# Einleitung
## Motivation
In Zeiten von Industrie 4.0 und Digitalisierung werden immer größere Datenmengen elektronisch gespeichert und verarbeitet. Da bisherige Speicherungen zumeist ausschließlich in Papierform vorlagen, werden Systeme benötigt, welche diese in eine digitale Form übersetzten.

Darauf aufbauend ist das Hauptziel des Projektes die Realisierung eines Systems zur automatischen Datenerfassung von Tabellen und ihrem Inhalt mit der Hilfe Maschinellen Lernens.

## Problemstellung
Ziel dieses Projektes ist es, ein Hauptsystem zu entwickeln welches ein PDF als Input nimmt, die enthaltene Tabelle erkennt und den Inhalt ausgibt.

## Zielsetzung
In dieser Arbeit soll eine Pipeline erstellt werden in der die einzelnen Schritte für ein solches System analysiert, entwickelt und beleuchtet werden. 

## Vorgehen und Aufbau
## Das Deutsche Zentrum für Luft- und Raumfahrt

Das Deutsches Zentrum für Luftund Raumfahrt (DLR) ist ein Forschungszentrum der Bundesrepublik Deutschland. Es umfasst 8700 Mitarbeiter, verteilt auf 28 Standorte in Deutschland, sowie mehrere Testund Betriebsanlagen. Es existieren außerdem 4 Standorte in Brüssel, Paris, Tokyo und Washington DC. Dabei ist das DLR noch in 51 Institute und 150 Großforschungsanlagen aufgeteilt, welche je ihre eigenen Schwerpunkte setzten.

Das DLR forscht in mehreren Bereichen, darunter Raumfahrt, Luftfahrt sowie Verkehr und Energie. Ein weiterer Bereich ist der der Digitalisierung und der Künstlichen Intelligenz. Dabei arbeitet das DLR eng mit internationalen Partnern zusammen und ist zum Beispiel verantwortlich für die Überwachung und Planung von Raumlabor Columbus, einem Multifunktionslabor auf der ISS (International Space Station). 

Am Standort Jena ist das Institut für Datenwissenschaften untergebracht. Hier werden Lösungen für neue Herausforderungen der Digitalisierungsära erforscht. Neben den Bereichen Datenmanagment, IT-Sicherheit und Smart Systems wird hier auch an Bürgerwissenschaften geforscht, welches sich zum Ziel gesetzt hat die Wissenschaft besser in die Gesellschaft zu bringen.

+++

# Vorbereitung

## Genutzte Tools und Services

### Jupyter Notebook

Zur Durchführung der einzelnen Experimente wurde das Tool Jupyter Notebook genutzt.

Jupyter Notebook ist ein Web basiertes Tool mit dem die Analyse von Datenbestände vereinfacht wird. Dabei kann Code in Python, C oder Swift zur Analyse genutzt werden. Die Oberfläche wird dabei wie bei einem Dokument verwaltet wobei Code in Blöcke getrennt werden kann. Dadurch können Zwischenergebnisse direkt eingesehen und Blöcke mehrfach berechnet werden. Das Ergebnis einer solchen Analyse kann als Dokument abgespeichert werden.

### Tensorflow

ensorflow ist ein Framework zum programmieren von Datenströmen und wird zur Entwicklung von Neuronalen nNetzwerken genutzt. Es ist in C++ geschrieben und kann mit verschiedensten Sprachen genutzt werden. Entwickelt von Google, wird Sie dort in Forschung und Produktivbetrieb in zahlreichen Projekten verwendet. Keras ist eine Deep Learning Library. Sie wurde von zunächst von François Chollet initiert und später als Kommunity Projekt weitergeführt. Sie bietet dabei viele nützliche Funktionen um ein Neuronales Netz zu entwickeln. Seit Tensorflow 1.4 ist Keras dabei auch Teil des Tensorflow Frameworks und vereinfacht dessen Nutzung.

### Python und Swift

Python ist eine interpretierte Programmiersprache, und wird meistens als Skriptsprache verwendet. Sie hat eine sehr leicht lesbare Syntax und kann sehr einfach Fremdcode laden, womit das Schreiben eines schnellen Skriptes stark vereinfacht wird.
Diese Faktoren machen Python zur optimalen Sprache zum Testen von Ideen, jedoch ist die Sprache nicht für größere Projekte ausgelegt.

In den Tests zeigte sich, dass die Arbeitsgeschwindigkeit nach dem Transformieren von ca. 100 Bildern stark sinkt. Daher wurden mehrere Ideen geprüft, um dieses Problem zu lösen. Eine Idee war es auf die Sprache Swift zu wechseln. Swift ist eine Multiparadimische Compilersprache, welche auf c basiert.

Aufgrund dessen, ist Sie bei größeren Projekten deutlich performanter als Python, kann jedoch trotzdem Python Librarys einbinden und nutzen. Da wir in Swift ebenfalls die Tensorflow Library verwenden, ist das Ergebnis in seiner Form gleich.

## TestDaten

Um die bereits bestehenden Tools, Programme oder Systeme zu testen oder einzurichten werden Testdaten benötigt.

Hierfür stehen einige Datenpools zu Verfügung, welche sich in Umfang und Aufbau unterscheiden. Dabei wurden Datenblätter von Herstellern von Raumfahrtkomponenten für DLR und ESA sowie ein Datensatz von vorbereiten Dokumenten der Datenbanken Plattform Keggle genutzt.

Diese können in ihrem Umfang bereits voll genutzt werden, es fehlen jedoch meist noch Zieldaten. Diese müssen in den meisten Fällen noch manuell hinzugefügt werden.

Des weiteren wurde eine Datenbank der Firma IBM Australia genutzt, welche aus mehrere Tausend Dokumente bestand. Diese ist bereits beschriftet und muss nur für den Einsatz in ein entsprechendes Format gebracht werden.

## Neuronale Netze

Ein Künstliches Neuronales Netz (KNN) ist eine Methode zur Informationsverarbeitung. Dabei wird, nahe dem Vorbild des Gehirns, ein Netz aus Neuronen erzeugt.

Das Netz besteht dabei aus mehreren Schichten. Jede Schicht besteht aus mehreren Neuronen, welche mit den Neuronen der nächsten Schicht verbunden sind. Jedes Neuron hat eine Aktivierungsfunktion. Diese erzeugt aus einem entsprechenden Input der verbundenen vorherigen Neuronen einen Output mit einem Wert zwischen 0 und 1. Jede Verknüpfung zwischen den Neuronen, sowie die Neuronen selbst haben einen Bias. Dieser beschreibt die Gewichtung des entsprechenden Objektes. Das KNN wird in der Entwicklung zunächst gebildet und muss dann trainiert werden.

Für dieses Training gibt es verschiedene Methoden, welche sich in der Art des Lernens unterscheiden. Die hier genutzte Methode ist das Überwachte Lernen.

Bei diesem Training werden zunächst Testdaten in das entsprechende Netz gegeben und das Ergebnis mit der Lösung verglichen. Auf dieser Grundlage wird das Netz dann angepasst.

Mathematisch lässt sich das Netz als Gleichung darstellen: 

$y1 + b1 ∗ y2 + b2 ∗ y3 + . . . + bn−1 ∗ yn = Output$

$yn = dn ∗f(x)$

y 􏰀 Neuron
b 􏰀 Bias
d 􏰀 Gewichtung der Zelle
f(x) 􏰀 Aktivierungsfunktion der Zelle

Jeder Wert der Gleichung stellt dabei eine Matrix mit den einzelnen Werten der jeweiligen Schicht dar. Die Ausgabe wird nun mit dem Erwarteten Ergebnis vergleichen. Dabei können aus der Differenz die Kosten der Funktion berechnen werden.

Lösung − Output = Kosten

Da die Kosten den Abstand zum gewünschten Ergebnis darstellen ist es Ziel dieser Endgleichung, die Kosten zu minimieren. Dafür können Gewichtungen und Bias angepasst werden, wodurch ein Optimierungsproblem mit t Unbekannten entsteht. Diese Unbekannten werden nun mit jedem Training besser und besser an das Ziel angepasst.

Für diesen Lernprozess, wird ein Algorithmus namens Backpropagation genutzt. Streng nach dem Grundsatz „Neurons that Fire together, Wire together”geht man dabei, vom Output aus, jede Schicht durch und gibt jeder Gewichtung eine Richtung, in die Sie sich entwickeln soll.

Da eine solche Berechnung über alle Trainingsdaten sehr lange brauchen würde, werde die gegebenen Trainingsdaten in Batches zusammengefasst.

Zu Beginn werden alle Gewichtungen und Bias zufällig gesetzt.

Führt man dieses Training nun über alle Testdaten hinweg durch, so erhält man eine Funktion bzw. ein Modell, welches die Testdaten möglichst gut lösen kann. Wie dieses Netz dies tut ist großenteils vom Zufall bestimmt, die Neuronen können jedoch mit unterschiedlichsten Zelltypen und Aktivierungsfunktionen angepasst werden, so dass Sie das gewünschte Ziel am besten erreichen können.

Ein Problem dieses Ansatzes ist es, dass nicht unbedingt das perfekte Minimum erreicht wird. Es kann sich immer auch um ein lokales Minimum handeln.

Ein allgemeines Problem ist das Over Fitting. Dabei spezialisiert sich das Netz zu stark auf die Trainingsdaten und kann nur noch diese lösen.

## PDF

PDF ist ein plattformunabhängiges Dateiformat und wurden 1993 von Adobe Inc. entwickelt und veröffentlicht. Es ist dabei Teil des offenen Standards nach ISO 32000.

 

Laut Aussage von Adobe sind heute bis zu 1,6 Milliarden Dokumente in PDF Form in Umlauf.

Ein PDF Dokument kann dabei, je nach Version, mehrere hundert Seiten umfassen:

 

\   bis Version 3: 45 Zoll × 45 Zoll (1 143 m × 1 143 m)

\   bis Version 6: 200 Zoll × 200 Zoll (5 080 m × 5 080 m)

\   ab Version 7: 15.000.000 Zoll × 15.000.000 Zoll (381 km × 381 km)

In PDF Dokumenten werden alle Dateien als nummerierte Objekte abgespeichert. Diese können dann auch Eigenschaften haben, zum Beispiel das Sperren von gewissen Operationen wie dem Drucken. Dies ist jedoch nur ein Merkmal, welches vom Reader umgesetzt werden muss und damit leicht umgangen werden kann.

Objekte können dabei auch Formulare oder JavaScript Code enthalten.



Das PDF-Format bestehen aus vier Bestandteilen:

Im *Header* wird die Versions Nummer des PDF gespeichert. Ihm folgt der *Body* welcher alle Objekte des Dokuments enthält.

Auf diese Objekte wird in der folgenden *Xref Sektion* verwiesen und es wird eine Reihenfolge festgelegt. 

Das Dokument endet mit dem *Trailer*, welcher das Root Objekt des Dokumentes darstellt. Hier wird wiederum auf die *Xref Sektion* verwiesen.

Dabei ist zu beachten, dass PDFs nicht von oben nach unten, sondern von unten nach oben geladen und interpretiert werden.

Moderne PDF Reader können zusätzlich Notizen in PDFs einfügen. Dabei werden neue Objekte an das bestehende PDF angesetzt und neue Trailer und Xref Sektionen hinzugefügt. Die alten bleiben dabei bestehen, nur die Verweise werden geändert. Dabei können Objekte auch neu definiert oder ersetzt werden. Dies nennt man Inkrementelles Update.

PDFs können auch signiert werden. Dabei wird ein neues Objekt eingefügt, welches die Prüfsumme enthält. Die Prüfsumme wird dabei aus dem ganzen Dokument gebildet.

Man kann jedoch trotzdem noch Inkrementelle Updates durchführen, die Signatur wird dabei nicht beeinträchtigt. 

Texte innerhalb eines PDF können verschlüsselt werden. Dabei werden jedoch nur die entsprechenden Texte verschlüsselt. Die entsprechenden Objekte können immer noch neu angeordnet oder verändert werden.



+++

# Bisherige Forschung

+++


# Hauptteil
## Prozessschritte und Tests
### Finden der Tabelle
#### Bildbearbeitung
#### Object Detection
##### Kleine Geschichte der Object Detection
#### Yolo Netz 
#### Ergebnis
### OCR

Die Schrifterkennung soll aus der gefundenen Tabelle die Wörter, Zahlen und Buchstaben extrahieren. Die Theoretische Grundlage ist dabei keinesfalls neu.

Bereits 1958 erstellten Frank Rosenblatt, Charles Wightman in Zusammenarbeit mit dem MIT und dem Ünited States Office of Naval Research”das ”Mark 1 perceptron”. Mehr noch ein physischer Computer als eine Software, konnte dieser bereits einfache Ziffern der Maße 20 x 20 Pixeln erkennen. Das zugrundeliegende Verfahren wurde seitdem immer weiter verbessert, und ist heute ein gut erforschtes Feld mit vielen verschiedenen Lösungen.

Für dieses Projekt wurden mehrere freie Tools für die Schrifterkennung getestet. Im folgenden wird als Beispiel das Tool Tesseract weiter beleuchtet. Ursprünglich sollten auch noch weitere bestehende Methoden wie die Tools Tabula und Excalibur getestet werden, allerdings können diese nur mit Textbasierten PDFs genutzt werden. Da wir aber auch mit Dokumenten arbeiten bei denen diese Informationen nicht vorliegen, sind diese für unsere Zwecke nicht geeignet.

Tesseract ist eine von Google Entwickelte freie Texterkennungssoftware. Sie kann Textzeichen und Textzeilen erkennen, sowie Layoutanalysen durchführen. Dabei beherrscht das Programm mehr als 100 Sprachen, sowie mehrere verschiedene Schriften wie Chinesisch, Arabisch oder Griechisch. Nach Aussage eines Test der Zeitschrift c’t (QUELLE?) nutzt Google das Tool selbst für eigene Produkte wie Google Books. Dabei soll das Tool an ähnliche Erkennungsraten und Verarbeitungsgeschwindigkeiten wie kommerzielle Tools herankommen. Auf welcher Grundlage diese Aussagen getroffen wurden oder auf welche Tools sich bezogen wird wird in diesem Test leider nicht genannt. Für die Nutzung in diesem Projekt sollte die Leistung dabei jedoch trotzdem ausreichend sein. In ersten Tests zeigte sich die Einschränkung des Tools. Zeichen wie das Doller Zeichen ($) werden gerne als 5 oder gar nicht erkannt. Außerdem arbeitet das Tool nur bedingt mit Tabellen. Spalten werden gerne im Output voneinander getrennt, was dazu führt das der Output nur noch bedingt verständlich ist.

Im Bereich der Schrifterkennung gibt es auch einige Kommerzielle Tools, wie z.b. Amazon Rekognition oder Googles OCR. Diese sind in der Regel deutlich treffsicherer als freie Tools, haben jedoch auch Nachteile.



#### Vergleich Online und Offline



#### Rechtliche und Technische Betrachtung

Die meisten betrachteten Tools sind Online Services. Dies bedeutet, dass alle zu verarbeitenden Dokumente zunächst hochgeladen werden müssen und auf den Servern des Anbieters verarbeitet werden. Dies bedeutet, dass alle Tools auf eine Online Nutzung ausgelegt werden müssen und nur mit Verbindung zum Server funktionieren. Dies schränkt eine Nutzung auf Mobilen Geräten oder in abgeschotteten Intranets ein.

Bei der Verarbeitung von Daten müssen in Deutschland, abhängig von Art und Schutzbedarf, gewisse Regelungen zur Informationssicherheit und zum Datenschutz beachtet werden. Das Bundesamt für Sicherheit in der Informationstechnik (kurz BSI) hat hierfür Standards erstellt mit denen eine Risikoanalyse durchgeführt werden kann. Anforderungen und Bewertungen werden dabei in Reihe 2700-x der ISO Normen beschrieben. In Deutschland gilt ebenfalls noch die Datenschutz-Grundverordnung (kurz DSGVO). Diese Europäische Richtlinie vereinheitlicht die Regelungen zur Verarbeitung von personenbezogenen Daten in Europa und beschreibt unter anderem die Pflichten des Anbieters. Dabei gilt nach Artikel 25 der DSGVO, dass der Anbieter des Endsystems den Datenschutz im Rahmen seiner technischen Möglichkeiten umsetzten muss. Was Datenschutz eigentlich ist, wird dabei genauer in Art. 5 bis 9 beschrieben.

Bei der hier angesprochenen Nutzung von Cloud Diensten werden diese Regelungen noch erweitert. Dazu steht in Art. 44 DSGVO, dass die Übertragung von Daten an ein Drittland oder eine internationale Organisation nur zulässig ist, wenn sichergestellt werden kann, dass die Bemühungen zum Datenschutz eingehalten werden.

Das BSI hat hierfür den ”Mindeststandart des BSI zur Nutzung externer Cloud-Dienste”herausgegeben. Dieser richtet sich nach § 8 Absatz 1 Satz 1 des Gesetztes über das Bundesamt für Sicherheit in der Informationstechnik (kurz BSIG). Dabei müssen alle Daten
 in vorgegebene Kategorien einsortiert werden:

- Kategorie 1: Privat und Dienstgeheimnisse
- Kategorie 2: personenbezogene Daten
- Kategorie 3: Verschlusssachen gemäß allgemeiner Verwaltungsvorschrift
- Kategorie 4: sonstige Daten welche nicht in die vorherigen Kategorien einsortiert werden konnten.

Je nach Kategorisierung der Daten müssen die Cloud Dienste dann die Vorgaben des Änforderungskatalog Cloud Computing des BSI”(kurz C5) erfüllen. Darin werden Auswahlprozesse für den Cloud Anbieter, sowie empfohlene vertragliche Regelungen festgelegt.

### Kontext Detektion

- [ ] Warum?
- [ ] Wie umgesetzt?
    - [ ] klassischer Algorithmus (Entscheidungsbaum)
    - [ ] Tensorflow
    - [ ] Gegenüberstellung der beiden Methoden
- [ ] IST KI WIRCKLICH NOTWENDIG?

Dafür wurden 5 Möglichkeiten definiert. 

1. Zahlen
2. Text
3. Angaben in Prozent
4. Physikalisch Angaben 
5. Adressen
6. Datum



### Prototypische Umsetzung

#### App
#### Server

+++

# Schluss
## Fazit
## Ausblick und Verbesserungen
*Quantencomputer*