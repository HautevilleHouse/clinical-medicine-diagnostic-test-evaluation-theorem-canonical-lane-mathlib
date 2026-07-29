import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure DiagnosticTestEvaluationPackage where
  diseasePrevalence : Prop
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  testAccuracy : Prop

structure DiagnosticTestEvaluationEvidence (D : DiagnosticTestEvaluationPackage) where
  diseasePrevalenceClosed : D.diseasePrevalence
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  testAccuracyClosed : D.testAccuracy

def DiagnosticTestEvaluationClosed (D : DiagnosticTestEvaluationPackage) : Prop :=
  D.diseasePrevalence ∧ D.sensitivity ∧ D.specificity ∧
  D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.testAccuracy

theorem diagnostic_test_evaluation_closed_from_evidence
    (D : DiagnosticTestEvaluationPackage) (E : DiagnosticTestEvaluationEvidence D) :
    DiagnosticTestEvaluationClosed D := by
  exact And.intro E.diseasePrevalenceClosed
    (And.intro E.sensitivityClosed
      (And.intro E.specificityClosed
        (And.intro E.positivePredictiveValueClosed
          (And.intro E.negativePredictiveValueClosed E.testAccuracyClosed))))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse