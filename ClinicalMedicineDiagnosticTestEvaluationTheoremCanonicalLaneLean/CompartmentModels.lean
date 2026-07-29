import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure CompartmentModelSpace where
  carr : Type
  compartments : Nat
  stateSpace : Type
  transitionMatrix : Type
  steadyState : Prop

structure CompartmentModelAdmittedObject where
  space : CompartmentModelSpace
  wellStirredAssumption : Prop
  linearKinetics : Prop
  identifiable : Prop
  conclusion : identifiable

structure CompartmentModelEvidence (C : CompartmentModelAdmittedObject) where
  wellStirredAssumptionClosed : C.wellStirredAssumption
  linearKineticsClosed : C.linearKinetics
  identifiableClosed : C.identifiable

def CompartmentModelClosed (C : CompartmentModelAdmittedObject) : Prop :=
  C.wellStirredAssumption ∧ C.linearKinetics ∧ C.identifiable

theorem compartment_model_closed_from_evidence
    (C : CompartmentModelAdmittedObject) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.wellStirredAssumptionClosed
    (And.intro E.linearKineticsClosed E.identifiableClosed)

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
