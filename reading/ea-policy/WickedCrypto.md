# Wicked Crypto

- Summary:
  - Basically my thesis, but more policy focused. He analyzes crypto as a "wicked problem"!
- Purpose:
- Premises:
- Contributions:
- Policy comments:
  - Encryption both enhances and undermines public safety (security vs security)
  - Silicon Valley, faced by the threat of regulation from both liberal and autocratic regimes, has the opportunity to
      tackle the problem first and set a global precedent. This is opportunity!
  - As similarly argued in his rozenshtein_2019, EA would be a boon for smaller-time crime
    - Advanced criminals or users could use alternative, impossible to stomp-out encryption schemes
    - Bigger criminals have bigger, well funded agencies that can afford long investigations and lawful hacking
    - Smaller criminals are less likely to stray from common technology platforms
  - EA is a wicked problem (I swear I came to this conclusion before reading this paper)
    - "There is no agreement on goals"
      - A good description about conflict of underlying values: what do you even mean by "security"?
        - Public safety, or
        - information security?
    - "Information is Uncertain and Diffuse"
      - There is convincing evidence that we are not currently capable of reasonably secure EA; is this cause for more
          research, or giving up? He argues the former:
        - Serious researchers are still working on the problem, and could have a breakthrough
        - "Antipathy toward government in the technology industry and security-research community may be scaring away
            some researchers  from  tackling  the  problem.
          - Bart Preneel, a very well respected cryptographer, has argued that the topic should not be taboo
      - He argues that lawful hacking is the only other alternative, and that also has negative side effects on infosec
      - The 'results' of CWI don't directly apply, for several reasons. He also mentions ubiquity as a big reason.
    - "The Problem Cannot Be Fully or Permanently Solved"
      - The landscape is constantly shifting
      - In the interim of the crypto wars, the govt was focusing on access to VoIP and other access capabilities
  - Lessons, given EA is a wicked problem:
    - "Beware easy answers"
      - "EA Mandates"
        - Nods to the 'nerd harder' meme
        - Acknowledgement that though this might not be impossible, "any solution will require a massive amount of
            research and development to which the government has so far not publicly contributed."
      - "“Going Dark” vs. “A Golden Age of Surveillance”"
        - We know the argument, and he has a citation.
        - A counter-arg from govt: jurors have higher expectations given the data that is theoretically available, and
            are less willing to convict without it all. But local LE doesn't have the funds.
        - He also argues that this is an orthogonal issue; it's about values, not practical solutions and real problems
          - Both sides use a "baseline" argument, which has two flaws
            - How do you choose a baseline? There is no "correct" baseline, and you choose it to suit your argument
            - Even if there was a "correct" baseline, this is a wicked issue--there is no rule that says it is _still_
                the most desireable solution
              - It may be _legally_ normative, but the _policy_ goal is free to change
          - Defenses involving "balance of the status quo" also have flaws
            - If "balance" simply means the current status quo, it's circular
            - If "balance" means stability, or that the actual current affairs are a "local maximum", well, okay, but
                given the dynamism of the situation, that argument is constantly open to challenge
              - The dynamism comes both from tech and from social values
          - Incrementalism can be a guide
            - "Cheneyism" or "Snowdenism"--hardline positions that emphasize one value to the utmost--ignore other
                values to their detriment, and leave chaos by their exclusion.
            - Not that a hierarchy of values isn't appropriate--holistic risk management, though difficult, is the only
                choice
    - "Focus on Imperfect Solutions: The Case of Lawful Hacking"
      - Several good citations on lawful hacking
      - It has a growing number of proponents
      - It has several forms (govt buys access; govt develops in-house capabilities)
        - Advantages
          - Takes advantage of preexisting vulnerabilities; doesn't make devices weaker
        - Disadvantages
          - Would only work some of the time (like EA, but even more so)
            - Vulnerabilities may not be present in the device or system
            - Vulnerabilities may be expensive to acquire or use
            - High value vulnerabilities may not be used, since they might get "burned" by their very use or in court
            - Local LEAs would likely not have the capabilities or funds
          - Would disincentivize bug reporting, decreasing device and system security
          - Further frays the relationship between tech and govt by making it explicitly adversarial
      - So where is LH a good fit? Where tech wouldn't cooperate anyway--the dark web, devices and services produced
          outside the jurisdiction of such a mandate, against custom systems built by criminals, etc
    - "Invest in Knowledge Production"
      - We need answers to the following--
        - factual questions:
          - To what extent does encryption stymie government investigations?
          - What level of access does the government want technology companies to provide, and across what platforms and systems?
          - Most importantly, to what extent would providing such access degrade information security?
        - values questions:
          - Should we make it easier for the government to engage in surveillance?
          - Assuming that government access will necessarily degrade information security by some amount, how much is too much?
      - The factual questions need answering first, and Congress can do specific things to try to get answers
        - Require reporting on cases involving encryption--did it interfere, what did the LEA do, etc
        - "fund research into whether secure exceptional-access systems are possible"
    - "Improve Relationships Between the Government and the Technology Community"
      - Cooperation is necessary when tackling wicked problems
      - Good section on the tribalism and value-minimizing that's taking place
      - The tribalism can be turned into an inclusive "community of interest" if we recognize one another's goals
      - The courts aren't a great place for the initial resolution of the issue (as in the Apple v FBI case) for several
          reasons, one of which is the explicit adversarial nature. It is good for settling legal questions, but not for
          settling public values questions.
      - He mentions the "Secure Data Act of 2018" as an example of a means to move forward, though it has flaws
