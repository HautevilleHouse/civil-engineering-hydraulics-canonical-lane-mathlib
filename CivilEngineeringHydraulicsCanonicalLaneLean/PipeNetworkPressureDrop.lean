import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PipeNetworkPressureDrop where
  pipeDiameter : ℝ
  pipeLength : ℝ
  flowRate : ℝ
  frictionFactor : ℝ
  darcyWeisbachApplied : Prop
  hazenWilliamsApplied : Prop
  minorLossesAccounted : Prop

structure PipeNetworkPressureEvidence (P : PipeNetworkPressureDrop) where
  darcyWeisbachAppliedClosed : P.darcyWeisbachApplied
  hazenWilliamsAppliedClosed : P.hazenWilliamsApplied
  minorLossesAccountedClosed : P.minorLossesAccounted

def PipeNetworkPressureClosed (P : PipeNetworkPressureDrop) : Prop :=
  P.darcyWeisbachApplied ∧ P.hazenWilliamsApplied ∧ P.minorLossesAccounted

theorem pipe_network_pressure_closed_from_evidence (P : PipeNetworkPressureDrop) (E : PipeNetworkPressureEvidence P) :
    PipeNetworkPressureClosed P := by
  exact And.intro E.darcyWeisbachAppliedClosed (And.intro E.hazenWilliamsAppliedClosed E.minorLossesAccountedClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse