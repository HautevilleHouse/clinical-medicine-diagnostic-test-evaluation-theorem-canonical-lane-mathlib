import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  censoringIndicator : ℝ → ℝ

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : ∀ t > 0, S.hazardFunction t ≥ 0
  survivalFunctionClosed : ∀ t > 0, S.survivalFunction t > 0
  survivalAtZeroClosed : S.survivalFunction 0 = 1
  censoringIndicatorClosed : ∀ t > 0, S.censoringIndicator t ∈ ({0, 1} : Set ℝ)

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  (∀ t > 0, S.hazardFunction t ≥ 0) ∧
  (∀ t > 0, S.survivalFunction t > 0) ∧
  S.survivalFunction 0 = 1 ∧
  (∀ t > 0, S.censoringIndicator t ∈ ({0, 1} : Set ℝ))

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.survivalAtZeroClosed E.censoringIndicatorClosed))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
