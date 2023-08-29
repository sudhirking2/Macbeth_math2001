/- Copyright (c) Heather Macbeth, 2023.  All rights reserved. -/
import Mathlib.Data.Real.Basic
import Library.Theory.Comparison
import Library.Theory.ParityModular
import Library.Tactic.Addarith
import Library.Tactic.Cancel
import Library.Tactic.ExistsDelaborator
import Library.Tactic.Numbers
import Library.Tactic.Extra
import Library.Tactic.Use

set_option linter.unusedVariables false
set_option pp.unicode.fun true
set_option push_neg.use_distrib true
attribute [-instance] Int.instDivInt_1 Int.instDivInt EuclideanDomain.instDiv Nat.instDivNat
open Function 
namespace Int


/-! # Homework 7 -/


/- 4 points -/
theorem problem2a : Surjective (fun (x : ℝ) ↦ 2 * x) := by
  sorry

/- 4 points -/
theorem problem2b : ¬ Surjective (fun (x : ℝ) ↦ 2 * x) := by
  sorry


/- 4 points -/
theorem problem3a : Surjective (fun (x : ℤ) ↦ 2 * x) := by
  sorry

/- 4 points -/
theorem problem3b : ¬ Surjective (fun (x : ℤ) ↦ 2 * x) := by
  sorry

/- 5 points -/
theorem problem4a : ∀ (f : ℚ → ℚ), Injective f → Injective (fun x ↦ f x + 1) := by
  sorry

/- 5 points -/
theorem problem4b : ¬ ∀ (f : ℚ → ℚ), Injective f → Injective (fun x ↦ f x + 1) := by
  sorry


/- 4 points -/
theorem problem5a : Bijective (fun (x : ℝ) ↦ 4 - 3 * x) := by
  sorry

/- 4 points -/
theorem problem5b : ¬ Bijective (fun (x : ℝ) ↦ 4 - 3 * x) := by
  sorry


/- 4 points -/
theorem problem6 {f : X → Y} (hf : Surjective f) {g : Y → Z} (hg : Surjective g) :
    Surjective (g ∘ f) := by
  sorry
