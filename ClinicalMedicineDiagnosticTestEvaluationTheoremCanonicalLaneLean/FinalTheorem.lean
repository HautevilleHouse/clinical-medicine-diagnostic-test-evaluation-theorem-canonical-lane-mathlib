import ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

def ConstrainedDiagnosticTestClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_diagnostic_test_endgame (A : AdmissibleClass) :
    ConstrainedDiagnosticTestClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse