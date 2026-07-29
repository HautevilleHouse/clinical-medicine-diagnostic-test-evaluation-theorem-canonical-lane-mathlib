import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : List String
  transferRates : List (String × String × ℝ)
  initialConditions : String → ℝ
  conservationCondition : Prop
  steadyStateExistence : Prop

structure CompartmentModelEvidence (M : CompartmentModel) where
  conservationClosed : M.conservationCondition
  steadyStateClosed : M.steadyStateExistence

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.conservationCondition ∧ M.steadyStateExistence

theorem compartment_model_closed_from_evidence (M : CompartmentModel)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M :=
  And.intro E.conservationClosed E.steadyStateClosed

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
