import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure ChannelFlowPackage where
  crossSectionArea : ℝ
  wettedPerimeter : ℝ
  slope : ℝ
  manningRoughness : ℝ
  discharge : ℝ
  uniformFlowCondition : Prop
  criticalFlowCondition : Prop

structure ChannelFlowEvidence (C : ChannelFlowPackage) where
  uniformFlowConditionClosed : C.uniformFlowCondition
  criticalFlowConditionClosed : C.criticalFlowCondition

def ChannelFlowClosed (C : ChannelFlowPackage) : Prop :=
  C.uniformFlowCondition ∧ C.criticalFlowCondition

theorem channel_flow_closed_from_evidence (C : ChannelFlowPackage) (E : ChannelFlowEvidence C) :
    ChannelFlowClosed C := by
  exact And.intro E.uniformFlowConditionClosed E.criticalFlowConditionClosed

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse