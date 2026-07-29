import ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure DiagnosticTestAdmittedObject where
  testResult : Prop
  goldStandard : Prop
  sensitivitySpecificity : Prop
  conclusion : sensitivitySpecificity

def DiagnosticTestWitnessClosed (O : DiagnosticTestAdmittedObject) : Prop :=
  O.sensitivitySpecificity

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse