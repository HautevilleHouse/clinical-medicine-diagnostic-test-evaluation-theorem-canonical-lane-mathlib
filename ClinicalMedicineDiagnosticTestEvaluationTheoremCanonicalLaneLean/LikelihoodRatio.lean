import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure LikelihoodRatioPackage where
  positiveLikelihoodRatio : Prop
  negativeLikelihoodRatio : Prop
  preTestProbability : Prop
  postTestProbability : Prop
  bayesianUpdate : Prop

structure LikelihoodRatioEvidence (L : LikelihoodRatioPackage) where
  positiveLikelihoodRatioClosed : L.positiveLikelihoodRatio
  negativeLikelihoodRatioClosed : L.negativeLikelihoodRatio
  preTestProbabilityClosed : L.preTestProbability
  postTestProbabilityClosed : L.postTestProbability
  bayesianUpdateClosed : L.bayesianUpdate

def LikelihoodRatioClosed (L : LikelihoodRatioPackage) : Prop :=
  L.positiveLikelihoodRatio ∧ L.negativeLikelihoodRatio ∧
  L.preTestProbability ∧ L.postTestProbability ∧ L.bayesianUpdate

theorem likelihood_ratio_closed_from_evidence
    (L : LikelihoodRatioPackage) (E : LikelihoodRatioEvidence L) :
    LikelihoodRatioClosed L := by
  exact And.intro E.positiveLikelihoodRatioClosed
    (And.intro E.negativeLikelihoodRatioClosed
      (And.intro E.preTestProbabilityClosed
        (And.intro E.postTestProbabilityClosed E.bayesianUpdateClosed)))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse