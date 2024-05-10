<h1 align="center">Building Cryptographic Proofs from Hash Functions</h1>

A book by [Alessandro Chiesa](https://ic-people.epfl.ch/~achiesa/) and [Eylon Yogev](https://www.eylonyogev.com/about).

## Content

This book provides a comprehensive and rigorous treatment of cryptographic proofs based on *ideal* hash functions. This includes notable constructions of SNARGs (succinct non-interactive arguments) based on ideal hash functions. For example, STARKs (scalable transparent arguments of knowledge) are an example of such SNARGs.

We discuss several fundamental constructions, including:

* the **Fiat&ndash;Shamir transformation**;
* the **multi-round Fiat&ndash;Shamir transformation**;
* the **Kilian transformation**;
* the **Micali transformation**;
* the **BCS (Ben-Sasson&ndash;Chiesa&ndash;Spooner) transformation**.

We provide detailed security definitions, security proofs, and optimizations. Along the way, we also discuss **Merkle commitment schemes** in detail, which play an important role in several of the aforementioned transformations.

Security reductions have explicit error bounds, which enables setting security parameters in practice. In most cases our analyses are essentially tight, and we improve upon the fragmented and incomplete treatment of this material that exists in the literature. We adopt uniform terminology and notation throughout the book to highlight the relationships between the different constructions that we cover.

Overall, this book provides an auditable resource can help the community to ensure the cryptographic security of implemented systems.

## Comments, suggestions, corrections

We welcome comments (positive or negative!), as well as suggestions or corrections. You can directly submit issues or pull requests to this repository (preferred) or simply email us directly (see emails on our personal homepages).

## License

<p align="center">
    <a href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png"></a>
</p>

The source code of the book (and the book itself) is licensed under the **Creative Commons Attribution-ShareAlike 4.0 International License** (CC BY-SA 4.0). Briefly, you are allowed to share and adapt the source code of this book, provided you give appropriate credit and indicate any changes; moreover, material derived from this book must carry the same license (or one compatible with it). See [here](https://creativecommons.org/licenses/by-sa/4.0/) for more on this license.

## Compiling the book

We provide a Makefile to compile the book. We use `LuaTeX` with `biber` as the bibliography backend.

## Citation

You can cite this book using the following template:

```
@book{ChiesaYogev2024,
  author = {Chiesa, Alessandro and Yogev, Eylon},
  title = {Building Cryptographic Proofs from Hash Functions},
  url = {https://github.com/hash-based-snargs-book},
  year = {2024},
}
```
