# Abstract
# Einleitung
In Zeiten von Industrie 4.0 und Digitalisierung werden immer größere Datenmengen elektronisch gespeichert und verarbeitet. Da bisherige Speicherungen zumeist ausschließlich in Papierform vorlagen, werden Systeme benötigt, welche diese in eine digitale Form übersetzten. Das Deutsche Zentrum für Luft und Raumfahrt entwickelt für Technische Dokumentationen ein System, welches diese Aufgabe erfüllen soll.

## Problemstellung und Zielsetzung
Aufgrund der hohen Vielfältigkeit im Aussehen und Aufbau von Tabellen, ist es auch mit modernen Algorithmen schwer eine Tabelle zu erkennen und ihre Daten zu extrahieren. 
Darauf aufbauend ist das Hauptziel des Projektes die Realisierung eines Systems zur automatischen Datenerfassung von Tabellen und ihrem Inhalt mit der Hilfe Maschinellen Lernens.

## Vorgehen und Aufbau
Zur Lösung dieser Aufgabe wurde eine Pipeline erstellt in der die einzelnen Schritte für ein solches System analysiert, entwickelt und beleuchtet wurden. 

Nach einer Definition der Grundlagen in Kapitel 1 wird in Kapitel 2 der Stand der bestehenden Forschung betrachtet. In Kapitel 3 werden die Schritte der Pipeline genauer betrachtet welche in Kapitel 4 im Zusammenhang einer Prototypische Umsetzung beleuchtet werden.
Mit Kapitel 5 wird die Arbeit abgeschlossen und ein Ausblick auf mögliche Zukünftige Verbesserungen gegeben.

Die gesamte Entwicklung wurde nach Scrum Prinzipien durchgeführt. Dabei wurden die einzelnen Experimente in je einem Sprint umgesetzt. Am Ende eines jeden Sprints wurde das Projekt auf Grundlage der bisherigen Ergebnisse neu geplant. 
Durch diese ständige Überprüfung und Anpassung konnte die Pipeline stets an die neusten Erkentnisse angepasst werden.

## Das Deutsche Zentrum für Luft- und Raumfahrt

Das Deutsches Zentrum für Luft- und Raumfahrt (DLR) ist ein Forschungszentrum der Bundesrepublik Deutschland. Es umfasst 8700 Mitarbeiter, verteilt auf 28 Standorte in Deutschland, sowie mehrere Test- und Betriebsanlagen. Es existieren außerdem 4 Standorte in Brüssel, Paris, Tokyo und Washington DC. Dabei ist das DLR noch in 51 Institute und 150 Großforschungsanlagen aufgeteilt, welche je ihre eigenen Schwerpunkte setzten.

Das DLR forscht in mehreren Bereichen, darunter Raumfahrt, Luftfahrt sowie Verkehr und Energie. Ein weiterer Bereich ist der der Digitalisierung und der Künstlichen Intelligenz. Dabei arbeitet das DLR eng mit internationalen Partnern zusammen und ist zum Beispiel verantwortlich für die Überwachung und Planung von Raumlabor Columbus, einem Multifunktionslabor auf der ISS (International Space Station). 

Am Standort Jena ist das Institut für Datenwissenschaften untergebracht. Hier werden Lösungen für neue Herausforderungen der Digitalisierungsära erforscht. Neben den Bereichen Datenmanagment, IT-Sicherheit und Smart Systems wird hier auch an Bürgerwissenschaften geforscht, welches sich zum Ziel gesetzt hat die Wissenschaft besser in die Gesellschaft zu bringen.

+++

# Vorbereitung

## Genutzte Tools und Services

### Jupyter Notebook

Zur Durchführung der einzelnen Experimente wurde das Tool Jupyter Notebook genutzt.
Jupyter Notebook ist ein Web basiertes Tool mit dem die Analyse von Datenbestände vereinfacht wird. Dabei kann Code in Python, C oder Swift zur Analyse genutzt werden. Die Oberfläche wird dabei wie bei einem Dokument verwaltet wobei Code in Blöcke getrennt werden kann. Dadurch können Zwischenergebnisse direkt eingesehen und Blöcke mehrfach berechnet und die Zwischenergebnisse analysiert werden. 

Als Grundlage wurde die COLAB Umgebung der Firma Google genutzt. Hier werden einzelne virtuelle Umgebungen erstellt welche je ein Notebook beinhalten. Die virtuellen Umgebungen können dabei je nach Bedarf mehr oder weniger Rechenleistung bekommen und es können auch eigene Programme neben dem Notebook installiert werden.

