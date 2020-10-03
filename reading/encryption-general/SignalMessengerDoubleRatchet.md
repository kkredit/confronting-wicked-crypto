# Signal Messenger: The Double Ratchet Algorithm

- Summary:
  - Tech specs for the Signal double ratchet algorithm, the main ephemeral key derivation process that creates forward
      secrecy
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:
  - https://www.youtube.com/watch?v=9sO2qdTci-s is a good intro
  - https://www.youtube.com/watch?v=Q0_lcKrUdWg talks about group chats and why (for practical reasons) they eliminate
      forward secrecy
    - This elimination of forward secrecy is explicitly mentioned in abelson_2015 as an argument against "ghost"s
    - But isn't it the naive approach to turn all conversations into group conversations?
      - Group conversations already use this weaker approach, so adding a ghost doesn't have the fundamental impact
      - The reason for shifting to group conversations is because it is inefficient. But if the max size is 3 parties,
          the inefficiency is bounded and not particularly large.
      - The video alluded to research that is removing this necessary loss of forward secrecy. If/when that happens,
          this particular argument falls apart

```bib
@misc{marlinspike_2016,
  author = {Marlinspike, Moxie and Perrin, Trevor},
  year = {2016},
  month = {nov},
  title = {Signal {Messenger}: The Double Ratchet Algorithm},
  shorttitle = {Signal {Messenger}},
  url = {https://www.signal.org/docs/specifications/doubleratchet/},
  abstract = {Say "hello" to a different messaging experience. An unexpected focus on privacy, combined with all of the
features you expect.},
  language = {en},
  urldate = {2020-09-27},
  journal = {Signal Messenger},
}
```
