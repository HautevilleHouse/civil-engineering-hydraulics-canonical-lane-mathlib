import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure HydraulicStructuresPackage where
  structureGeometry : Type u
  energyDissipation : Type v
  spillwayCapacity : Prop
  gateOperation : Prop
  stillingBasinDesign : Prop

structure HydraulicStructuresEvidence (P : HydraulicStructuresPackage) where
  spillwayCapacityClosed : P.spillwayCapacity
  gateOperationClosed : P.gateOperation
  stillingBasinDesignClosed : P.stillingBasinDesign

def HydraulicStructuresClosed (P : HydraulicStructuresPackage) : Prop :=
  P.spillwayCapacity ∧ P.gateOperation ∧ P.stillingBasinDesign

theorem hydraulic_structures_closed_from_evidence (P : HydraulicStructuresPackage)
    (E : HydraulicStructuresEvidence P) : HydraulicStructuresClosed P :=
  And.intro E.spillwayCapacityClosed (And.intro E.gateOperationClosed E.stillingBasinDesignClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse