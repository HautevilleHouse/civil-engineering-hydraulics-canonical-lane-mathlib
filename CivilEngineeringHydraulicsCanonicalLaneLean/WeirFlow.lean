import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure WeirFlowPackage where
  weirCrestLength : ℝ
  upstreamHead : ℝ
  dischargeCoefficient : ℝ
  flowRate : ℝ
  weirEquation : Prop
  flowRateFormula : Prop
  weirCrestLengthClosed : weirCrestLength > 0
  upstreamHeadClosed : upstreamHead > 0
  dischargeCoefficientClosed : dischargeCoefficient > 0
  flowRateClosed : flowRate > 0

structure WeirFlowEvidence (W : WeirFlowPackage) where
  weirEquationClosed : W.weirEquation
  flowRateFormulaClosed : W.flowRateFormula

def WeirFlowClosed (W : WeirFlowPackage) : Prop :=
  W.weirEquation ∧ W.flowRateFormula

theorem weir_flow_closed_from_evidence (W : WeirFlowPackage) (E : WeirFlowEvidence W) : WeirFlowClosed W :=
  And.intro E.weirEquationClosed E.flowRateFormulaClosed

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse