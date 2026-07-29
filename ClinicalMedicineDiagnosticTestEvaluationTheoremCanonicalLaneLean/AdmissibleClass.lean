import ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean.ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : DiagnosticTestObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiagnosticTestClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

structure DiagnosticTestObject where
  testName : String
  sensitivity : ℚ
  specificity : ℚ
  prevalence : ℚ
  positivePredictiveValue : ℚ
  negativePredictiveValue : ℚ
  likelihoodRatioPositive : ℚ
  likelihoodRatioNegative : ℚ
  testCharacteristicsValid : Prop

def DiagnosticTestClosed (D : DiagnosticTestObject) : Prop :=
  D.sensitivity ≥ 0 ∧ D.sensitivity ≤ 1 ∧ D.specificity ≥ 0 ∧ D.specificity ≤ 1 ∧
  D.prevalence ≥ 0 ∧ D.prevalence ≤ 1 ∧ D.positivePredictiveValue ≥ 0 ∧ D.positivePredictiveValue ≤ 1 ∧
  D.negativePredictiveValue ≥ 0 ∧ D.negativePredictiveValue ≤ 1 ∧ D.testCharacteristicsValid

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse