import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure OpenChannelFlowProfile where
  channelSlope : ℝ
  manningRoughness : ℝ
  hydraulicRadius : ℝ
  flowArea : ℝ
  uniformFlowEstablished : Prop
  graduallyVariedFlow : Prop
  criticalDepthComputed : Prop

structure OpenChannelFlowEvidence (O : OpenChannelFlowProfile) where
  uniformFlowEstablishedClosed : O.uniformFlowEstablished
  graduallyVariedFlowClosed : O.graduallyVariedFlow
  criticalDepthComputedClosed : O.criticalDepthComputed

def OpenChannelFlowClosed (O : OpenChannelFlowProfile) : Prop :=
  O.uniformFlowEstablished ∧ O.graduallyVariedFlow ∧ O.criticalDepthComputed

theorem open_channel_flow_closed_from_evidence (O : OpenChannelFlowProfile) (E : OpenChannelFlowEvidence O) :
    OpenChannelFlowClosed O := by
  exact And.intro E.uniformFlowEstablishedClosed (And.intro E.graduallyVariedFlowClosed E.criticalDepthComputedClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse