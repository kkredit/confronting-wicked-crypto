# rayozzie/clear

- Summary:
  - A proposal for DE EA
  - See responses, tromer_2018 and green_2018
- Purpose:
- Premises:
- Contributions:
- Policy comments:
  - Arguments against:
    - Products constantly under attack
    - Homogeneous products for global market
    - Unintended consequences globally
    - Risks are unbounded (after Snowden revelations)
  - Conterarguments:
    - Secure key management (at corporate scale) is already a thing
    - Large vendors have the resources to comply with govt regulations worldwide
    - Large vendors have the resources to act as privacy defending counterbalance to govts
  - Further arguements:
    - The most important thing is _defaults_ on _most popular services and devices_
- Technical comments:
  - Proposed solution avoids some pitfalls:
    - No weakened encryption protocols
    - No new trust relationships (can argue that have more trust in mfr, but tbh we already really trust them)
    - No new HW
    - No new processes between govt and vendors
  - Weaknesses:
    - Requires operation/trust of HW, SW on device (reasonable since the focus is on _defaults_, not advanced actors)
  - Defense in depth -- double encrypt using multiple protocols; preserve forward secrecy (no details); have means to
      update SW and keys (no details)
- Notes:
  - The diagrams aren't fancy, but it is nice to have visuals. Does cybersecurity academia look down on visuals?

>I claim that this "vendor-authorized EA" procedure demonstrates that there is at least one technical method that does
not materially increase cybersecurity risk, even against state-level adversaries.

>Software Update is a very high-risk technology and practice. If it were being proposed today, no sane person would
believe that it could be implemented at scale. In theory, it just can’t work. But it works in practice because of the
strong economic and business need for it to exist. Software update has exhibited critical vulnerabilities, and there are
no vulnerabilities that are more rapidly addressed.

- After diagramming it
  - Some things appear inconsistent
    - Slide 18, shouldn't the DPK be reencrypted before being sent out as a "signature"?
    - Is the DAK E(VPK,DAK) or E(VPK,Vendor PIN)? I get different impressions from different places. An additional layer
        of protection (not sending the DAK directly) seems wise.
  - I think my model is a charitable representation
- Possible questions to ask
  - Is my representation fair?
  - What sort of response have you gotten from this work?
  - Has your opinion on this subject changed since this work?

```bib
@misc{ozzie_2018,
  author = {Ozzie, Ray},
  date = {2018-04-17},
  title = {rayozzie/clear},
  url = {https://github.com/rayozzie/clear},
  language = {en},
  urldate = {2020-01-22},
  journal = {GitHub}
}
```
