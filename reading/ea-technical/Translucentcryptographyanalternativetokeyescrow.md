# Translucent cryptography: an alternative to key escrow and its implementation via fractional oblivious transfer

- Summary:
  - A technical alternative to key escrow
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
@book{bellare_translucent_1996,
  month = {nov},
  address = {Cambridge, Mass.},
  title = {Translucent cryptography: an alternative to key escrow and its implementation via fractional oblivious
transfer},
  shorttitle = {Translucent cryptography},
  abstract = {Abstract: "We present an alternative to the controversial 'key escrow' techniques for enabling
law-enforcement and national security access to encrypted communications. Our proposal allows such access with
probability p for each message, for a parameter p between 0 and 1 to be chosen (say, by Congress) to provide an
appropriate balance between concerns for individual privacy, on the one hand, and the need for such access by
law-enforcement and national security, on the other. For example, with p = 0.4, a law-enforcement agency conducting an
authorized wiretap which records 100 encrypted conversations would expect to be able to decrypt (approximately) 40 of
these conversations; the agency would not be able to decrypt the remaining 60 conversations at all. Different values of
p can be chosen for different situations, such as for export. Our proposal can be combined with other ideas, such as
secret-sharing, to provide additional flexibility. Our scheme is remarkably simple to implement, as it requires no
prior escrowing of keys. We provide an efficient implementation of translucent cryptography. It is based on non-
interactive oblivious transfer, as pioneered by Bellare and Micali [2], who showed how to transfer a message with
probability 1/2. We provide means for non-interactive fractional oblivious transfer, which allows a message to be
transmitted with any given probability p. Our protocol is based on the Diffie-Hellman assumption and uses just one El
Gamal encryption (two exponentiations), regardless of the value of the transfer probability p. This makes the
implementation of translucent cryptography competitive, in efficiency of encryption, with current suggestions for
software key escrow such as the fair Diffie-Hellman system [20], so that efficiency, at least, is not a barrier to its
consideration."},
  language = {English},
  publisher = {Massachusetts Institute of Technology. Laboratory for Computer Science},
  author = {Bellare, Mihir and Rivest, Ronald L},
  year = {1996},
  note = {OCLC: 37685990}
}
```
