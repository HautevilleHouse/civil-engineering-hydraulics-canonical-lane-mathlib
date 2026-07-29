import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure FloodRoutingModel where
  inflowHydrograph : ℝ → ℝ
  storageFunction : ℝ → ℝ
  outflowRate : ℝ → ℝ
  massConservation : Prop
  muskingumRoutingApplied : Prop
  peakAttenuationAchieved : Prop

structure FloodRoutingEvidence (F : FloodRoutingModel) where
  massConservationClosed : F.massConservation
  muskingumRoutingAppliedClosed : F.muskingumRoutingApplied
  peakAttenuationAchievedClosed : F.peakAttenuationAchieved

def FloodRoutingClosed (F : FloodRoutingModel) : Prop :=
  F.massConservation ∧ F.muskingumRoutingApplied ∧ F.peakAttenuationAchieved

theorem flood_routing_closed_from_evidence (F : FloodRoutingModel) (E : FloodRoutingEvidence F) :
    FloodRoutingClosed F := by
  exact And.intro E.massConservationClosed (And.intro E.muskingumRoutingAppliedClosed E.peakAttenuationAchievedClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse