# statutely

Typst template for statutes / bylaws (vedtægter), Danish/English.

```typ
#import "@local/statutely:0.1.0": *
#show: statutes.with(organisation: "Foreningen", updated: "April 2026", lang: "en")  // or vedtaegter (lang: "da")
= Name             // §1 Name
==                 // 1.1
#stk[...]          // para. 2 … / stk. 2 …
```

Pass `logo: image("logo.png", width: 2.3cm)` from your own document for a logo. See `examples/`.
