-- ============================================================
-- x402-TRON: Facilitator State Integrity
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- ============================================================
import Mathlib.Data.Finset.Basic
import X402TRON.PaymentVerification

namespace X402TRON.Facilitator

theorem nonces_monotone (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.used_nonces ⊆ (settle a s).used_nonces := by simp [settle]; exact Finset.subset_union_left

theorem fresh_not_in_pre_state (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.nonce ∉ s.used_nonces := replay_prevented a s h

structure TimeStep where
  s_before : FacilitatorState; s_after : FacilitatorState
  mono : s_before.block_time_ms ≤ s_after.block_time_ms

theorem expiry_is_monotone (a : PaymentAuth) (ts : TimeStep) (h_valid : not_expired a ts.s_before) :
    ts.s_before.block_time_ms ≤ a.expiration_ms := h_valid

end X402TRON.Facilitator
