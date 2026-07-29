import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  compartmentCount : ℕ
  absorptionRate : ℝ → ℝ → ℝ
  eliminationRate : ℝ → ℝ → ℝ
  volumeDistribution : ℝ

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  compartmentCountClosed : C.compartmentCount ≥ 1
  absorptionRateClosed : ∀ (t : ℝ), C.absorptionRate t 0 = 0
  eliminationRateClosed : ∀ (t : ℝ), C.eliminationRate t 0 = 0
  volumeDistributionClosed : C.volumeDistribution > 0

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartmentCount ≥ 1 ∧
  (∀ (t : ℝ), C.absorptionRate t 0 = 0) ∧
  (∀ (t : ℝ), C.eliminationRate t 0 = 0) ∧
  C.volumeDistribution > 0

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.compartmentCountClosed
    (And.intro E.absorptionRateClosed
      (And.intro E.eliminationRateClosed E.volumeDistributionClosed))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
