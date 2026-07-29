import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PipeFlow where
  diameter : ℝ
  length : ℝ
  roughness : ℝ
  discharge : ℝ
  headLoss : ℝ

def frictionFactor (Re : ℝ) (εD : ℝ) : ℝ := 0.02 -- placeholder

structure PipeFlowEvidence (P : PipeFlow) where
  diameterPositive : P.diameter > 0
  lengthPositive : P.length > 0
  dischargeNonnegative : P.discharge ≥ 0
  headLossComputed : P.headLoss = 0.0826 * (P.discharge^2) / (P.diameter^5) * P.length
  roughnessNonnegative : P.roughness ≥ 0

def PipeFlowClosed (P : PipeFlow) : Prop :=
  P.diameter > 0 ∧ P.length > 0 ∧ P.discharge ≥ 0 ∧
  P.headLoss = 0.0826 * (P.discharge^2) / (P.diameter^5) * P.length ∧
  P.roughness ≥ 0

theorem pipe_flow_closed_from_evidence (P : PipeFlow) (E : PipeFlowEvidence P) :
    PipeFlowClosed P := by
  exact And.intro E.diameterPositive
    (And.intro E.lengthPositive
      (And.intro E.dischargeNonnegative
        (And.intro E.headLossComputed E.roughnessNonnegative)))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse