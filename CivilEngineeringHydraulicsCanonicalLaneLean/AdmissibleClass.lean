import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure AdmissibleClass where
  object : HydraulicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  HydraulicsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse
