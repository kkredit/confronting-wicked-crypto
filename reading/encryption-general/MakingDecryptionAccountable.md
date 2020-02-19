# Making Decryption Accountable

- Summary:
  - Conflicting requirements: privacy of data and access to data; solution: accountable decryption
  - Means of establishing evidence that decryption has or has not been performed
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
  - Depends on HW device between decryption key and data
  - Accesses are logged in an append-only Merkle tree (related to blockchains)
  - The trusted HW device only performs the decryption if the access has been entered in the log
  - Steps must be taken to ensure device and users are referencing the same log and that it doesn't bifurcate
- Notes:

>The UK government has recently passed legislation allowing government agencies to access information about the
communications of private citizens, in order to solve crimes. In an effort to provide some kind of accountability, there
are stipulations in the law to ensure that the provisions of the act are used in ways that are necessary and
proportionate to the crimes being addressed. A protocol that makes decryption accountable could make verifiable the
quantity and perhaps the nature of decryptions.

```bib
@incollection{stajano_making_2017,
  address = {Cham},
  title = {Making {Decryption} {Accountable}},
  volume = {10476},
  isbn = {9783319710747 9783319710754},
  url = {http://link.springer.com/10.1007/978-3-319-71075-4_11},
  urldate = {2020-01-10},
  booktitle = {Security {Protocols} {XXV}},
  publisher = {Springer International Publishing},
  author = {Ryan, Mark D.},
  editor = {Stajano, Frank and Anderson, Jonathan and Christianson, Bruce and Matyáš, Vashek},
  year = {2017},
  doi = {10.1007/978-3-319-71075-4_11},
  pages = {93--98}
}
```
