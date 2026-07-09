import Lake
open Lake DSL
package «x402-tron» where
  name := "x402-tron"
require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"
lean_lib «X402TRON» where
  roots := #[`X402TRON]
