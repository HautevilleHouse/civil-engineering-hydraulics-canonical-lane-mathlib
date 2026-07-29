import canonicalLaneMathlib.Projection

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HydraulicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse
