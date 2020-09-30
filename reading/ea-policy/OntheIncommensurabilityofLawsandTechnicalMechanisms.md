# On the Incommensurability of Laws and Technical Mechanisms: Or, What Cryptography Can’t Do

- Summary:
  - Part of the disconnect is rules vs principles; techies like rules, pols like principles
- Purpose:
- Premises:
- Contributions:
  - "We take a cross-disciplinary approach by providing what is, to the best of our knowledge, the first _structural_
      jurisprudential explanation for this tension."
  - Definitions (relying on levy_ronald_2017):
    - "Rules are applied in a deductive fashion and yield a clear result."
    - "A principle is a 'standard to be observed in the resolution of a legal dispute because justice demands it.' It
        may also be a 'policy that advances some social or economic goal.'"
      - Standard
      - Policy
  - Design patterns
    - Legal: reduce gray area between rules and principles
      - Harmonize when possible
      - Strive to have the people involved in principle formation, not just LEAs and technologists
      - There is a fine balance; pols should bring the principles, techs should bring the possibles, and together we'll
          make the rules
    - Technical: bring transparency and accountability to operation of principles
      - Two primary benefits:
        - "Enable fact-based consideration of whether laws are working properly"
        - "Increase public confidence that laws are actually being followed"
      - Also counters lack of data from FBI on the magnitude of the harm, e.g. on number of devices/cases that are
          causing trouble
      - See stajano_making_2017
- Policy comments:
  - Legal framework for providing data to law enforcement: All Writs Act
    - Scope is far from legally settled in extent and technological form
  - Arguments mentioned (not defended)
    - Govt has rights to data (via all writs act, e.g.)
    - Govt surveillance is a problem and should be made difficult
      - "Some point out that the warrants in question grant only the authority to intercept a communication or to seize
          a device; they don’t guarantee that the sought-after information will be found in the communication stream or
          on the device – or that it can be decrypted if it is found in encrypted form."
  - They break it down into two of the same problem areas I do: power/political and security/technical
  - Focusing on "legal access" pivots to
    - 4th amendment law (principle) on what is allowed
      - (rule) Electronic Communications Privacy Act (18 USC 2701 et seq)
      - (principle) 3rd party doctrine -- when is it applicable? Are we really volunteering information when there is
          almost no competition and cell/internet usage is a basic necessity?
    - The technical aspects
  - Legal thresholds
    - Low (bank records)
    - "specific, articulable facts" showing that the information sought is relevant to an ongoing criminal investigation
        (location data; SCOTUS ruling may have changed this though)
    - "probable-cause" standard required by the Fourth Amendment of the US Constitution (wiretaps and other access to
        "content" such as email)
- Technical comments:
- Notes:

>Generally speaking, a technical system is judged to have succeeded if it provides a fully specified, correct solution
to a well defined and well understood problem and is implemented and maintained according to sound engineering practice.
By contrast, legal regimes are judged according to very different standards. A proposed law or regulatory framework is
judged successful if its constituent rules are proper expressions of the society’s values and have the necessary indicia
of legitimacy.

>None of this is to say that these commentators are anarchists or that they reject the rule of law. To the contrary they
often invoke the rule of law as motivation for their views. They just seem to have lost confidence in the effectiveness
of the legal system’s ability to provide an adequate level of privacy protection.

>The tension between technical and legal views of sensitive issues such as encryption and surveillance is illuminated by
applying the jurisprudential lens. We are guided in our understanding of the incommensurability between technical
systems and legal regimes by the work of Prof. Ronald Dworkin, the leading liberal scholar of western jurisprudence.
Dworkin [levy_ronald_2017] shows that liberal legal systems, manifesting what is generally understood as “the rule of
law,” are actually composed of both rules and principles. Legal “rules” can be understood as logical propositions that
are expected to yield answers about what is and is not permitted using formal reasoning capabilities. By contrast, legal
“principles” articulate values and policies that must be reflected in a legal system but do not necessarily dictate an
unambiguous outcome in any given case.

>From the technical community’s perspective, the US government suffered a major loss of credibility as a result of the
legally and morally excessive mass surveillance exposed by Snowden... The solution, according to the conventional wisdom
in the computer-security community as articulated by Schneier, is to recognize that "we have made surveillance too
cheap. We have to make surveillance expensive again."

>In Dworkin’s terms, the "rule" is expressed in these statutes, establishing what procedures law enforcement has to
follow to conduct electronic surveillance, how courts should consider those requests, and how citizens’ rights will be
protected in the operation of those rules. Today, with the combination of new technologies that enable a substantial
expansion of surveillance power and the loss of trust from the Snowden disclosures, the technical community is standing
up for privacy principles (as opposed to rules) by aggressively propagating end-to-end encryption.

>As the debate over encryption and surveillance has played out. both technical and law-enforcement communities have made
earnest but incomplete arguments. Law enforcement invokes the “rule of law” but comes closer to advocating for the “rule
of rules.” In its appeal to the obligation to assist the government in executing court orders, the government side seems
to ignore both the historical limits on that rule and to give short shrift to the importance of the principles
associated with limiting the scope of government surveillance. By the same token, frequently heard arguments from the
technical community cite the principle of privacy protection as a reason to refuse to design systems that might address
law-enforcement needs, and thus place the principle of privacy protection above all other rules principles that are
properly part of our rule of law framework. In neither case do we attribute bad faith to these two opposing communities.
Still we can see that failure to account for the complete role of both rule and principle in the rule-of-law system
leads to incommensurate policy positions.

```bib
@incollection{matyas_incommensurability_2018,
  address = {Cham},
  title = {On the {Incommensurability} of {Laws} and {Technical} {Mechanisms}: {Or}, {What} {Cryptography} {Can}’t {Do}},
  volume = {11286},
  isbn = {9783030032500 9783030032517},
  shorttitle = {On the {Incommensurability} of {Laws} and {Technical} {Mechanisms}},
  url = {http://link.springer.com/10.1007/978-3-030-03251-7_31},
  urldate = {2020-03-26},
  booktitle = {Security {Protocols} {XXVI}},
  publisher = {Springer International Publishing},
  author = {Feigenbaum, Joan and Weitzner, Daniel J.},
  editor = {Matyáš, Vashek and Švenda, Petr and Stajano, Frank and Christianson, Bruce and Anderson, Jonathan},
  year = {2018},
  doi = {10.1007/978-3-030-03251-7_31},
  pages = {266--279}
}
```
