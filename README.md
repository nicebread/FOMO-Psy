# Course material for "Formale Modellierung in der Psychologie"

This is the source code. See the rendered website at [https://nicebread.github.io/FOMO-Psy/](https://nicebread.github.io/FOMO-Psy/).

*Note: The material will (initially) be a crude mixture of German and English. Your mileage may vary.*

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
- To publish online, run `quarto publish gh-pages` locally.
- Right arrow (→): &rarr;
- Double headed arrow (↔): &harr;

## Resources

- https://github.com/coatless-quarto/r-shinylive-demo