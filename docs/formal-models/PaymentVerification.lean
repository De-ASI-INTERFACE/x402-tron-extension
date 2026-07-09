-- x402-TRON | Author: Richard Patterson
import Mathlib.Data.Finset.Basic
namespace X402TRON
structure TRONPayment where
  nonce : Nat; amount : Nat; expiration_ms : Nat
  deriving Repr
structure ContractState where
  used_nonces : Finset Nat; block_time_ms : Nat
  deriving Repr
def verify (p : TRONPayment) (s : ContractState) : Prop :=
  p.nonce ∉ s.used_nonces ∧ s.block_time_ms ≤ p.expiration_ms
theorem tron_replay_prevented (p : TRONPayment) (s : ContractState)
    (h : verify p s) : p.nonce ∉ s.used_nonces := h.1
end X402TRON
