import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean

structure ReceiverOperatingCharacteristicPackage where
  truePositiveRate : Prop
  falsePositiveRate : Prop
  auc : Prop
  optimalThreshold : Prop
  rocCurve : Prop

structure ReceiverOperatingCharacteristicEvidence (R : ReceiverOperatingCharacteristicPackage) where
  truePositiveRateClosed : R.truePositiveRate
  falsePositiveRateClosed : R.falsePositiveRate
  aucClosed : R.auc
  optimalThresholdClosed : R.optimalThreshold
  rocCurveClosed : R.rocCurve

def ReceiverOperatingCharacteristicClosed (R : ReceiverOperatingCharacteristicPackage) : Prop :=
  R.truePositiveRate ∧ R.falsePositiveRate ∧ R.auc ∧ R.optimalThreshold ∧ R.rocCurve

theorem receiver_operating_characteristic_closed_from_evidence (R : ReceiverOperatingCharacteristicPackage) (E : ReceiverOperatingCharacteristicEvidence R) : ReceiverOperatingCharacteristicClosed R := by
  exact And.intro E.truePositiveRateClosed (And.intro E.falsePositiveRateClosed (And.intro E.aucClosed (And.intro E.optimalThresholdClosed E.rocCurveClosed)))

end ClinicalMedicineDiagnosticTestEvaluationTheoremCanonicalLaneLean
end HautevilleHouse