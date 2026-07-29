import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure DiagnosticTestEvaluationPackage where
  testSensitivity : ℝ
  testSpecificity : ℝ
  diseasePrevalence : ℝ
  diagnosticOddsRatio : ℝ

structure DiagnosticTestEvaluationEvidence (D : DiagnosticTestEvaluationPackage) where
  sensitivityClosed : D.testSensitivity > 0.5 ∧ D.testSensitivity < 1.0
  specificityClosed : D.testSpecificity > 0.5 ∧ D.testSpecificity < 1.0
  prevalenceClosed : D.diseasePrevalence ≥ 0 ∧ D.diseasePrevalence ≤ 1
  diagnosticOddsRatioClosed : D.diagnosticOddsRatio > 1

def DiagnosticTestEvaluationClosed (D : DiagnosticTestEvaluationPackage) : Prop :=
  (D.testSensitivity > 0.5 ∧ D.testSensitivity < 1.0) ∧
  (D.testSpecificity > 0.5 ∧ D.testSpecificity < 1.0) ∧
  (D.diseasePrevalence ≥ 0 ∧ D.diseasePrevalence ≤ 1) ∧
  (D.diagnosticOddsRatio > 1)

theorem diagnostic_test_evaluation_closed_from_evidence (D : DiagnosticTestEvaluationPackage)
    (E : DiagnosticTestEvaluationEvidence D) : DiagnosticTestEvaluationClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.prevalenceClosed E.diagnosticOddsRatioClosed))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
