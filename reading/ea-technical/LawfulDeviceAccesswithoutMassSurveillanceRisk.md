# Lawful Device Access without Mass Surveillance Risk: A Technical Design Discussion

- Summary:
  - Method for self-escrow of DE keys requiring prolonged physical seizure
  - Available: https://cseweb.ucsd.edu/~savage/papers/lawful.pdf
- Purpose:
- Premises:
  - Limited to DE/DAR
  - "There are reasonable societal interests in allowing law enforcement to access encrypted data in particular cases."
  - "There are reasonable concerns about the potential to abuse any system that would allow access to encrypted data."
  - "Lack of perfection is acceptable."
- Contributions:
  - Principles:
    - Non-scalability
    - Authorization
    - Particularity
    - Transparency
  - Threat model:
    - Includes all variety of threat actors
    - Assumes baseline of modern accepted, in-use standards (e.g. breaking AES is out of scope)
    - Break down into threat to specific device vs general threat to all devices
    - Integrity of iOS out of scope
    - HW device tampering out of scope
    - Break down of rule-of-law is out of scope
  - Design
    - Self-escrow
    - Time vaulting
    - Authorization from company (so, combination of self-escrow and mfr-escrow)
    - Tamper evidence
  - Systems level design; moderate detail (e.g. no description of encryption protocols, but high level description of
      keys)
- Policy comments:
  - Discusses background, CALEA, Clipper Chip, Apple v FBI
  - Arguments against:
    - "any lawful access mechanism would create security vulnerabilities that could ultimately be exploited by
        unauthorized actors"
    - "concern about surveillance risk, frequently motivated within the framework of human rights concerns"
- Technical comments:
- Notes:
  - Many excellent cross-references
  - On my model:
    - Modest simplifications in the model. I remove the d_auth key because it seems redundant to me with d_seal-1. And
        there are several alternatives suggested, but I just went with one.
    - I also don't get into fuses or hashes.
    - In some cases where things are asymmetrically encrypted, a signature would do

RE ozzie_2018:
>Most recently, in May of 2018, a Wired magazine article describedRay Ozzie’s CLEAR proposal, wherein a device’s
self-escrowed stor-age decryption keys are protected by the device vendor’s public key,and thus are decryptable by the
vendor under court order. Ozzie’s scheme, regardless of any critiques of individual technical details, highlights and is
responsive to where the policy fault lines exist today: it is device-centric, it moves trust from the public to the
private sector, and it is relatively simple to understand.

>While there is a dearth of contemporary technical work focused on the lawful access question, there has been
considerable policy writing—both from the technical and policy communities

```bib
@inproceedings{savage_lawful_2018,
  address = {Toronto Canada},
  title = {Lawful {Device} {Access} without {Mass} {Surveillance} {Risk}: {A} {Technical} {Design}
{Discussion}},
  isbn = {9781450356930},
  shorttitle = {Lawful {Device} {Access} without {Mass} {Surveillance} {Risk}},
  url = {http://dl.acm.org/doi/10.1145/3243734.3243758},
  doi = {10.1145/3243734.3243758},
  language = {en},
  urldate = {2020-01-12},
  booktitle = {Proceedings of the 2018 {ACM} {SIGSAC} {Conference} on {Computer} and
{Communications} {Security}},
  publisher = {ACM},
  author = {Savage, Stefan},
  month = jan,
  year = {2018},
  pages = {1761--1774}
}
```
