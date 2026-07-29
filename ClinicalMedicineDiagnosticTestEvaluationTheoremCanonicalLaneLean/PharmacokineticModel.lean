import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure PharmacokineticModelPackage where
  absorption : Prop
  distribution : Prop
  metabolism : Prop
  elimination : Prop
  linearKinetics : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  absorptionClosed : P.absorption
  distributionClosed : P.distribution
  metabolismClosed : P.metabolism
  eliminationClosed : P.elimination
  linearKineticsClosed : P.linearKinetics

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.absorption ∧ P.distribution ∧ P.metabolism ∧ P.elimination ∧ P.linearKinetics

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage) (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionClosed (And.intro E.distributionClosed (And.intro E.metabolismClosed (And.intro E.eliminationClosed E.linearKineticsClosed)))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse