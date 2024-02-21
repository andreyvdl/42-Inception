<div align=center>
  <img src=https://github.com/gawbsouza/42-pdh/blob/main/dark/inception_dark.svg>
  <br>
  <a href=https://github.com/gawbsouza/42-pdh><img src=https://github.com/gawbsouza/42-pdh/blob/main/badge/42pdh_badge.svg></a>
</div>


```mermaid
---
title: Inception flow
---

flowchart LR

net(("internet"))
nginxMan["nginx
  mandatory"]
wpPHP["wordpress
  mandatory"]
wpDB[("wordpress
  database")]
outCont["host db
  container"]
outDB[("host
  database")]

net <---> nginxMan

subgraph HOST PC
  subgraph DOCKER NETWORK
    outCont <---> wpPHP
    wpPHP <---> nginxMan
  end
  outCont <---> outDB
  wpPHP <---> wpDB
  wpDB <---> nginxMan
end

```
