# Principled Extraordinary Access

This repository contains the source for my master's thesis on principled approaches to extraordinary
access. Major influences include the Carnegie Encryption Working Group's ["Moving the Encryption
Policy Conversation
Forward"](https://carnegieendowment.org/2019/09/10/moving-encryption-policy-conversation-forward-pub-79573)
and Mayank Varia's ["A Roadmap for Exceptional Access
Research"](https://www.lawfareblog.com/roadmap-exceptional-access-research).

## Motivation

Encryption is a foundational tool to the integrity and confidentiality of all connected computing
systems. Its increasing ubiquity in communications and storage provides clear benefits and should be
welcomed by all. In a world where information security is frightfully poor yet increasingly
important, strong encryption's necessity can not be understated. However, certain encryption
technologies hamper law enforcement investigations and hide wrongdoing. In a society that cares
about bringing dangerous people to justice, this risk should not be ignored.

The conversation over encryption is in a stalemate. Law enforcement and government types frequently
cite the need to access encrypted data to perform their duties. Technological and civil liberties
types counter that a weakened encryption environment would fatally compromise privacy and security
as we know it. Both sides engage in straw-man attacks against their perceived opponents.

It is time that the technical community moves the debate forward. Increased regulation of the tech
industry is inevitable. Despite strong encryption's benefits, regulatory interest in the subject has
not subdued. The form that regulation will take in the field of encryption depends on the good faith
efforts made to equitably balance all the benefits and risks involved in deploying a crypto system.

Extraordinary access to encrypted data is a complex technical topic. As the Carnegie Encryption
Working Group [have
shown](https://carnegieendowment.org/2019/09/10/moving-encryption-policy-conversation-forward-pub-79573),
the problem of data at rest on encrypted devices is the most tractable path forward. As
[Ozzie](https://github.com/rayozzie/clear/blob/master/clear-rozzie.pdf) and
[Savage](https://cseweb.ucsd.edu/~savage/papers/lawful.pdf) have shown, principled extraordinary
access methods are conceivable. Whether these proposals acceptably balance the risks at hand
requires more study.

This paper will build on the recommendations of the Carnegie Encryption Working Group and the
proposals put forth by Ozzie, Savage, and their colleagues. Using a threat model informed by the
[justified critics](https://mice.cs.columbia.edu/getTechreport.php?techreportID=1637) of current
proposals, it will analyze the state of the art for access to data at rest on encrypted devices and
attempt to identify a principled path forward.

## Usage

To build the document, run `make`. The tools [Zotero Translation
Server](https://github.com/zotero/translation-server) and
[scholarref](https://adamsgaard.dk/scholarref.html), combined with the helper scripts in `scripts/`,
are quite handy for generating Bibtex citations.

## License

This thesis is made available under the Creative Commons Public License, Attribution-ShareAlike 4.0
International. A copy of the full license is available in the [LICENSE](LICENSE) file.
