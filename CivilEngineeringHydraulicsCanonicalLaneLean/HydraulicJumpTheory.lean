import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure HydraulicJumpTheoryPackage where
  upstreamFroudeNumber : Type u
  conjugateDepth : Type v
  energyDissipation : Type w
  jumpLength : Type x
  sequentDepthRatio : Prop
  momentumFunction : Prop
  specificForce : Prop
  rollerLength : Prop

structure HydraulicJumpTheoryEvidence (H : HydraulicJumpTheoryPackage) where
  sequentDepthRatioClosed : H.sequentDepthRatio
  momentumFunctionClosed : H.momentumFunction
  specificForceClosed : H.specificForce
  rollerLengthClosed : H.rollerLength

def HydraulicJumpTheoryClosed (H : HydraulicJumpTheoryPackage) : Prop :=
  H.sequentDepthRatio ∧ H.momentumFunction ∧ H.specificForce ∧ H.rollerLength

theorem hydraulic_jump_theory_closed_from_evidence
    (H : HydraulicJumpTheoryPackage) (E : HydraulicJumpTheoryEvidence H) :
    HydraulicJumpTheoryClosed H := by
  exact And.intro E.sequentDepthRatioClosed
    (And.intro E.momentumFunctionClosed
      (And.intro E.specificForceClosed E.rollerLengthClosed))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse