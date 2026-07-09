-- x402-TRON Basic | Author: Richard Patterson (@De-ASI-INTERFACE)
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Nat.Basic

namespace X402TRON

structure TRONPayment where
  nonce         : Nat
  amount        : Nat
  expiration_ms : Nat
  deriving Repr, DecidableEq

structure ContractState where
  used_nonces  : Finset Nat
  block_time_ms : Nat
  deriving Repr

def verify (p : TRONPayment) (s : ContractState) : Prop :=
  p.nonce ∉ s.used_nonces ∧ s.block_time_ms ≤ p.expiration_ms

theorem tron_replay_prevented (p : TRONPayment) (s : ContractState) (h : verify p s)
    : p.nonce ∉ s.used_nonces := h.1

theorem tron_not_expired (p : TRONPayment) (s : ContractState) (h : verify p s)
    : s.block_time_ms ≤ p.expiration_ms := h.2

end X402TRON
