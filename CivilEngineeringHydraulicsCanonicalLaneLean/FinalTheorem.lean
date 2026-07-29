import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringHydraulicsCanonicalLaneLean.OpenChannelFlowBridge
import HautevilleHouse.CivilEngineeringHydraulicsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

def ConstrainedHydraulicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_hydraulics_endgame (A : AdmissibleClass) :
    ConstrainedHydraulicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse