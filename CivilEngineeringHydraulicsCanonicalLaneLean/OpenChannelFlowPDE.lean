import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure OpenChannelFlowPDEPackage where
  channelGeometry : Type u
  manningRoughness : Type v
  slope : Type w
  discharge : Type x
  flowArea : Type y
  wetPerimeter : Type z
  hydraulicRadius : flowArea -> wetPerimeter -> Type
  continuityEquation : Prop
  momentumEquation : Prop
  energyEquation : Prop
  initialBoundaryConditions : Prop

structure OpenChannelFlowPDEEvidence (F : OpenChannelFlowPDEPackage) where
  continuityEquationClosed : F.continuityEquation
  momentumEquationClosed : F.momentumEquation
  energyEquationClosed : F.energyEquation
  initialBoundaryConditionsClosed : F.initialBoundaryConditions

def OpenChannelFlowPDEClosed (F : OpenChannelFlowPDEPackage) : Prop :=
  F.continuityEquation ∧ F.momentumEquation ∧ F.energyEquation ∧ F.initialBoundaryConditions

theorem open_channel_flow_pde_closed_from_evidence
    (F : OpenChannelFlowPDEPackage) (E : OpenChannelFlowPDEEvidence F) :
    OpenChannelFlowPDEClosed F := by
  exact And.intro E.continuityEquationClosed
    (And.intro E.momentumEquationClosed
      (And.intro E.energyEquationClosed E.initialBoundaryConditionsClosed))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse