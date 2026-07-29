import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure MetaAnalysisDiagnosticAccuracyPackage where
  pooledSensitivity : Prop
  pooledSpecificity : Prop
  heterogeneityAssessment : Prop
  publicationBias : Prop
  summaryROC : Prop

structure MetaAnalysisDiagnosticAccuracyEvidence (M : MetaAnalysisDiagnosticAccuracyPackage) where
  pooledSensitivityClosed : M.pooledSensitivity
  pooledSpecificityClosed : M.pooledSpecificity
  heterogeneityAssessmentClosed : M.heterogeneityAssessment
  publicationBiasClosed : M.publicationBias
  summaryROCClosed : M.summaryROC

def MetaAnalysisDiagnosticAccuracyClosed (M : MetaAnalysisDiagnosticAccuracyPackage) : Prop :=
  M.pooledSensitivity ∧ M.pooledSpecificity ∧ M.heterogeneityAssessment ∧
  M.publicationBias ∧ M.summaryROC

theorem meta_analysis_diagnostic_accuracy_closed_from_evidence
    (M : MetaAnalysisDiagnosticAccuracyPackage) (E : MetaAnalysisDiagnosticAccuracyEvidence M) :
    MetaAnalysisDiagnosticAccuracyClosed M := by
  exact And.intro E.pooledSensitivityClosed
    (And.intro E.pooledSpecificityClosed
      (And.intro E.heterogeneityAssessmentClosed
        (And.intro E.publicationBiasClosed E.summaryROCClosed)))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse