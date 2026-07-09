-- x402-TRON Payment Verification | Author: Richard Patterson
import X402TRON.Basic

namespace X402TRON.Verification

def settle (p : TRONPayment) (s : ContractState) (h : verify p s) : ContractState :=
  { s with used_nonces := s.used_nonces ∪ {p.nonce} }

theorem settled_nonce_recorded (p : TRONPayment) (s : ContractState) (h : verify p s)
    : p.nonce ∈ (settle p s h).used_nonces := by
  simp [settle, Finset.mem_union, Finset.mem_singleton]

end X402TRON.Verification
