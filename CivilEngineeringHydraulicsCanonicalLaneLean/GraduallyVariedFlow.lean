import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure GraduallyVariedFlowPackage where
  waterSurfaceProfile : ℝ → ℝ
  channelBottomSlope : ℝ
  manningRoughness : ℝ
  flowDepth : ℝ
  criticalDepth : ℝ
  normalDepth : ℝ
  dynamicEquation : Prop
  profileClassification : Prop
  waterSurfaceProfileSmooth : Prop
  channelBottomSlopeClosed : channelBottomSlope > 0
  manningRoughnessClosed : manningRoughness > 0

structure GraduallyVariedFlowEvidence (G : GraduallyVariedFlowPackage) where
  dynamicEquationClosed : G.dynamicEquation
  profileClassificationClosed : G.profileClassification
  waterSurfaceProfileSmoothClosed : G.waterSurfaceProfileSmooth

def GraduallyVariedFlowClosed (G : GraduallyVariedFlowPackage) : Prop :=
  G.dynamicEquation ∧ G.profileClassification ∧ G.waterSurfaceProfileSmooth

theorem gradually_varied_flow_closed_from_evidence (G : GraduallyVariedFlowPackage) (E : GraduallyVariedFlowEvidence G) : GraduallyVariedFlowClosed G :=
  And.intro E.dynamicEquationClosed (And.intro E.profileClassificationClosed E.waterSurfaceProfileSmoothClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse