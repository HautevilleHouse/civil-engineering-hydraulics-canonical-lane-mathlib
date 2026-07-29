import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PipeFlowPackage where
  diameter : ℝ
  length : ℝ
  roughnessHeight : ℝ
  reynoldsNumber : ℝ
  darcyFrictionFactor : ℝ
  headLoss : ℝ
  laminarOrTurbulent : Prop
  darcyWeisbachValid : Prop

structure PipeFlowEvidence (P : PipeFlowPackage) where
  laminarOrTurbulentClosed : P.laminarOrTurbulent
  darcyWeisbachValidClosed : P.darcyWeisbachValid

def PipeFlowClosed (P : PipeFlowPackage) : Prop :=
  P.laminarOrTurbulent ∧ P.darcyWeisbachValid

theorem pipe_flow_closed_from_evidence (P : PipeFlowPackage) (E : PipeFlowEvidence P) :
    PipeFlowClosed P := by
  exact And.intro E.laminarOrTurbulentClosed E.darcyWeisbachValidClosed

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse