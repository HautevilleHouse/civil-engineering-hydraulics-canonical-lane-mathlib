import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure FlowRegime where
  reynoldsNumber : ℝ
  froudeNumber : ℝ
  regimeType : String
  laminarOrTurbulent : Prop
  criticalCondition : Prop

structure FlowRegimeEvidence (R : FlowRegime) where
  reynoldsNumberCalculated : R.reynoldsNumber > 0
  froudeNumberCalculated : R.froudeNumber > 0
  regimeClassified : R.laminarOrTurbulent
  criticalConditionMet : R.criticalCondition

def FlowRegimeClosed (R : FlowRegime) : Prop :=
  R.reynoldsNumber > 0 ∧ R.froudeNumber > 0 ∧ R.laminarOrTurbulent ∧ R.criticalCondition

theorem flow_regime_closed_from_evidence (R : FlowRegime) (E : FlowRegimeEvidence R) :
    FlowRegimeClosed R := by
  exact And.intro E.reynoldsNumberCalculated
    (And.intro E.froudeNumberCalculated
      (And.intro E.regimeClassified E.criticalConditionMet))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse