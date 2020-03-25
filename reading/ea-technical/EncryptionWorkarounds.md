# Encryption Workarounds

read next
- Summary:
  - Goes into 6 encryption workarounds (not including EA) and their implications
- Purpose:
- Premises:
- Contributions:
  - Definition: encryption workaround: "any lawful government effort to reveal unencrypted plaintext of a target’s data
    that has been concealed by encryption"
  - 6 workarounds:
    - Get the key
      - Find the key
      - Guess the key
      - Compel the key
    - Get the plaintext
      - Exploit a flaw in the encryption software
      - Access plaintext while the device is in use
      - Locate another plaintext copy
  - Lessons for policymakers (all quotes):
    - Encryption workarounds are inherently probabilistic
    - The different resources required for different workarounds will have significant distributional effects on law
      enforcement
    - The scope of legal authority to compel third-party assistance will be a continuing challenge
    - The law governing encryption workarounds remains uncertain and underdeveloped
  - Broad conclusions (quotes):
    - It is too early to tell how much the widespread use of encryption will impact the government’s ability to solve
      criminal cases
    - (Corollary) The existence of workarounds may mean that encryption does not cause a dramatic shift in the
      government’s investigative powers
- Policy comments:
  - Encryption is dual-use, in the sense that any party can use it and try to work around it for their own purposes
    - That means, it is not always "good" or "bad"; it is used for good and bad things
    - (aren't most technologies like this? Well, no, atomic bombs are only used for bad things, and penicillin is only
      used for good things)
  - All the workarounds can be employed by anyone!
  - On compelling the key:
    - Two practical challenges:
      - The key holder must be (a) known (b) alive (c) within jurisdiction
      - How much pressure can the govt exert to encourage disclosure (fourth and fifth amendments)
    - Three constitutional factors. How does the govt intend to compel the key?
      - Disclosure: primarily a fifth am issue; consitutionality is murky
      - Forced entry: primarily a fifth am issue; consitutionality is murky, hinges on forgone conclusion principles
      - Biometric access: providing biometrics is not testimonial, so not fifth amendment; is fourth amendment related,
        as the suspect must be "seized"; further, if the purpose is searching the phone, that requires a warrant
    - Non-technical or legal issue: except for biometrics, the govt has no way to literally force a suspect to disclose
      the key; even if they legally must, the suspect may prefer the punishment from non-compliance to the punishment
      from what they're being tried for
- Technical comments:
  - Kerckhoffs's Principle: "An encryption algorithm should be secure if everything is known about it except the key"
  - Common flaws in encryption systems:
    - Incorrect SW implementation
    - HW vulnerabilities (e.g. Meltdown, Spectre)
    - PWs that must be reused must be stored, in computer or human memory
    - Algorithm may have flaws
    - PWs may be easy to guess
- Notes:
  - Good basic intro to cryptography
  - Describes keys, passwords, etc

```bib
@techreport{kerr_encryption_2017,
  address = {Rochester, NY},
  type = {{SSRN} {Scholarly} {Paper}},
  title = {Encryption {Workarounds}},
  url = {https://papers.ssrn.com/abstract=2938033},
  abstract = {The widespread use of encryption has triggered a new step in many criminal investigations: The encryption
workaround. We define an encryption workaround as any lawful government effort to reveal unencrypted plaintext of a
target’s data that has been concealed by encryption. This Article provides an overview of encryption workarounds. It
begins with a taxonomy of the different ways investigators might try to bypass encryption schemes. We classify six
kinds of workarounds: find the key, guess the key, compel the key, exploit a flaw in the encryption software, access
plaintext while the device is in use, and locate another plaintext copy. For each approach, we consider the practical,
technological, and legal hurdles raised by its use.},
  language = {en},
  number = {ID 2938033},
  urldate = {2020-02-19},
  institution = {Social Science Research Network},
  author = {Kerr, Orin S. and Schneier, Bruce},
  month = mar,
  year = {2017},
  keywords = {encryption, going dark, fifth amendment, fourth amendment, cybercrime}
}
```
