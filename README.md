[![DOI](https://zenodo.org/badge/693075520.svg)](https://doi.org/10.5281/zenodo.15703574)

# Course material for "Introduction to Formal modeling in Psychology" (FOMO-Psy)

This is the source code of the Quarto website. See the rendered website at [https://nicebread.github.io/FOMO-Psy/](https://nicebread.github.io/FOMO-Psy/).

*Note: While most content is in English, some administrative parts are in German.*

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

- The default presentation slide size is 1050 x 700.
- To publish online, run `quarto publish gh-pages` locally.
- Right arrow (→): `&rarr;`
- Double headed arrow (↔): `&harr;`
- Full processing:

```sh
quarto render
quarto publish gh-pages

# With this option, it does not wait until the browser opens.
quarto publish gh-pages --no-browser
```

To make this website/repository reusable for multiple runs of the course, I define some the course-specific content (e.g. specific links) as parameters in the `_variables.yml` file. This way, I can easily change the content for the next iteration of the course.
Reference the variables in any .qmd file by using `{{< var var_name >}}`, e.g. `{{< var homework_repo >}}`.

## Link to Zenodo

1. Go to Zenodo --> My Account --> Github
2. Enable the repository for Zenodo (switch it on)
3. In Github: Create a new release. This will trigger Zenodo to create a new version.
4. Copy the Zenodo badge into the README.md file.
5. In Zenodo: Edit the metadata of the release
   1. Under "Keywords and subjects" add the keyword `fairtheory` (and others)
   2. Add the rendered website URL to the "Related identifiers" section, with "is source of and the URL:

![](common/Zenodo_related_works.png)

1. Add it to the "fairtheory" community (in the project view (not edit view) -> right sidebar -> "Communities" --> "Submit to community" --> search for "FAIR Theory Community" and select it)

## Resources

- https://github.com/coatless-quarto/r-shinylive-demo

