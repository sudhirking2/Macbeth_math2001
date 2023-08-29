/- Copyright (c) Heather Macbeth, 2022.  All rights reserved. -/
import Mathlib.Data.Real.Basic
import Library.Tactic.Addarith
import Library.Tactic.Cancel
import Library.Tactic.Numbers
import Library.Tactic.Extra

attribute [-instance] Int.instDivInt_1 Int.instDivInt EuclideanDomain.instDiv Nat.instDivNat


example {x y : ℤ} (h : 2 * x - y = 4 ∧ y - x + 1 = 2) : x = 5 := by
  obtain ⟨h1, h2⟩ := h
  calc
    x = 2 * x - y + (y - x + 1) - 1 := by ring
    _ = 4 + 2 - 1 := by rw [h1, h2]
    _ = 5 := by ring


example {p : ℚ} (hp : p ^ 2 ≤ 8) : p ≥ -5 := by
  have hp' : -3 ≤ p ∧ p ≤ 3
  · apply abs_le_of_sq_le_sq'
    calc
      p ^ 2 ≤ 9 := by addarith [hp]
      _ = 3 ^ 2 := by numbers
    numbers
  · rcases hp' with ⟨hp', _⟩
    calc
      p ≥ -3 := hp'
      _ ≥ -5 := by numbers


example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 ∧ b = 1 := by
  constructor
  · calc
      a = 4 + 5 * b := by addarith [h1]
      _ = -6 + 5 * (b + 2) := by ring
      _ = -6 + 5 * 3 := by rw [h2]
      _ = 9 := by ring   
  · addarith [h2]


example {a b : ℝ} (h1 : a - 5 * b = 4) (h2 : b + 2 = 3) : a = 9 ∧ b = 1 := by
  have hb : b = 1 := by addarith [h2]
  constructor
  · calc
      a = 4 + 5 * b := by addarith [h1]
      _ = 4 + 5 * 1 := by rw [hb]
      _ = 9 := by ring   
  · apply hb


example {a b : ℝ} (h1 : a ^ 2 + b ^ 2 = 0) : a = 0 ∧ b = 0 := by
  have h2 : a ^ 2 = 0
  · apply le_antisymm
    calc
      a ^ 2 ≤ a ^ 2 + b ^ 2 := by extra
      _ = 0 := by rw [h1]      
    extra
  have h3 : a=0 := by rw [← sq_eq_zero_iff]; exact h2
  · constructor
    · exact h3
    · rw[h3] at h1
      simp at h1 
      exact h1

/-! # Exercises -/


example {a b : ℚ} (H : a ≤ 1 ∧ a + b ≤ 3) : 2 * a + b ≤ 4 := by
  obtain ⟨h1, h2⟩ := H
  calc 
    2 * a + b = a + (a + b) := by ring
    _ ≤ 1 + 3 := by rel[h1, h2]
    _ = 4 := by numbers

example {r s : ℝ} (H : r + s ≤ 1 ∧ r - s ≤ 5) : 2 * r ≤ 6 := by
  rcases H with ⟨h1, h2⟩ 
  rw [two_mul]
  addarith[h1, h2]

example {m n : ℤ} (H : n ≤ 8 ∧ m + 5 ≤ n) : m ≤ 3 := by
  rcases H with ⟨h1, h2⟩ 
  addarith[h1, h2]

example {p : ℤ} (hp : p + 2 ≥ 9) : p ^ 2 ≥ 49 ∧ 7 ≤ p := by
  constructor
  · calc 
      p^2 ≥ 7^2 := by rel[calc  p≥ 7 := by addarith[hp]]
      _ = 49 := by numbers
  · addarith[hp]

example {a : ℚ} (h : a - 1 ≥ 5) : a ≥ 6 ∧ 3 * a ≥ 10 := by
  constructor
  · addarith[h]
  · calc
      3*a = 3*(a-1) + 3 := by ring
      _ ≥ 3*5 + 3 := by rel[h]
      _ ≥ 10 := by numbers

example {x y : ℚ} (h : x + y = 5 ∧ x + 2 * y = 7) : x = 3 ∧ y = 2 := by
  obtain ⟨h1, h2⟩ := h
  constructor
  · calc
      x = 2 * (x + y) - (x + 2 * y ) := by ring
      _ = 3 := by rw[h1,h2]; numbers
  · calc
      y = (x+2*y) - (x+y) := by ring
      _ = 2 := by rw[h1,h2]; numbers

example {a b : ℝ} (h1 : a * b = a) (h2 : a * b = b) :
    a = 0 ∧ b = 0 ∨ a = 1 ∧ b = 1 := by
    have := em (a=0)
    rcases this with this | this
    · left
      exact ⟨this, by rw[← h2, this]; simp⟩
    · right
      have h1 : a*b = a*1 := by rw[h1]; ring
      have hb : b=1 := by cancel a at h1
      exact ⟨calc a = a * 1 := by ring
        _ = 1 := by rw[hb] at h2; rw[h2], hb⟩