### Tensorflow
Tensorflow ist ein Framework zum programmieren von Datenströmen und wird zur Entwicklung von Neuronalen Netzwerken genutzt. Es ist in C++ geschrieben und kann mit verschiedensten Sprachen genutzt werden. 
Entwickelt von Google, wird das Framework dort in Forschung und Produktivbetrieb in zahlreichen Projekten verwendet. 

Keras ist eine Deep Learning Library. Sie wurde von zunächst von François Chollet initiert und später als Kommunity Projekt weitergeführt. Sie bietet dabei viele nützliche Funktionen um ein Neuronales Netz zu entwickeln. Seit Tensorflow 1.4 ist Keras dabei auch Teil des Tensorflow Frameworks und vereinfacht dessen Nutzung.

### OpenCV

OpenCV ist eine von Willow Garage entwickelte Library welche entzwischen von Intel gepflegt wird. 
Geschrieben in Java, Python, C und C++ stellt die Libary dabei Algorithmen für die Bildverarbeitung und Computer Vision.

### Python und Swift

Python ist eine interpretierte Programmiersprache, und wird meistens als Skriptsprache verwendet. Sie hat eine sehr leicht lesbare Syntax und kann sehr einfach Fremdcode laden, womit das Schreiben eines schnellen Skriptes stark vereinfacht wird.
Diese Faktoren machen Python zur optimalen Sprache zum Testen von Ideen, jedoch ist die Sprache nicht für größere Projekte ausgelegt.

In den Tests zeigte sich, dass die Arbeitsgeschwindigkeit nach dem Transformieren von ca. 100 Bildern stark sinkt. Daher wurden mehrere Ideen geprüft, um dieses Problem zu lösen. Eine Idee war es auf die Sprache Swift zu wechseln. 

Swift ist eine Multiparadimische Compilersprache, welche auf c basiert. Aufgrund dessen, ist Sie bei größeren Projekten deutlich performanter als Python, kann jedoch trotzdem Python Librarys einbinden und nutzen. Da wir in Swift ebenfalls die Tensorflow Library verwenden, ist das Ergebnis in seiner Form gleich.

## TestDaten

Um die bereits bestehenden Tools, Programme oder Systeme zu testen oder einzurichten werden Testdaten benötigt.

Hierfür stehen einige Datenpools zu Verfügung, welche sich in Umfang und Aufbau unterscheiden. Dabei wurden Datenblätter von Herstellern von Raumfahrtkomponenten für DLR und ESA sowie ein Datensatz der Firma IBM Australia genutzt, welche aus mehreren Tausend Dokumente besteht. 

Die Dokumente müssen dabei vor der Nutzung noch manuell vorbereitet werden. 

## Neuronale Netze
Ein Künstliches Neuronales Netz (KNN) ist eine Methode zur Informationsverarbeitung. Dabei wird, nahe dem Vorbild des Gehirns, ein Netz aus Neuronen erzeugt.
Ein Neuron ist dabei ein Object, welches aus einem Input einen Output erzeugt. Die Ausgabe wird dabei durch eine Aktivierungsfunktion und den Aufbau des Neurons bestimmt.
Das Netz besteht aus mehreren Schichten. Jede Schicht besteht aus mehreren Neuronen, welche mit den Neuronen der nächsten Schicht verbunden sind. 

Jede Verknüpfung zwischen den Neuronen, sowie die Neuronen selbst haben einen Bias welcher eine Gewichtung des entsprechenden Objects darstellt. 

Damit dieses Netz nun eine Aufgabe erfüllen kann, wird es trainiert. Das Netz kann dabei lernen, indem es die Verbindungen zwischen den Neuronen verändert, die Bias anpasst oder, in bestimmten Netzen, neue Neuronen erstellt.
Im folgenden wird dies an einem Trainingsprozess betrachtet welcher sich Überwachtes lernen nennt:
Hierbei werden zunächst Testdaten in das entsprechende Netz gegeben und das Ergebnis mit der gegebenen Lösung verglichen. Auf dieser Grundlage werden die Bias des Netzes angepasst. Es ist hierbei nicht vorgesehen den grundlegenden Aufbau des Netzes zu verändern.

Mathematisch lässt sich das Netz als Gleichung darstellen: 
$y_1 + b_1 ∗ y_2 + b_2 ∗ y_3 + . . . + b_{n−1} ∗ y_n = Output$

y = Neuron
b = Bias
d = Gewichtung der Zelle
f(x) = Aktivierungsfunktion der Zelle

Dabei gilt: $y_n = d_n ∗f(x)$

