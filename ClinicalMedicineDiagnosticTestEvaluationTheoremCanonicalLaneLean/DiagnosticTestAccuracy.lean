import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure DiagnosticTestAccuracyPackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  accuracy : Prop

structure DiagnosticTestAccuracyEvidence (D : DiagnosticTestAccuracyPackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  accuracyClosed : D.accuracy

def DiagnosticTestAccuracyClosed (D : DiagnosticTestAccuracyPackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.accuracy

theorem diagnostic_test_accuracy_closed_from_evidence (D : DiagnosticTestAccuracyPackage) (E : DiagnosticTestAccuracyEvidence D) : DiagnosticTestAccuracyClosed D := by
  exact And.intro E.sensitivityClosed (And.intro E.specificityClosed (And.intro E.positivePredictiveValueClosed (And.intro E.negativePredictiveValueClosed E.accuracyClosed)))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse