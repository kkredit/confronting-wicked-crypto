# Keys under doormats: mandating insecurity by requiring government access to all data and communications

- [Keys under doormats: mandating insecurity by requiring government access to all data and communications](#keys-under-doormats-mandating-insecurity-by-requiring-government-access-to-all-data-and-communications)
  - [Notes](#notes)
    - [Policy](#policy)
    - [Technical](#technical)
    - [EA Reasons and Objections](#ea-reasons-and-objections)
  - [Quotes](#quotes)
  - [Citation](#citation)

## Notes

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
- Notes:
  - They start breaking out arguments right in the abstract
  - Very "us v. them"
  - Diff from 1997 report
    - Technical difficulties largely the same
    - Societal dependence on the internet and its security MUCH larger
  - Good "crypto war" history
  - Lessons
    - Accept that the extent we assist LEAs is the extent we increase risk
      - Not equally, and maybe not even linearly. But monotonically
    - Which LEAs to provide access to is a huge affairs problem

### Policy

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
- Questions to be answered
  - Scope, limitations, and freedoms
  - Planning and design
  - Deployment and operation
  - Evaluation, assessment, and evolution
    - EA could decrease use of encryption in general due to costs, which would certainly hurt security

### Technical

- Technical comments:
  - Lack of detail from LEAs
  - Many govt bodies, including the NSA, have an official COTS policy. There is no difference
      between military infotech hardware and commercial
  - Technical discussion is fairly high level
  - Scenarios:
    - Messaging DIM:
      - [High level description of use of symmetric and asymmetric keys]
      - Proposal: encrypt the symmetric key a second time with an escrowed key
        - Problem 1: this precludes forward secrecy; all data ever encrypted this way would become
            vulnerable as soon as the escrowed key is (inevitably) revealed
          - "If any of the private escrowing keys are ever compromised, then all data that ever made
              use of the compromised key is permanently compromised"
          - "All known methods of achieving third-party escrow are incompatible with forward secrecy"
          - There is also trend to ephemeral messaging
        - Problem 2: this precludes authenticated encryption
          - (I'm not sure why; couldn't you still sign the message using your private key?)
            - Or maybe you can, but this is the 90s way they mention and more difficult to implement correctly
        - Problem 3: who controls the escrowed keys?
          - In USA, maybe FBI
          - But what about internationally? Why would France cooperate with the FBI when that's annoying to them, and
              why would China when they're intelligence competitors?
          - Would there be encryption safe havens, where people ship their data to store safely like the wealthy do with
              their bank accounts now?
    - Device DAR:
      - Proposal: device mfr maintains ability to unlock device (keys or otherwise) and responds to warrants
        - Authors point out that companies often already do this; the difficulty is scale
        - Problem 1: how will the KEK be encrypted?
          - Vendor supplied keys?
            - Auth between vendors and agencies
            - How to know it is for the correct device?
            - If use HW (savage_lawful_2018), solutions are expensive to deploy and probably impossible to fix
          - LEA supplied keys?
            - Auth between vendor and agencies
            - Key updates (must change keys if exposed)
            - How many keys can be installed?
          - LEA must ship the device back to the mfr?
            - Eliminates auth questions
            - Must still store keys over a long period of time
        - Problem 2: jurisdiction and international keys
          - National keys? What about travelers? Install keys at border? That adds all kinds of vulnerabilities
  - Problem: EA flaws, which are fairly certain, will have a very long deployment tail
  - Problem: EA can and has been used by criminals in the past
- Breakdown of problem space
  - Access to communications content
    - Legal protections in countries that have rule of law (but not most people)
    - DB of messages for NED, "wiretapping" for ED
    - Tech problems: risks to forward secrecy, transient identities, and location privacy
    - Policy problems: jurisdiction, LEAs answerable to
    - Enforcement problems
  - Access to metadata
    - Already common
    - Currently facing the international jurisdiction/enforcement difficulties EA could face
  - Access to DAR
    - The corporate solution of storing device encryption keys works at that scale, but has challenges
      - Suspects can use their own encryption on top
      - The key escrow by the corp may fail
      - Jurisdiction issues
    - Solution: catch criminals while they have an active session? Has happened before (greenberg_2018)
    - Legalized malware installation has a host of problems
      - Distrust of SW updates
      - Coordination w/AV companies? Jurisdictional issues, fosters lack of trust
      - Hoarding of 0-days to use on criminals? Bad security practice

### EA Reasons and Objections

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

## Quotes

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

>With people’s lives and liberties increasing online, the question of whether policymakers should support law
enforcement demands for guaranteed access to private information has a special urgency, and must be evaluated with
clarity. From a public policy perspective,there is an argument for giving law enforcement the best possible tools to
investigate crime, subject to due process and the rule of law.But a careful scientific analysis of the likely impact of
such demands must distinguish what might be desirable from what is technically possible. In this regard, a proposal to
regulate encryption and guarantee law enforcement access centrally is analogous to a requirement that all airplanes can
be controlled from the ground. While this might be desirable in the case of a hijacking or a suicidal pilot, a
clear-eyed assessment of how one could design such a capability reveals enormous technical and operational complexity,
international scope, large costs, and massive risks—so much so that such proposals, though occasionally made, are not
really taken seriously.

>If law enforcement wishes to prioritize exceptional access, we suggest that they need to document their requirements
and then develop genuine, detailed specifications for what they expect exceptional access mechanisms to do. As computer
scientists and security experts, we are committed to remaining engaged in the dialogue with all parts of our
governments, to help discern the best path through these complex questions.

## Citation

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
