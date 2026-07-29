import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure PharmacokineticModelSpace where
  carr : Type
  routes : Type
  absorptionRate : Type
  eliminationRate : Type
  bioavailability : Prop

structure PharmacokineticAdmittedObject where
  space : PharmacokineticModelSpace
  firstOrderAbsorption : Prop
  linearElimination : Prop
  aucProportionalToDose : Prop
  conclusion : aucProportionalToDose

structure PharmacokineticEvidence (P : PharmacokineticAdmittedObject) where
  firstOrderAbsorptionClosed : P.firstOrderAbsorption
  linearEliminationClosed : P.linearElimination
  aucProportionalToDoseClosed : P.aucProportionalToDose

def PharmacokineticClosed (P : PharmacokineticAdmittedObject) : Prop :=
  P.firstOrderAbsorption ∧ P.linearElimination ∧ P.aucProportionalToDose

theorem pharmacokinetic_closed_from_evidence
    (P : PharmacokineticAdmittedObject) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.firstOrderAbsorptionClosed
    (And.intro E.linearEliminationClosed E.aucProportionalToDoseClosed)

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
