import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure GroundwaterFlowPackage where
  aquiferProperties : Type u
  darcyFlow : Type v
  groundwaterEquation : Prop
  boundaryConditions : Prop
  wellHydraulics : Prop

structure GroundwaterFlowEvidence (P : GroundwaterFlowPackage) where
  groundwaterEquationClosed : P.groundwaterEquation
  boundaryConditionsClosed : P.boundaryConditions
  wellHydraulicsClosed : P.wellHydraulics

def GroundwaterFlowClosed (P : GroundwaterFlowPackage) : Prop :=
  P.groundwaterEquation ∧ P.boundaryConditions ∧ P.wellHydraulics

theorem groundwater_flow_closed_from_evidence (P : GroundwaterFlowPackage)
    (E : GroundwaterFlowEvidence P) : GroundwaterFlowClosed P :=
  And.intro E.groundwaterEquationClosed (And.intro E.boundaryConditionsClosed E.wellHydraulicsClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse