import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure BayesianDiagnosticInferencePackage where
  priorProbability : Prop
  likelihoodRatio : Prop
  posteriorProbability : Prop
  bayesTheorem : Prop
  preTestPostTest : Prop

structure BayesianDiagnosticInferenceEvidence (B : BayesianDiagnosticInferencePackage) where
  priorProbabilityClosed : B.priorProbability
  likelihoodRatioClosed : B.likelihoodRatio
  posteriorProbabilityClosed : B.posteriorProbability
  bayesTheoremClosed : B.bayesTheorem
  preTestPostTestClosed : B.preTestPostTest

def BayesianDiagnosticInferenceClosed (B : BayesianDiagnosticInferencePackage) : Prop :=
  B.priorProbability ∧ B.likelihoodRatio ∧ B.posteriorProbability ∧ B.bayesTheorem ∧ B.preTestPostTest

theorem bayesian_diagnostic_inference_closed_from_evidence (B : BayesianDiagnosticInferencePackage) (E : BayesianDiagnosticInferenceEvidence B) : BayesianDiagnosticInferenceClosed B := by
  exact And.intro E.priorProbabilityClosed (And.intro E.likelihoodRatioClosed (And.intro E.posteriorProbabilityClosed (And.intro E.bayesTheoremClosed E.preTestPostTestClosed)))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse