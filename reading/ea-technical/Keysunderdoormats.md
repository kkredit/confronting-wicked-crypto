# Keys under doormats: mandating insecurity by requiring government access to all data and communications

- Summary:
  - 2015 revisit of 1997 article on risks of key escrow
  - See also abelson_risks_1997
- Purpose:
- Premises:
  - LEAs are asking for
    - Past and future decryption of DIM (i.e. no forward secrecy)
    - Fast access (i.e. no distributed keys)
    - A mandate (all devices/services must have this)
- Contributions:
- Policy comments:
  - Suggest that they aren't against LEA investigations per se, but need concrete proposals that can
      be analyzed and scrutinized
    - Are they suggesting the gov't put this forward? This is not a good idea. Obviously initial
        proposals will be flawed and swatted down, as with the clipper chip.
    - The correct approach is for the gov't to say _what_ it wants, then to fund research and let
        the technical community determine _how_ to achieve that.
    - OK, they do say "requirements". But then they go back to the Clipper Chip. They later talk
        about a "concrete technical proposal." That would be inappropriate from gov't. All they can
        and should provide is high level requirements. Congress should disallow an EA mandates until
        the tech community reaches some sort of consensus that the field is developed enough.
  - Where does jurisdiction lie for internet services?
    - If it's a UK developer making SW run in China?
    - If it's US SW running in the UK?
    - Can you get around it with usage agreements (which no one reads)?
    - Sounds like next-level DRM'ing
  - Who will regulate EA? Each country? How about if that country does not have sufficient rule of
      law?
  - Proposal I hadn't heard before: "licensed" enc where the keys are stored by CA-like bodies
- Technical comments:
  - Lack of detail from LEAs
  - Many govt bodies, including the NSA, have an official COTS policy. There is no difference
      between military intotech hardware and commercial
  - Technical discussion is fairly high level
  - Scenarios:
    - Messaging DIM:
    - Device DAR:
- Notes:
  - They start breaking out arguments right in the abstract
  - Very "us v. them"
  - Diff from 1997 report
    - Technical difficulties largely the same
    - Societal dependence on the internet and its security MUCH larger
  - Good "crypto war" history

- Reasons (stated by the security people on behalf of the policy people)
  - Prevent neutralized investigation capabilities
- Objections
  - The internet has flourished as is
  - LEAs have other means of data collection
  - Technical damages:
    - Reverse forward secrecy (not all proposals include this)
    - Inserts complexity, the enemy of security
      - But if use canetti_universally_2000 might be able to help
      - Examples on p4c2 about failures of complex systems
    - Creates concentrated targets for attackers (the key holders)
  - Policy damages:
    - How to use responsibly (legal)
    - How to make sure the wrong people aren't hurt (ethical)
    - Will make US/UK companies disadvantaged globally (economic)

>(We follow the 1996 US NationalAcademy of Sciences CRISIS report in using the phrase “exceptional
access” to mean that “the situation is not one that was included within the intended bounds of the
original transaction.” [4, p. 80]).

>The current public policy debate is hampered by the fact that law enforcement has not provided a
sufficiently complete statement of their requirements for technical experts or lawmakers to analyze.

FBI's Comey:
>We aren’t seeking a back-door approach. We want to use the front door, with clarity and
transparency, and with clear guidance provided by law. We are completely comfortable with court
orders and legal process — front doors that provide the evidence and information we need to
investigate crime and prevent terror-ist attacks.  
Cyber adversaries will exploit any vulnerability they find. But it makes more sense to address any
security risks by developing intercept solutions during the design phase, rather than resorting to a
patchwork solution when law enforcement comes knocking after the fact. And with sophisticated
encryption, there might be no solution, leaving the government at a dead end — all in the name of
privacy and network security. [5]

1996 US study concludes that existence of cryptography is net positive.
>A 1996 US National Academy of Science study concluded that, “On balance, the advantages of more
wide-spread use of cryptography outweigh the disadvantages” [4,p.6]

```bib
@article{abelson_2015,
  title = {Keys under doormats: mandating insecurity by requiring government access to all data and
communications},
  issn = {2057-2085, 2057-2093},
  shorttitle = {Keys under doormats},
  url = {https://academic.oup.com/cybersecurity/article-lookup/doi/10.1093/cybsec/tyv009},
  doi = {10.1093/cybsec/tyv009},
  language = {en},
  urldate = {2020-01-22},
  journal = {Journal of Cybersecurity},
  author = {Abelson, Harold and Anderson, Ross and Bellovin, Steven M. and Benaloh, Josh and Blaze,
Matt and Diffie, Whitfield and Gilmore, John and Green, Matthew and Landau, Susan and Neumann,
Peter G. and Rivest, Ronald L. and Schiller, Jeffrey I. and Schneier, Bruce and Specter, Michael A.
and Weitzner, Daniel J.},
  month = nov,
  year = {2015},
  pages = {tyv009}
}
```
