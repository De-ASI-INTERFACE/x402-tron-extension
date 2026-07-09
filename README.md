# x402-TRON Extension
**HTTP 402 Payment-Gated Routing on TRON**
**Author:** Richard Patterson (@De-ASI-INTERFACE) | **Version:** 1.0.0 | **Date:** 2026-07-09 | **License:** MIT

## Overview
The x402-TRON Extension adapts the x402 HTTP 402 payment standard to the TRON network using TRC-20 token payments, TVM (TRON Virtual Machine) smart contracts, and TRON's secp256k1 account signing. It defines `scheme: tron-trx` for native TRX and `scheme: tron-trc20` for TRC-20 token payments (including USDT-TRC20 — the largest stablecoin volume on TRON), with SunSwap v3 as the canonical AMM routing surface. Lean 4 proofs verify block number expiry, nonce replay prevention, and energy/bandwidth resource gate invariants.
**Reference ID:** RP-DEASI-TRX-2026-0709-001
