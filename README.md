# GenStageTest

```
bash> mix new gen_stage_test --sup
```

```
alias Stage.{A, B, C}

{:ok, a} = A.start_link(0)
{:ok, b} = B.start_link(2)
{:ok, c} = C.start_link()

GenStage.sync_subscribe(c, to: b)
GenStage.sync_subscribe(b, to: a)
```

### 13 Feb 2021 by Oleg G.Kapranov
