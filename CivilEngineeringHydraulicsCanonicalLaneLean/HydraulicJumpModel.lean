import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure HydraulicJumpModel where
  upstreamFroude : ℝ
  downstreamDepthRatio : ℝ
  energyLoss : ℝ
  momentumConservation : Prop
  specificForceBalance : Prop
  conjugateDepthRelation : Prop

structure HydraulicJumpEvidence (H : HydraulicJumpModel) where
  momentumConservationClosed : H.momentumConservation
  specificForceBalanceClosed : H.specificForceBalance
  conjugateDepthRelationClosed : H.conjugateDepthRelation

def HydraulicJumpClosed (H : HydraulicJumpModel) : Prop :=
  H.momentumConservation ∧ H.specificForceBalance ∧ H.conjugateDepthRelation

theorem hydraulic_jump_closed_from_evidence (H : HydraulicJumpModel) (E : HydraulicJumpEvidence H) :
    HydraulicJumpClosed H := by
  exact And.intro E.momentumConservationClosed (And.intro E.specificForceBalanceClosed E.conjugateDepthRelationClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse