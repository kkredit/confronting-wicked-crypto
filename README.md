# Contending with Wicked Crypto

This repository contains the source for my master's thesis on addressing the
[wicked problem](https://en.wikipedia.org/wiki/Wicked_problem) of cryptography and exceptional access in the midst of
overlapping issues of security, safety, privacy, and trust.

The title is partially derived from Alan Z. Rozenshtein's excellent paper on the subject titled
[_Wicked Crypto_](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3256858).

## Abstract

Public debate has resumed over whether encryption systems should support alternative means of decryption intended for
law enforcement use, called exceptional access (EA). Rather than a renege on a solemn promise made at the end of the
1990s ``crypto war,'' this represents a valid reassessment of optimal policy in light of changing circumstances.
Achieving proper balance between privacy and access in the context of constantly changing society and technology is a
wicked problem that has and will evade a permanent solution. As policymakers consider next steps, it behooves the
technical community to stay engaged. Although the introduction of EA would inevitably introduce risk, the quality of the
technical and regulatory approach can make a substantial difference. Furthermore, if one considers ham-fisted
legislative action and malicious abuse of cryptosystems as part of the threat model, well-designed EA may reduce overall
risk.

The root of the conflict lies in cryptography's dual role as enabler of unprecedented privacy and cornerstone of
security. The emergence of strong encryption triggered the first crypto war, and its proliferation is causing the
second. In response to both polarized and conciliatory voices, I will analyze strategies that do and do not work on
wicked problems and promote an iterative approach to the case of encryption and EA. Along the way I will illustrate the
components of the debate in argument maps and demonstrate the security risks with data flow diagrams, making clear
distinctions for the separate problems of EA for data in motion and data at rest.

## Key Influences

- [_Dilemmas in a General Theory of Planning_](https://archive.epa.gov/reg3esd1/data/web/pdf/rittel%2bwebber%2bdilemmas%2bgeneral_theory_of_planning.pdf)
- [_Wicked Crypto_](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3256858)
- [_On the Incommensurability of Laws and Technical Mechanisms: Or, What Cryptography Can’t Do_](matyas_incommensurability_2018)
- [_Keys Under Doormats: Mandating Insecurity by Requiring Government Access to All Data and Communications_](https://academic.oup.com/cybersecurity/article-lookup/doi/10.1093/cybsec/tyv009)
- ["Moving the Encryption Policy Conversation Forward"](https://carnegieendowment.org/2019/09/10/moving-encryption-policy-conversation-forward-pub-79573)
- ["A Roadmap for Exceptional Access Research"](https://www.lawfareblog.com/roadmap-exceptional-access-research)

## Repo Usage

To build the document, run `make`. The tools [Zotero Translation Server](https://github.com/zotero/translation-server)
and [scholarref](https://adamsgaard.dk/scholarref.html), combined with the helper scripts in `scripts/`, are quite handy
for generating BibTeX citations.

## License

This thesis is made available under the Creative Commons Public License, Attribution-ShareAlike 4.0 International. A
copy of the full license is available in the [LICENSE](LICENSE) file.
