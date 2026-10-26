# statutely

Typst template for statutes / bylaws (vedtægter), Danish/English.

## Example

```typ
#import "@preview/statutely:0.1.0": *
#show: statutes.with(organisation: "The Empire", updated: "April 2026", lang: "en")

= Name                        // §1 Name
The association is called The Empire.

= Board                       // §2 Board
==                            // 2.1
The board consists of 5 members.
#stk[The board is elected for one year.]   // para. 2
#stk[Members may run in absentia.]         // para. 3
```
<img width="564" height="354" alt="image" src="https://github.com/user-attachments/assets/41c7e7f4-bc12-42c5-9150-66d7ad93d890" />



## `statutes` parameters

| Parameter | Default | Description |
|---|---|---|
| `organisation` | `none` | Organisation name, used in the generated title ("Statutes of …"). |
| `title` | `none` | Override the generated title. |
| `updated` | `none` | Shown as "Last updated …" under the title. |
| `logo` | `none` | Content, e.g. `image("logo.png", width: 2.3cm)`. Must be passed from your own document, not a path string. |
| `lang` | `"en"` | `"da"` or `"en"`. |

## Markup

| Syntax | Renders as | Description |
|---|---|---|
| `= Title` | §N Title | Section. |
| `==` | N.M | Numbered sub-clause (heading text optional). |
| `#stk[…]` | para. 2 … / stk. 2 … | Auto-numbered paragraph within a sub-clause. |
