# Universally Composable Security: A New Paradigm for Cryptographic Protocols

- Summary:
  - Framework for composing sets of crypto protocols
  - NOTE: this is originally from 2000, but has been updated as of 2019
- Purpose:
- Premises:
- Contributions:
  - Develop and prove properties about this framework
- Policy comments:
- Technical comments:
  - I have not read this in detail yet.
  - The method of defining security protocols via their properties and interactions, in a structured
      and composable way, is extremely desirable
  - This would be a good way to express interfaces for families of EA protocols
- Notes:

```bib
@techreport{canetti_universally_2000,
  title = {Universally {Composable} {Security}: {A} {New} {Paradigm} for {Cryptographic} {Protocols}},
  shorttitle = {Universally {Composable} {Security}},
  url = {https://eprint.iacr.org/2000/067},
  abstract = {We present a general framework for representing cryptographic protocols and analyzing their security. The
framework allows specifying the security requirements of practically any cryptographic task in a unified and systematic
way. Furthermore, in this framework the security of protocols is maintained under a general protocol composition
operation, called universal composition. The proposed framework with its security-preserving composition property allow
for modular design and analysis of complex cryptographic protocols from relatively simple building blocks. Moreover,
within this framework, protocols are guaranteed to maintain their security within any context, even in the presence of
an unbounded number of arbitrary protocol instances that run concurrently in an adversarially controlled manner. This
is a useful guarantee, that allows arguing about the security of cryptographic protocols in complex and unpredictable
environments such as modern communication networks.},
  number = {067},
  urldate = {2020-02-05},
  author = {Canetti, Ran},
  year = {2000},
  keywords = {foundations, cryptographic protocols, security analysis of protocols, concurrent composition.}
}
```