Jeder Wert der Gleichung stellt dabei eine Matrix mit den einzelnen Werten der jeweiligen Schicht dar. Die Ausgabe wird nun mit dem Erwarteten Ergebnis vergleichen. Aus der Abweichung lassen sich dabei die Kosten der Funktion berechnen.

Lösung − Output = Kosten

Da die Kosten den Abstand zum gewünschten Ergebnis darstellen ist es Ziel dieser Endgleichung, die Kosten zu minimieren. Dafür können Gewichtungen und Bias angepasst werden, wodurch ein Optimierungsproblem mit t Unbekannten entsteht. Diese Unbekannten werden nun mit jedem Training besser und besser an das gewünschte Ziel angepasst.

Für diesen Lernprozess, wird ein Algorithmus namens Backpropagation genutzt. Dabei geht man, vom Output aus, jede Schicht durch und gibt jeder Gewichtung eine Richtung, in die Sie sich entwickeln soll. Diese Richtung wird, je nach Abstand zum Ziel, verstärkt oder verringert so dass sich das System besser anpassen kann und nicht übers Ziel hinausschießt.

Die Anpassung kann dabei Offline oder Online geschehen. Bei der Online Anpassung werden mehrere Beispiele gleichzeitig in ein Netz gegeben und das Ergebnis aufkumuliert. Somit lernt man für alle Trainingsbeispiele gleichzeitig. Beim Offline lernen werden alle Trainingsbeispiele nacheinander genutzt.

Zu Beginn werden alle Gewichtungen und Bias zufällig gesetzt.

Führt man dieses Training nun über alle Testdaten hinweg durch, so erhält man eine Funktion bzw. ein Modell, welches die Testdaten möglichst gut lösen kann. Wie dieses Netz dies tut ist großenteils vom Zufall bestimmt, die Neuronen können jedoch mit unterschiedlichsten Zelltypen und Aktivierungsfunktionen angepasst werden, so dass Sie das gewünschte Ziel am besten erreichen können.

Ein Problem dieses Ansatzes ist es, dass nicht unbedingt das perfekte Minimum erreicht wird. Es kann sich immer auch um ein lokales Minimum handeln.

Ein allgemeines Problem dieser Lernmethode ist das Over Fitting. Dabei spezialisiert sich das Netz zu stark auf die Trainingsdaten wodurch das gelernte nicht mehr allgemein genutzt werden kann.

Um die Optimierung weiter zu unterstützen, können Optimierungsalgorithmen eingesetzt werden. Ein Beispiel hierfür wäre Adam.

### Adam

Adam wurde von Diederik P. Kingma der University of Amsterdam und Jimmy Lei Ba der University Toronto entwickelt. In ihrem Paper bezeichnen Sie diesen Algorithmus als sehr effizient, scallierbar und gut für Probleme geeignet, in welchen viele Parameter genutzt werden. Dabei soll Adam wenig Speicher verbrauchen. Auf Grundlage dieser Eigenschaften wurde Adam für einige Tests eingesetzt.

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

Moderne PDF Reader können zusätzlich Notizen in PDFs einfügen. Dabei werden neue Objekte an das bestehende PDF angesetzt und neue Trailer und Xref Sektionen hinzugefügt. Die alten bleiben dabei bestehen, nur die Verweise werden geändert. Dabei können Objekte auch neu definiert oder ersetzt werden. Dies nennt man Inkrementelles Update. Über diesen Weg lassen sich PDFs auch signieren. 
Dabei wird ein neues Objekt eingefügt, welches die Prüfsumme enthält. Die Prüfsumme wird dabei aus dem ganzen Dokument gebildet.
Man kann jedoch auch nach der Signierung noch Inkrementelle Updates durchführen, die Signatur wird dabei nicht beeinträchtigt. 

Texte innerhalb eines PDF können auch verschlüsselt werden. Dabei werden jedoch nur die Textbausteine verschlüsselt. Die entsprechenden Objekte können immer noch neu angeordnet oder verändert werden.

+++

# Bisherige Forschung

Im folgenden werden einige der bisherigen Forschungen zum Thema der Tabellen Erkennung näher beleuchtet. 

## Tabellen Erkennung mittels Metadaten

Tools wie “Camelot - PDF Table Extraction for Humans” nutzen Metadaten und Code des PDF um daraus Tabellen zu extrahieren. 
Dabei kann entweder nach entsprechenden Strukturen im Code der PDF Dateien gesucht werden, oder nach Markierungen welche bei der Erstellung der Datei hinterlassen wurden.