- Technical comments:
- Notes:
  - Contains a nice little (very high level) intro to crypto and EA

>We are in a critical period for this issue: public opinion is split on whether companies should design their systems to
permit law-enforcement access;11technology companies can no longer assume a hands-off, deregulatory environment; and the
looming specter of foreign regulation from liberal and autocratic regimes alike gives the government and Silicon Valley
an incentive to resolve the encryption issue one way or the other, thereby setting a global precedent. My hope is that
this article will nudge the discussion away from oppositional, all-or-nothing analyses of short-term proposals and
toward a higher-level, longer-term approach that can find common ground among the various sides.

>It is impossible to know the precise extent to which encryption frustrates law-enforcement investigations, both because
law-enforcement agencies are only beginning to collect accurate statistics, and because one can never be sure of how an
investigation would have proceeded in the absence of encryption. But the top-line conclusion is clear: as a report by
the National Academies notes, “widespread encryption is having a serious and growing negative impact on the ability of
law enforcement to collect relevant plaintext [i.e., unencrypted data].”

Excellent quote!

>A diagnosis of wickedness can bring about policy humility, which has two additional useful consequences. It may lead us
to take seriously proposals that might otherwise be discarded as imperfect, second best, or non-ideal, so that the
unobtainable perfect does not crowd out the attainable good (or even middling). And this sense of humility may lead
parties on various sides of the issue to view each other’s proposals and perspectives more charitably, and to better
appreciate the value of compromise.

>Bart Preneel, a renowned Belgian cryptographer whose research in encryption has made him both a hero to the
information-security and privacy communities and a thorn to law enforcement, encouraged cryptographers to research
secure exceptional-access systems (in addition to generally improving the state of information security).

>On the other hand, no solution will fully prevent criminals from using encryption that law enforcement cannot defeat,
because there are hundreds of encrypted hardware and software services, both in the United States and abroad, that an
individual seeking encrypted communications or storage could use.68 Even the most extreme government-access proposals
would not be able to reach every encrypted product in the United States, not to mention foreign products. This does not
mean that attempts to regulate encryption are fruitless. The vast majority of criminals are unsophisticated and will
stick to the most popular consumer products (which could be more easily regulated).69 And the resources freed up by
easier access to those criminals’ data could be used on the expensive, one-off techniques—such as lawful
hacking70—necessary to access the encrypted data of more sophisticated criminals. But law enforcement will still
frequently be stymied in its quest for data and so will continuously push for farther-reaching regulation of
encryption.

>As the political scientist Charles E. Lindblom explained in a seminal article on public administration: “Policy is not
made once and for all; it is made and re-made endlessly. Policy-making is a process of successive approximation to some
desired objectives in which what is desired itself continues to change under reconsideration.”71 The problem of
law-enforcement access to encrypted data typifies this chronic aspect of the most difficult policy problems.

```bib
@techreport{rozenshtein_wicked_2018,
  address = {Rochester, NY},
  type = {{SSRN} {Scholarly} {Paper}},
  title = {Wicked {Crypto}},
  url = {https://papers.ssrn.com/abstract=3256858},
  abstract = {Encryption safeguards our digital and physical selves. But when encryption impedes law-enforcement
investigations, it can undermine public safety. Can we design a system such that our data is secure against malicious
actors while simultaneously accessible to the government pursuant to lawful process?This article, prepared for the UC
Irvine Law Review's symposium on gender, equality, and technology, tries to advance the debate over government access
to encrypted data. First, it explains that, although government access to encrypted data is publicly framed as
primarily a national-security issue, its biggest public-safety effects are on state and local criminal investigations.
Second, drawing on planning and public-administration theory, this article argues that government access to encrypted
data is best conceptualized as a "wicked problem": one where the goals are unclear, the information is incomplete, and
the solutions are always provisional. Third, it applies the wicked-problem framework to generate a set of lessons and
policy proposals, including: embracing partial solutions like government hacking of encrypted devices, while
recognizing the drawbacks and limitations of such approaches; developing policies to generate knowledge about the
problem in both the public and private sectors, and creating institutional and legal contexts that promote cooperation
rather than antagonism between the government and the technology community.},
  language = {en},
  number = {ID 3256858},
  urldate = {2020-07-31},
  institution = {Social Science Research Network},
  author = {Rozenshtein, Alan Z.},
  month = oct,
  year = {2018},
  keywords = {SSRN, Wicked Crypto, Alan Z. Rozenshtein}
}
```
