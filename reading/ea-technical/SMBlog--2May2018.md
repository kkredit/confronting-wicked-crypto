# Eran Tromer's Attack on Ray Ozzie's CLEAR Protocol

- Summary:
  - Describes weaknesses in Ozzie's CLEAR protocol (ozzie_2018)
- Purpose:
  - Demonstrate that the theat model is complicated!
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
  - We have to consider the second order effects
    - Ozzie says (or implies) b/c focus is on defaults and popular services, and high level actors are not going to be
        caught this way anyway, not a big deal that we trust the device HW and SW; common users aren't tampering with
        that and high tech ones are using Signal or something
    - However, the question we _have_ to ask is, "how is this going to be abused"?
  - The attack:
    - Attacker plants a phone as a trojan horse, it has compromised HW/SW
    - They have programmed phone to pretend to be the phone _they_ have in possession, and to forward the key LE enters
    - With forwarded key, they have MITM'd and unlocked whatever phone they have in their possession
  - Tromer admits this could be addressed
  - Also says that some of the mitigations would be "notoriously difficult, unwieldy and expensive", but that can be
      considered a good thing (unless it can be avoided, in which case it will be)
- Notes:

>These are powerful avenues of attack, because phones are flexible devices with the capability to display arbitrary
information, communicate wirelessly with adversaries, and spy on their environment. In a critical forensic
investigation, you would never want to turn on a phone and run whatever nefarious or self-destructing software may be
programmed in it. Moreover, the last thing you'd do is let a phone found on the street issue requests to a highly
sensitive system that dispenses unlock codes (even if these requests are issued indirectly, through a well-meaning but
hapless law enforcement officer who's just following procedure).

>Indeed, in computer forensics, a basic precaution against such attacks is to never turn on the computer in an
uncontrolled fashion; rather, you would extract its storage data and analyze it on a different, trustworthy computer.

```bib
@misc{tromer_2018,
  author = {Tromer, Eran},
  date = {2018-05-02},
  title = {Eran Tromer's Attack on Ray Ozzie's CLEAR Protocol},
  url = {https://www.cs.columbia.edu/~smb/blog/2018-05/2018-05-02.html},
  urldate = {2020-01-22}
}
```
