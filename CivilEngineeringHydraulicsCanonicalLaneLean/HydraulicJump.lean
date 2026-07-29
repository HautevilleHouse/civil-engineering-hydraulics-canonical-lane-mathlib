import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure HydraulicJumpPackage where
  upstreamDepth : ℝ
  downstreamDepth : ℝ
  froudeNumber : ℝ
  momentumFunction : ℝ
  conjugateDepthRelation : Prop
  energyLoss : Prop

structure HydraulicJumpEvidence (H : HydraulicJumpPackage) where
  conjugateDepthRelationClosed : H.conjugateDepthRelation
  energyLossClosed : H.energyLoss

def HydraulicJumpClosed (H : HydraulicJumpPackage) : Prop :=
  H.conjugateDepthRelation ∧ H.energyLoss

theorem hydraulic_jump_closed_from_evidence (H : HydraulicJumpPackage) (E : HydraulicJumpEvidence H) :
    HydraulicJumpClosed H := by
  exact And.intro E.conjugateDepthRelationClosed E.energyLossClosed

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse