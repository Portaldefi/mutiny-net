Current infra (simplified):

```mermaid
flowchart TD
    A[Bitcoind] --> B[LND - LP1]
    A --> C[LND - LP2]
    A -->  D[LND - Peering]
    B <--> |LN| D
    C <--> |LN| D
    A[Bitcoind] --> E(Esplora)
    F[fa:fa-mobile Apps]
    D <--> |LN| F
    E --> F
```
