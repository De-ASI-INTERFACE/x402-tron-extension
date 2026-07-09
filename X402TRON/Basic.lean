-- ============================================================
-- x402-TRON: Basic Re-export Shim
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- Chain: TRON / TRC-20 / SunSwap v3
--
-- Re-exports X402TRON.PaymentVerification as the single
-- authoritative source of all shared types and definitions.
-- Chain-prefixed theorem aliases are provided for ergonomic use.
--
-- Note: TRON expiration is in milliseconds (block_time_ms /
-- expiration_ms), matching the TRON network's timestamp format.
-- ============================================================
import X402TRON.PaymentVerification

namespace X402TRON

/-- Alias: replay prevention under the TRON chain prefix.
    result type: a.nonce ∉ s.used_nonces. -/
theorem tron_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.nonce ∉ s.used_nonces :=
  replay_prevented a s h

/-- Alias: millisecond expiry enforcement under the TRON chain prefix.
    Delegates to within_expiry: s.block_time_ms ≤ a.expiration_ms. -/
theorem tron_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.block_time_ms ≤ a.expiration_ms :=
  within_expiry a s h

end X402TRON
