import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  initialConditions : Prop
  transferRates : Prop
  wellStirredAssumption : Prop
  conservationOfMass : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  initialConditionsClosed : C.initialConditions
  transferRatesClosed : C.transferRates
  wellStirredAssumptionClosed : C.wellStirredAssumption
  conservationOfMassClosed : C.conservationOfMass

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.initialConditions ∧ C.transferRates ∧ C.wellStirredAssumption ∧ C.conservationOfMass

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.initialConditionsClosed (And.intro E.transferRatesClosed (And.intro E.wellStirredAssumptionClosed E.conservationOfMassClosed))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse