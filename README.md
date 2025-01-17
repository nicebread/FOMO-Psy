# Course material for "Formale Modellierung in der Psychologie"

This is the source code of the Quarto website. See the rendered website at [https://nicebread.github.io/FOMO-Psy/](https://nicebread.github.io/FOMO-Psy/).

*Note: The material will (initially) be a crude mixture of German and English. Your mileage may vary.*

## Compilation / dependencies

You need:

- quarto > 1.3.45
- [Font Awesome Extension for Quarto](https://github.com/quarto-ext/fontawesome)
- [Attribution Extension](https://github.com/quarto-ext/attribution)
- The [nicetheme](https://github.com/nicebread/quarto-FS) theme, which is based on the [Quarto clean theme](https://github.com/grantmcdermott/quarto-revealjs-clean/tree/main)

Run the following commands in the project's root directory:

```
quarto add quarto-ext/attribution
quarto add quarto-ext/fontawesome
quarto install extension nicebread/quarto-FS

quarto update extension nicebread/quarto-FS
```

## Notes to self:

- The default presentation size is 1050 x 700.
- To publish online, run `quarto publish gh-pages` locally.
- Right arrow (→): `&rarr;`
- Double headed arrow (↔): `&harr;`
- Full processing:

```
quarto render
quarto publish gh-pages

# With this option, it does not wait until the browser opens.
quarto publish gh-pages --no-browser
```

To make this website/repository reusable for multiple runs of the course, I define some the course-specific content (e.g. specific links) as parameters in the `_variables.yml` file. This way, I can easily change the content for the next iteration of the course.
Reference the variables in any .qmd file by using `{{< var var_name >}}`, e.g. `{{< var homework_repo >}}`.

### Resources

- https://github.com/coatless-quarto/r-shinylive-demo

