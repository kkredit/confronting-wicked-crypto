# A Roadmap for Exceptional Access Research

- Summary:
  - Excellent survey of the debate, technical considerations, and ideas for steps forward
  - Basically an essay version of my thesis
- Purpose:
  - Break the logjam a little
  - Provide an insight to the debate and resources for those interested
- Premises:
  - The debate raging so far is a political battle, and is increasingly polarized
  - Our common goal is public safety
- Contributions:
  - A level head
- Policy comments:
  - "Reviving technological research into EA is essential to improve the state of the policy debate"
  - Classes of concern:
    - Public safety and national security
      - Con: decreased info security
      - Pro: solve more crimes
    - Democratic values
      - Con: privacy is important
      - Pro: LE norms have evolved over centuries; many people want LEAs to have access
    - International ramifications
      - Con: market imbalances; potential for abuse by oppressive governments
      - Pro: a well-designed EA system will improve the security for those with access requirements
        - (more than 50% of the population as of 2018)
    - Alternatives
      - Con: the determined will find a way to strongly encrypt
      - Pro: LEA alternative is lawful hacking, which has its own problems
  - We are not technically prepared for EA legislation, so Congress can deescalate and prepare us by
    - Banning EA in the near-mid term
    - Investing in EA research
- Technical comments:
  - "Cryptographers labor intensely over, and rely heavily on, definitions that codify the security
      requirements and expected capability they want from system features like encryption."
    - Technical clarity is important
  - Types of controls:
    - Government-only authorization
    - Targeting
    - Accountability
    - Federation
    - Limits on access
    - Crypto transparency
    - Defense in depth
  - Corners of the problems space:
    - Data location (cloud, device, DAR, DIM)
    - Physical vs. remote access
    - Scope (defaults and major service providers, or all encryption everywhere?)
    - Past vs. future
    - Accessible agents (which LEOs can get the data?)
    - Compliance
    - Delay
- Notes:
  - Interesting explanation of lack of cooperation from LEAs: "Due to their professional inclination
      toward secrecy combined with the organizational challenge of accumulating statistics across
      field offices, the U.S. federal, state and local governments have thus far been unwilling or
      unable to categorize the cases in which encryption tends to stymie their investigations."
  - Action items:
    - Everyone: "first acknowledging the good faith and common interests of everyone involved"
    - LEAs: "provide concrete knowledge about access mechanisms that could address many of the cases
        currently stymied due to encryption"
    - Congress: "appropriate funds to jump-start scientific research for exceptional access and
        design a rigorous policy proposal for encryption regulation"
    - Legislatures: "should impose a moratorium on EA so as to restore trust and foster an
        environment in which scientists can evolve EA prototypes and run small-scale pilot tests
        without the concern that a half-baked EA system will suddenly be introduced"
    - (Implicit) Researchers: do the research, ideally after government has taken the above steps
    - Society: "decide to use [or not] those constructions, cognizant of the benefits and risks of
        this decision"

Yes.
>These crypto wars have been fought over the past several decades as a political battle. Even though
all parties have the common goal of improving public safety, they enter the fray with differing
personal and professional biases, which cause them to prioritize either improving digital security
to prevent crime or providing tools for law enforcement to investigate crimes with a digital
component. Predictably, this politicization has led to dour consequences. Views become polarized
into an “us vs. them” mentality, with technologists and government officials both claiming the
imperative to act as strongly as the law permits and abhorring any “middle ground.” Illogical
arguments promulgate, such as the focus of EA proponents’ on terrorism even though EA is more likely
to aid in the investigation of ordinary criminal activity, and the focus of EA opponents on past
mistakes that bear no relation to modern proposals. Finally, participants tend to use provocative,
alienating rhetoric like “responsible encryption” or “backdoors.”

>Reviving technological research into EA is essential to improve the state of the policy debate. In
the short term, this would provide time and space for technologists to improve upon the state of the
art in exceptional access: the reality today is that all existing EA proposals have been
insufficiently vetted and, if deployed, would pose systemic risk to the digital ecosystem. More
research and engagement between law enforcement and the technical community could change that—but
this cannot happen when these groups are pitted against each other in a political debate. In the
longer term, developing a variety of modern EA proposals would crystallize and refocus a policy
debate currently lacking in technical specifics.

>Perhaps the most important action that can be taken to advance the policy debate is to acknowledge
the good faith and common interests of everyone involved. As the Encryption Working Group within the
House Judiciary and Energy & Commerce Committees astutely observes, it is simultaneously true that:
"The widespread adoption of encryption poses a real challenge to the law enforcement community and
strong encryption is essential to both individual privacy and national security. A narrative that
sets government agencies against private industry, or security interests against individual privacy,
does not accurately reflect the complexity of the issue."

>At first blush, this may seem like a pedantic concern: why waste precious time and energy on
defining EA rather than simply building it? However, from decades of experience, cryptographers have
found that definitions provide the only way to understand the true intention behind a construction
and thus to test whether a proposed EA system actually meets its goals. They also often outlive any
particular construction, and they enable principled policy and moral discussions to occur about the
values society wants without getting bogged down by the scientific details of any particular
construction.

>Political debate will not make the user versus law-enforcement conflict vanish. Even though some
would prefer to not have any form of [exceptional access], the pragmatic view is that reaching some
sort of compromise is necessary. … Thus the technical question is to find a solution as palatable as
possible to both sides. It should guarantee enough privacy for the individual that people would go
along with it, and yet be acceptable to law enforcement too.  
– Professors Mihir Bellare and Shafi Goldwasser, CCS 1997

>_What is the path to a future with viable EA systems?_ This is the easiest of the four questions to
answer, so I provide my response upfront: Congress should prohibit the federal government from
requiring that the private sector deploy exceptional access mechanisms. Paradoxically, supporters of
EA should endorse such a ban (at least in the short term) as the single best method to resolve the
Going Dark problem.

```bib
@misc{varia_2018,
  author = {Varia, Mayank},
  title = {A {Roadmap} for {Exceptional} {Access} {Research}},
  url = {https://www.lawfareblog.com/roadmap-exceptional-access-research},
  abstract = {This is part of a series of essays from the Crypto 2018 Workshop on Encryption and Surveillance.},
  language = {en},
  urldate = {2020-01-30},
  journal = {Lawfare},
  month = dec,
  year = {2018}
}
```
