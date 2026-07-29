import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  absorptionModel : Type
  distributionVolume : ℝ → ℝ
  eliminationRate : ℝ
  bioequivalenceCondition : Prop

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