Diese Methode funktioniert jedoch nur wenn entsprechende Daten vorhanden und korrekt sind. 
Wie zuvor beschrieben, kann ein PDF unterschiedlich zusammengesetzt werden wodurch ein einfacher standart Algorithmus nicht verläßlich ist. Des weiteren besitzten nicht alle PDFs die erforderlichen Daten. Gerade Scans werden meist ohne Erkennung erstellt wodurch diese Methode nichts erkennen kann. 

## Tablenet

Tablenet ist ein Ansatz zur Tabellen Erkennung der Firma  “Tata Cosultancy Services Limited”. Dabei wird ein Deep Learning Model genutzt.
Das Model erhält hier als Input ein Ursprungsdokument und erstellt daraus zwei Masken. Die erste markiert dabei den Bereich der Tabelle, wohingegen die zweite die columns markiert. Mit diesen Masken werden nun alle Texte herausgefiltert, welche außerhalb des Maskenbereichs liegen. Nach eigener Aussage erreicht das Netz dabei eine Genauigkeit von ca. 95%.

Das Orginal Model konnte bei den Recherchen dieser Arbeit nicht gefunden werden, wodurch dieses Ergebniss nicht reproduziert werden konnte. 

## DeepDeSRT

Das DeepDeSRT Netz ist ein Ansatz des “German Research Center for Artificial Intelligence” in Kaiserslautern in Zusammenarbeit mit der “Mannheim University of Applied Sciences” und der “Kaiserslautern University of Technology”. 
Der Ansatz nutzt dabei Deep Learning in Form der Object Erkennung zum Erkennen von Tabellen. Nach eigenen Angaben erreichte der Ansatz dabei eine Präzision von 94%.

Leider wurde auch dieses Model nicht veräffentlicht, wodurch das Ergebniss nicht reproduziert werden konnte.



Dadurch das keins der betrachteten Netze direkt Nutzbar ist, wurde die Methodik mit eigenen Mitteln umgesetzt. 
Durch die Recherche wurde jedoch eine Umsetzung auf Basis des PDF und seiner Codestruktur ausgeschlossen, da die Methodik auch mit Dokumenten funktionieren soll welche z.b. aus Bildern oder Scanns entstanden sind. Daher werden alle Dokumente bereits vor Beginn des Prozesses in Bilddateien umgewandelt. Dadurch wird außerdem die Verwendung vereinfacht.

+++

# Hauptteil - Prozessschritte und Tests



### Finden der Tabelle
#### Bildbearbeitung
#### Object Detection
##### Kleine Geschichte der Object Detection
#### Yolo Netz 
#### Ergebnis
### OCR

Die Schrifterkennung soll aus der gefundenen Tabelle die Wörter, Zahlen und Buchstaben extrahieren.

Die entsprechende Technik wurde bereits 1958 zum ersten mal vorgestellt. Dabei erstellten Frank Rosenblatt und Charles Wightman in Zusammenarbeit mit dem MIT und dem Ünited States Office of Naval Research das Mark 1 perceptron. Damals noch eher in Form eines physischen Computers als einer Software, konnte dieser bereits einfache Ziffern in Bildern der Maße 20 x 20 Pixeln erkennen. Das zugrundeliegende Verfahren wurde seitdem immer weiter verbessert, und ist heute ein gut erforschtes Feld mit vielen verschiedenen Lösungen.

Für dieses Projekt wurden mehrere freie Tools für die Schrifterkennung getestet. Besonders stachen dabei das Tool Tesseract und die Vision Library des IOS Systems hervor. Beide sind offline Lösungen. 

Tesseract ist eine von Google Entwickelte freie Texterkennungssoftware. Sie kann Textzeichen und Textzeilen erkennen, sowie Layoutanalysen durchführen. Dabei beherrscht das Programm mehr als 100 Sprachen, sowie mehrere verschiedene Schriften wie Chinesisch, Arabisch oder Griechisch. Nach Aussage eines Test der Zeitschrift c’t (QUELLE?) nutzt Google das Tool selbst für eigene Produkte wie Google Books. Dabei soll das Tool an ähnliche Erkennungsraten und Verarbeitungsgeschwindigkeiten wie kommerzielle Tools herankommen. Auf welcher Grundlage diese Aussagen getroffen wurden oder auf welche Tools sich bezogen wird wird in diesem Test leider nicht genannt. Für die Nutzung in diesem Projekt sollte die Leistung dabei jedoch trotzdem ausreichend sein. In ersten Tests zeigte sich die Einschränkung des Tools. Zeichen wie das Doller Zeichen ($) werden gerne als 5 oder gar nicht erkannt. 

Das Vision Framework des IOS Systems bietet verschiedene Funktionen, unter anderem eine eigene Texterkennung. Die Implementierung ist dabei im IOS System standardmäßig vorhanden und für den Einsatz optimiert. 

