import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure ROCDataset where
  thresholds : List ℝ
  truePositiveRates : List ℝ
  falsePositiveRates : List ℝ
  areaUnderCurve : ℝ

def ROC_Analysis (R : ROCDataset) : Prop :=
  (∀ i j, i < j → R.truePositiveRates.get? i ≥ R.truePositiveRates.get? j) ∧
  (∀ i j, i < j → R.falsePositiveRates.get? i ≤ R.falsePositiveRates.get? j)

theorem area_under_curve_between_zero_and_one (R : ROCDataset) : 0 ≤ R.areaUnderCurve ∧ R.areaUnderCurve ≤ 1 := by
  constructor
  · exact Real.zero_le _
  · exact Real.le_one _

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse
