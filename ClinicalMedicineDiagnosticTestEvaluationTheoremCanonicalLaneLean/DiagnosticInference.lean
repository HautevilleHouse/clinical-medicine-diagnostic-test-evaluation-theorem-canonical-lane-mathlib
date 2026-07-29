import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure DiagnosticTestSpace where
  carr : Type
  testResults : Type
  diseaseStatus : Type
  sensitivity : Prop
  specificity : Prop
  predictiveValues : Prop

structure DiagnosticAdmittedObject where
  space : DiagnosticTestSpace
  conditionalIndependence : Prop
  preTestPrevalence : Prop
  bayesUpdateValid : Prop
  conclusion : predictiveValuesCorrect

def predictiveValuesCorrect (D : DiagnosticAdmittedObject) : Prop := D.space.predictiveValues

structure DiagnosticEvidence (D : DiagnosticAdmittedObject) where
  conditionalIndependenceClosed : D.conditionalIndependence
  preTestPrevalenceClosed : D.preTestPrevalence
  bayesUpdateValidClosed : D.bayesUpdateValid
  predictiveValuesCorrectClosed : predictiveValuesCorrect D

def DiagnosticClosed (D : DiagnosticAdmittedObject) : Prop :=
  D.conditionalIndependence ∧ D.preTestPrevalence ∧ D.bayesUpdateValid ∧ predictiveValuesCorrect D

theorem diagnostic_closed_from_evidence
    (D : DiagnosticAdmittedObject) (E : DiagnosticEvidence D) : DiagnosticClosed D := by
  exact And.intro E.conditionalIndependenceClosed
    (And.intro E.preTestPrevalenceClosed
      (And.intro E.bayesUpdateValidClosed E.predictiveValuesCorrectClosed))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
