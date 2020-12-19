# Confronting Wicked Crypto

This repository contains the source for my master's thesis on addressing the
[wicked problem](https://en.wikipedia.org/wiki/Wicked_problem) of cryptography and exceptional access in the midst of
overlapping issues of security, safety, privacy, and trust.

The title is partially derived from Alan Z. Rozenshtein's paper on the subject titled
[_Wicked Crypto_](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3256858).

## Abstract

Public debate has resumed on the topic of exceptional access (EA), which refers to alternative means of decryption
intended for law enforcement use. The resumption of this debate is not a renege on a resolute promise made at the end of
the 1990s "crypto war"; rather, it represents a valid reassessment of optimal policy in light of changing circumstances.
The imbalance between privacy, access, and security in the context of constantly changing society and technology is a
wicked problem that has and will continue to evade a permanent solution. As policymakers consider next steps, it is
necessary that the technical community remain engaged. Although any EA framework would increase risk, the magnitude of
that increase varies greatly with the quality of the technical and regulatory approach. Furthermore, if one considers
hard-line legislative action and malicious abuse of cryptosystems as part of the threat model, well-designed EA may
reduce risk overall.

The root of the conflict lies in cryptography's dual role as an enabler of unprecedented privacy and a cornerstone of
security. The emergence of strong encryption incited the first crypto war, and its proliferation is causing the second.
In response to both polarized and conciliatory voices, this paper analyzes strategies for confronting wicked problems
and proposes an iterative approach to the case of encryption and EA. Along the way, it illustrates the components of the
debate in argument maps and demonstrate the security risks with data flow diagrams and threat analysis, focusing on one
EA proposal in particular, Stefan Savage's "Lawful Device Access without Mass Surveillance Risk."

## Key Influences

- [_Dilemmas in a General Theory of Planning_](https://archive.epa.gov/reg3esd1/data/web/pdf/rittel%2bwebber%2bdilemmas%2bgeneral_theory_of_planning.pdf)
- [_Wicked Crypto_](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3256858)
- [_On the Incommensurability of Laws and Technical Mechanisms: Or, What Cryptography Can’t Do_](http://link.springer.com/10.1007/978-3-030-03251-7_31)
- [_Keys Under Doormats: Mandating Insecurity by Requiring Government Access to All Data and Communications_](https://academic.oup.com/cybersecurity/article-lookup/doi/10.1093/cybsec/tyv009)
- ["Moving the Encryption Policy Conversation Forward"](https://carnegieendowment.org/2019/09/10/moving-encryption-policy-conversation-forward-pub-79573)
- [_Lawful Device Access without Mass Surveillance Risk_](http://dl.acm.org/doi/10.1145/3243734.3243758)
- ["A Roadmap for Exceptional Access Research"](https://www.lawfareblog.com/roadmap-exceptional-access-research)

## Repo Usage

To build the document, run `make`. The tools [Zotero Translation Server](https://github.com/zotero/translation-server)
and [scholarref](https://adamsgaard.dk/scholarref.html), combined with the helper scripts in `scripts/`, are quite handy
for generating BibTeX citations.

## License

This thesis is made available under the Creative Commons Public License, Attribution-ShareAlike 4.0 International. A
copy of the full license is available in the [LICENSE](LICENSE) file.
