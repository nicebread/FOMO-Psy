# Course material for "Formale Modellierung in der Psychologie"

*Note: The material will (initially) be a crude mixture of German and English. Your mileage may vary.*

Im Empirisch-psychologischen Praktikum "Formale Modellierung in der Psychologie" tauchen die Studierenden in die Welt der quantitativen Darstellung psychologischer Theorien ein. Dabei geht es nicht um die quantitative Auswertung von Daten mit Hilfe statistischer Modelle, sondern um Theorie und datengenerierende Modelle, die so präzise sind, dass man konkrete Daten vorhersagen kann.
Als eine Reaktion auf die Replikationskrise wurde der Ruf nach besseren Theorien laut, mit dem Ziel, verbale und konzeptionelle Theorien in formale, mathematische Modelle zu übersetzen. Diese Modelle dienen mehreren Zwecken: Sie ermöglichen eine rigorose Prüfung von Hypothesen, bieten klarere Vorhersagen und bilden einen Rahmen, um scheinbar disparate Ergebnisse zu vereinheitlichen. Außerdem schärfen sie den Blick auf "Leerstellen" in den meist hoffnungslos unterspezifizierten Theorien in der Psychologie.

In diesem Kurs werden die Studierenden in die grundlegenden Prinzipien der formalen Modellierung und ihre verschiedenen Varianten eingeführt (z.B. mathematische Modelle, Regelkreismodelle, agentenbasierte Modelle) und mit den Werkzeugen ausgestattet, die sie benötigen, um aus vorhandenen verbalen Theorien Modelle abzuleiten. 
Entsprechend werden wir uns viel mit der Implementierung in Programmiersprachen befassen. Wir werden dabei vermutlich viel in R programmieren, ggf. auch in NetLogo (für ABMs).

Wir werden versuchen, kollaborativ verbale psychologische Theorien soweit zu formalisieren, dass man sie in ein datengenerierendes Modell übersetzen und implementieren kann, um die generierten Daten dann zur Prüfung mit echten Daten zu vergleichen.

Wir werden Aspekte der Qualitätssicherung bei dieser eher ungewöhnlichen Forschungsrichtung diskutieren und anwenden (Reproduzierbarkeit, Versionskontrolle, Sensitivitätsanalysen, gut dokumentierter Code / unit testing).

Das Empra stellt etwas höhere Anforderungen an mathematisches und formales Denken, sowie ihre Programmierfähigkeit. Als Minimum werden die R-Kenntnisse vorausgesetzt, die im Rahmen der Seminare zu Statistik 1 und 2 gelehrt wurden, sowie die Bereitschaft, sich auch selbständig (anhand von bereitgestelltem Material) in Themen der Programmierung einzuarbeiten.

## Compilation / dependencies

You need:

- quarto > 1.3.45
- [Font Awesome Extension for Quarto](https://github.com/quarto-ext/fontawesome)
- [Attribution Extension](https://github.com/quarto-ext/attribution)
- [Quarto clean theme](https://github.com/grantmcdermott/quarto-revealjs-clean/tree/main)

Run the following commands in the directory of your presentation:

```
quarto add quarto-ext/attribution
quarto add quarto-ext/fontawesome
quarto install extension grantmcdermott/quarto-revealjs-clean
```

## Notes to self:

- The default presentation size is 1050 x 700.

## Notes

- Operationalisierung gehört zur Theoriearbeit
- 