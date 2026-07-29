import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringHydraulicsCanonicalLaneLean.ChannelFlowHydraulics

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChannelFlowClosed (A.object : ChannelFlowPackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse