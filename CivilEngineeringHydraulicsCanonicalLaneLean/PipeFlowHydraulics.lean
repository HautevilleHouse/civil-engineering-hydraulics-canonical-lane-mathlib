import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PipeFlowPackage where
  pipeDiameter : ℝ
  flowRate : ℝ
  pressureDrop : ℝ
  fluidViscosity : ℝ
  pipeLength : ℝ
  darcyWeisbachEquation : Prop
  hazenWilliamsEquation : Prop
  reynoldsNumber : Prop
  pipeDiameterClosed : pipeDiameter > 0
  flowRateClosed : flowRate > 0
  pressureDropClosed : pressureDrop > 0
  fluidViscosityClosed : fluidViscosity > 0
  pipeLengthClosed : pipeLength > 0

structure PipeFlowEvidence (P : PipeFlowPackage) where
  darcyWeisbachEquationClosed : P.darcyWeisbachEquation
  hazenWilliamsEquationClosed : P.hazenWilliamsEquation
  reynoldsNumberClosed : P.reynoldsNumber

def PipeFlowClosed (P : PipeFlowPackage) : Prop :=
  P.darcyWeisbachEquation ∧ P.hazenWilliamsEquation ∧ P.reynoldsNumber

theorem pipe_flow_closed_from_evidence (P : PipeFlowPackage) (E : PipeFlowEvidence P) : PipeFlowClosed P :=
  And.intro E.darcyWeisbachEquationClosed (And.intro E.hazenWilliamsEquationClosed E.reynoldsNumberClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse