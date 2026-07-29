import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PipeFlowEnergyLossPackage where
  pipeDiameter : Type u
  pipeRoughness : Type v
  flowVelocity : Type w
  reynoldsNumber : Type x
  darcyFrictionFactor : Type y
  majorLossCoefficient : darcyFrictionFactor -> pipeLength -> pipeDiameter -> Type
  minorLossCoefficient : Type z
  darcyWeisbachEquation : Prop
  hazenWilliamsEquation : Prop
  minorLossSummation : Prop
  energyGradeLine : Prop

structure PipeFlowEnergyLossEvidence (P : PipeFlowEnergyLossPackage) where
  darcyWeisbachEquationClosed : P.darcyWeisbachEquation
  hazenWilliamsEquationClosed : P.hazenWilliamsEquation
  minorLossSummationClosed : P.minorLossSummation
  energyGradeLineClosed : P.energyGradeLine

def PipeFlowEnergyLossClosed (P : PipeFlowEnergyLossPackage) : Prop :=
  P.darcyWeisbachEquation ∧ P.hazenWilliamsEquation ∧ P.minorLossSummation ∧ P.energyGradeLine

theorem pipe_flow_energy_loss_closed_from_evidence
    (P : PipeFlowEnergyLossPackage) (E : PipeFlowEnergyLossEvidence P) :
    PipeFlowEnergyLossClosed P := by
  exact And.intro E.darcyWeisbachEquationClosed
    (And.intro E.hazenWilliamsEquationClosed
      (And.intro E.minorLossSummationClosed E.energyGradeLineClosed))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse