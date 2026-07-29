import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure OpenChannelFlowPackage where
  flowDepth : ℝ
  channelWidth : ℝ
  flowVelocity : ℝ
  froudeNumber : ℝ
  specificEnergy : ℝ
  criticalDepth : ℝ
  continuityEquation : Prop
  energyEquation : Prop
  momentumEquation : Prop
  froudeNumberClassification : Prop
  flowDepthClosed : flowDepth > 0
  channelWidthClosed : channelWidth > 0
  flowVelocityClosed : flowVelocity > 0

structure OpenChannelFlowEvidence (O : OpenChannelFlowPackage) where
  continuityEquationClosed : O.continuityEquation
  energyEquationClosed : O.energyEquation
  momentumEquationClosed : O.momentumEquation
  froudeNumberClassificationClosed : O.froudeNumberClassification

def OpenChannelFlowClosed (O : OpenChannelFlowPackage) : Prop :=
  O.continuityEquation ∧ O.energyEquation ∧ O.momentumEquation ∧ O.froudeNumberClassification

theorem open_channel_flow_closed_from_evidence (O : OpenChannelFlowPackage) (E : OpenChannelFlowEvidence O) : OpenChannelFlowClosed O :=
  And.intro E.continuityEquationClosed (And.intro E.energyEquationClosed (And.intro E.momentumEquationClosed E.froudeNumberClassificationClosed))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse