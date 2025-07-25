## Minor todos:

- fix order in lectures table
- add the term "generative model" at an appropriate place

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

# UTOS generalizability group exercise:

Consider this statement: In a meta-analysis of 80 studies, a strong evidence was found for the phenomenon (d = 0.75, p < .0001). It had over 12,000 participants, therefore we can assume a good generalizability along the U(nits) dimensions.

Think - Pair - Share.

Answer: No! If all 12,000 participants were female psychology students between 18 and 22 from the US, then we know nearly nothing about the generalizability along the U(nits) dimension.

--> Provide exemplary good UTOS section.
Show first the evidence ("in general, there seems to be a phenomenon") and *then* the generalizability check along the UTOS dimensions. (If there is no base phenomenon in the first place, it's futile to check its generalizability and robustness).


# Formalization exercise:

"Channels of Communication in Small Groups"  (in 1951) https://www.jstor.org/stable/2088276 If you have 5 person in a panel, uniform distribution of time would be 20% each. In reality, it's more 44%, 22%, 15%, 11%,  9%, i.e. what is called "discrete harmonic" (or Zipf distribution with power index of 1)