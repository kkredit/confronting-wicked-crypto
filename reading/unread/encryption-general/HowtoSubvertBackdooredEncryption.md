# How to Subvert Backdoored Encryption: Security Against Adversaries that Decrypt All Ciphertexts

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
@article{horel_how_2018,
  title = {How to {Subvert} {Backdoored} {Encryption}: {Security} {Against} {Adversaries} that
{Decrypt} {All} {Ciphertexts}},
  shorttitle = {How to {Subvert} {Backdoored} {Encryption}},
  url = {http://arxiv.org/abs/1802.07381},
  doi = {10.4230/LIPIcs.ITCS.2019.42},
  abstract = {We study secure and undetectable communication in a world where governments can read
all encrypted communications of citizens. We consider a world where the only permitted
communication method is via a government-mandated encryption scheme, using government-mandated
keys. Citizens caught trying to communicate otherwise (e.g., by encrypting strings which do not
appear to be natural language plaintexts) will be arrested. The one guarantee we suppose is that
the government-mandated encryption scheme is semantically secure against outsiders: a perhaps
advantageous feature to secure communication against foreign entities. But what good is semantic
security against an adversary that has the power to decrypt? Even in this pessimistic scenario, we
show citizens can communicate securely and undetectably. Informally, there is a protocol between
Alice and Bob where they exchange ciphertexts that look innocuous even to someone who knows the
secret keys and thus sees the corresponding plaintexts. And yet, in the end, Alice will have
transmitted her secret message to Bob. Our security definition requires indistinguishability
between unmodified use of the mandated encryption scheme, and conversations using the mandated
encryption scheme in a modified way for subliminal communication. Our topics may be thought to fall
broadly within the realm of steganography: the science of hiding secret communication in
innocent-looking messages, or cover objects. However, we deal with the non-standard setting of
adversarial cover object distributions (i.e., a stronger-than-usual adversary). We leverage that
our cover objects are ciphertexts of a secure encryption scheme to bypass impossibility results
which we show for broader classes of steganographic schemes. We give several constructions of
subliminal communication schemes based on any key exchange protocol with random messages (e.g.,
Diffie-Hellman).},
  urldate = {2020-01-10},
  journal = {arXiv:1802.07381 [cs]},
  author = {Horel, Thibaut and Park, Sunoo and Richelson, Silas and Vaikuntanathan, Vinod},
  month = feb,
  year = {2018},
  note = {arXiv: 1802.07381},
  keywords = {Computer Science - Cryptography and Security}
}
```