Beide Tools können neben den erkannten Zeichen auch die Positionen der erkannten Boxen ausgeben. Mit Hilfe eines einfachen Algorithmus kann daraus wieder die Ursprungstabelle exportiert werden.

Im Bereich der Schrifterkennung gibt es auch einige online Tools, wie z.b. Amazon Rekognition oder Googles OCR. Diese sind in der Regel deutlich treffsicherer als freie Tools, haben jedoch auch entscheidende Nachteile.

#### Rechtliche und Technische Betrachtung von Online Lösungen

Die zuletzt betrachteten Tools sind Online Services. Dies bedeutet, dass alle zu verarbeitenden Dokumente zunächst hochgeladen werden müssen und auf den Servern des Anbieters verarbeitet werden. Dies bedeutet, dass alle Tools auf eine Online Nutzung ausgelegt werden müssen und nur mit Verbindung zum Server funktionieren. Dies schränkt eine Nutzung auf Mobilen Geräten oder in abgeschotteten Intranets ein.

Bei der Verarbeitung von Daten müssen in Deutschland, abhängig von Art und Schutzbedarf, gewisse Regelungen zur Informationssicherheit und zum Datenschutz beachtet werden. Das Bundesamt für Sicherheit in der Informationstechnik (kurz BSI) hat hierfür Standards erstellt mit denen eine Risikoanalyse durchgeführt werden kann. Anforderungen und Bewertungen werden dabei in Reihe 2700-x der ISO Normen beschrieben. In Deutschland gilt ebenfalls noch die Datenschutz-Grundverordnung (kurz DSGVO). Diese Europäische Richtlinie vereinheitlicht die Regelungen zur Verarbeitung von personenbezogenen Daten in Europa und beschreibt unter anderem die Pflichten des Anbieters. Dabei gilt nach Artikel 25 der DSGVO, dass der Anbieter des Endsystems den Datenschutz im Rahmen seiner technischen Möglichkeiten umsetzten muss. Was Datenschutz eigentlich ist, wird dabei genauer in Art. 5 bis 9 beschrieben.

Bei der hier angesprochenen Nutzung von Cloud Diensten werden diese Regelungen noch erweitert. Dazu steht in Art. 44 DSGVO, dass die Übertragung von Daten an ein Drittland oder eine internationale Organisation nur zulässig ist, wenn sichergestellt werden kann, dass die Bemühungen zum Datenschutz eingehalten werden.

Das BSI hat hierfür den ”Mindeststandart des BSI zur Nutzung externer Cloud-Dienste”herausgegeben. Dieser richtet sich nach § 8 Absatz 1 Satz 1 des Gesetztes über das Bundesamt für Sicherheit in der Informationstechnik (kurz BSIG). Dabei müssen alle Daten
 in vorgegebene Kategorien einsortiert werden:

- Kategorie 1: Privat und Dienstgeheimnisse
- Kategorie 2: personenbezogene Daten
- Kategorie 3: Verschlusssachen gemäß allgemeiner Verwaltungsvorschrift
- Kategorie 4: sonstige Daten welche nicht in die vorherigen Kategorien einsortiert werden konnten.

Je nach Kategorisierung der Daten müssen die Cloud Dienste dann die Vorgaben des Änforderungskatalog Cloud Computing des BSI”(kurz C5) erfüllen. Darin werden Auswahlprozesse für den Cloud Anbieter, sowie empfohlene vertragliche Regelungen festgelegt.

Auf Grundlage dieser Regelungen und extra Anforderungen, wurde entschieden für diese Arbeit die oben genannten Offline Tools zu nutzen.

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

Um eine Real Anwendung zu demonstrieren, wurde die Pipeline in einem Prototyp umgesetzt. Dieser wurde in Form einer IPhone Application ausgearbeitet um ein reales Beispiel zu bilden.
Da sich nicht alle Teile der Pipeline im IOS System umsetzten lassen, wurden Teile wie die Tabellen Erkennung durch das YOLO Netz an eine Server-Applikation ausgelagert. 
#### Server
Die Server-Applikation wurde in Python mit dem Flask Framework umgesetzt. Mit Flask lassen sich einfach APIs erstellen, welche als Schnittstelle zwischen dem Server und der App fungiert. 

Der Server übernimmt hier die Umsetzung des YOLO Netzes, sowie die Kontext Detektion. Dafür sendet die App ein entsprechendes Bild oder eine entsprechende Zeichenkette an den Server und erhält eine entsprechende Antwort.
#### App

+++

# Schluss
## Fazit
## Ausblick und Verbesserungen
*Quantencomputer*