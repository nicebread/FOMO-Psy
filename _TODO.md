## TODO S08 or S09

So far, we worked all in the same repo, in subfolders.
Now that you create your own repository for your theory, we want to follow some best practices for repository structure.

--> show FAIR theory
--> show CFF and semver


## How many VAST displays are created for practicing? Reduce?

Currently, we have 3 VAST displays to be created in the homeworks:

1. From S2 --> S3: Individuals create a VAST display for the concept "diffusion of resposibility" (based on Latane & Darley, 1968)
   1. Learning goal: Get acquainted to the VAST system. Next time: Make the underlying verbal statements a bit easier/less complex.
2. From S3 --> S4: Groups create a VAST display for the bystander effect and parts of the theory
   1. Learning goal: Realize the difficulties in formalizing a narrative. Discuss the model in a group. In particular the 5-step model is difficult to model (and probably leads to many different solutions).
   2. Next time: Make clear what the goal is: Formalize what the authors say - including their vagueness and inconsistency! Not "fill the gaps" but rather "show the gaps". (We will fil the gaps in the next formalization step exercise)
3. From S4 --> S5: Groups create a VAST display for a reduced and extended bystander model ("dangerousness effect").
   1. Learning goal: Now we aim for a precise model. We fill the gaps (and thereby deviate from the original sources). Do not have c, p, or t relationships that originate from a HOC or lead to a HOC.

--> I think the repeated exercise with different foci makes sense. Maybe make the learning goals clearer.


## Add LLM support

von Caspar Schumacher:

> bin gerade zufällig auf diesen neuen Preprint von Rui & Wulff (die vom „LLM to solve Jingle-Jangle“-Paper) gestoßen: https://arxiv.org/abs/2511.00206
> Unter 2.2 (S. 6) beschreiben sie ziemlich genau die Problematik, die wir uns auch im Seminar anschauen. Voll cool zu sehen, wie das Thema gerade an Traktion gewinnt.
Erste Versuche zur Formalisierung mit LLMs allein gibt es übrigens auch schon: https://arxiv.org/abs/2502.00879

(a) Use LLMs to aid in VAST development.
(b) Use LLMs to translate a VAST display into a formal model
(c) Skip step (a) and directly go from "a bunch of PDFs" to "formal model"? But for *understanding* a theory (and to make it explanatory), I think we need step a.


## Structural changes (next time)

- S2: Skip the "intro2" lecture, and rather let the groups start working on their VAST displays and familiarize themselves with draw.io. Show them how to install the custom shapes for VAST displays.
- Move Intro2 lecture entirely to S3.
  - But: S3 (with the second half of Intro2) was already quite packed with input - would be better with more interaction


## Minor todos:

- Add Lange Checklist somewhere
- Read Oude Maatman, F. (2021, July 12). Psychology's Theory Crisis, and Why Formal Modelling Cannot Solve It. https://doi.org/10.31234/osf.io/puqvs


## Git tutorial

EIn typisches Problem: Sie lernen im Tutorial erst mal eine Fork von dem Repositorium zu machen.
Wenn sie dann anfangen im Homework-Repositorium zu arbeiten, machen manche davon erst mal eine Fork. Sie sollen aber alle im selben Repositorium arbeiten.

In R-Studio erscheint der Git-Tab nur, wenn ein R-Project erstellt wurde.


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


# Formalization exercise:

"Channels of Communication in Small Groups"  (in 1951) https://www.jstor.org/stable/2088276 If you have 5 person in a panel, uniform distribution of time would be 20% each. In reality, it's more 44%, 22%, 15%, 11%,  9%, i.e. what is called "discrete harmonic" (or Zipf distribution with power index of 1)