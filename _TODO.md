## Minor todos:

- fix order of sessions in overview table
- fix links in lectures table
- (re)move thinking tools?
- add date to citation / about page

## Add folder structure to it-tools lecture

With all relevant files:

|- README.md (this should link to any associated Google docs, if applicable)
|- CITATION.cff
|- VAST_display.drawio
|- simulation
     |- raw_data (a subfolder with empirical raw data, if applicable)
	      |- dat.csv
	 |- README.md
     |- functions.R (or any other name)
|- manuscript
     |- manuscript.qmd



## Ablauf Intro 2:

Nächstes Mal zuerst die Bischof-Notation einführen, und dann erst die Unterscheidung zwischen fixed und free parameters.
Dann kann man das sofort sinnvoll visualisieren.
Zwei Varianten für fixed parameters: Entweder als hard-coded constant im Block, oder als freier Eingang in einen Block, der aber einen anderen visuellen Stil hat (um klar zumachen, dass es keine Variable ist; z.B. gestrichelt).


## THEORY versioning
minor:
- do we require (a) perfect identity of predictions, or (b) "substantively the same"?
	- if (a), nearly every change would be a "major" change
	- "substantively" is vague -> if the interpretation of all previous studies does not change, it is not a substantial change
	- no qualitative changes (only minor quantitative) --> what is a qualitative change?
- adding variables probably always changes the specific predictions (at least a little bit)

Mittelwert vs. Range -> wenn es unter einer Änderung epsilon bleibt, ist es minor; epslion muss definiert werden.


Every major change needs a new peer review.

# van Dongen

Kann eine Theorie *zu* präzise sein? Dann würde man extrem viele arbiträre Festlegeungen treffen, die dann im Core der Theorie sind, aber eigentlich nur Overfitting oder arbiträr.


# Beispiele:

Callaway, F., Hardy, M., & Griffiths, T. L. (2023). Optimal nudging for cognitively bounded agents: A framework for modeling, predicting, and controlling the effects of choice architectures. Psychological Review. Advance online publication. https://doi.org/10.1037/rev0000445

# Demiurg 2

See Jarecki et al 2020:
"The implication is that process models need to be simple and respect capacity limits or link the proposed operations directly to psychological constructs"

# Data models vs. theoretical models

"Could a Neuroscientist Understand a Microprocessor?":
https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005268

Eiko Fried: https://www.tandfonline.com/doi/full/10.1080/1047840X.2020.1854011
