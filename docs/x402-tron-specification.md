# x402-TRON Specification
**Author:** Richard Patterson | **Ref:** RP-DEASI-TRX-2026-0709-001

## TRX Schema (`scheme: tron-trx`)
```json
{ "scheme": "tron-trx", "network": "mainnet",
  "ownerAddress": "T<base58>", "toAddress": "T<facilitator-base58>",
  "amount": "<sun-int64>", "nonce": "<int64>",
  "expiration": "<unix-ms>", "txID": "<hex>",
  "signature": "<secp256k1-sig>" }
```

## TRC-20 Schema (`scheme: tron-trc20`)
```json
{ "scheme": "tron-trc20",
  "contractAddress": "T<trc20-contract>",
  "ownerAddress": "T<sender>", "toAddress": "T<facilitator>",
  "amount": "<uint256>", "nonce": "<int64>",
  "expiration": "<unix-ms>", "signature": "<secp256k1-sig>" }
```

## TRON-Specific Invariants
1. **3s Block Confirmation:** Payment confirmed in TRON's 3-second DPoS block before routing
2. **Energy Gate:** Facilitator verifies sender has sufficient energy for TRC-20 transfer
3. **Expiration Field:** Built into TRON transaction structure; invalid after expiration timestamp
4. **USDT-TRC20 Priority:** Extension optimized for USDT (highest volume stablecoin on TRON)
5. **Nonce Replay Prevention:** Contract state `mapping(int64 => bool) usedNonces`
