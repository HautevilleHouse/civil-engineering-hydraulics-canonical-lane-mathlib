import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PumpPerformanceCurve where
  pumpHead : ℝ → ℝ  -- head as function of flow rate
  pumpEfficiency : ℝ → ℝ
  netPositiveSuctionHead : ℝ
  operatingPoint : ℝ × ℝ
  affinityLawsSatisfied : Prop
  cavitationMarginSatisfied : Prop

structure PumpPerformanceEvidence (P : PumpPerformanceCurve) where
  affinityLawsSatisfiedClosed : P.affinityLawsSatisfied
  cavitationMarginSatisfiedClosed : P.cavitationMarginSatisfied
  operatingPointReachable : Prop
  operatingPointReachableClosed : P.operatingPointReachable

def PumpPerformanceClosed (P : PumpPerformanceCurve) : Prop :=
  P.affinityLawsSatisfied ∧ P.cavitationMarginSatisfied ∧ P.operatingPointReachable

theorem pump_performance_closed_from_evidence (P : PumpPerformanceCurve) (E : PumpPerformanceEvidence P) :
    PumpPerformanceClosed P := by
  exact And.intro E.affinityLawsSatisfiedClosed (And.intro E.cavitationMarginSatisfiedClosed E.operatingPointReachableClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse