import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PumpCurve where
  shutoffHead : ℝ
  designFlow : ℝ
  designHead : ℝ
  efficiency : ℝ

structure SystemCurve where
  staticHead : ℝ
  frictionCoefficient : ℝ
  flowExponent : ℝ

structure PumpSystem where
  pump : PumpCurve
  system : SystemCurve
  operatingPointFlow : ℝ
  operatingPointHead : ℝ

def systemHead (Hst : ℝ) (K : ℝ) (Q : ℝ) (n : ℝ) : ℝ := Hst + K * Q^n

structure PumpSystemEvidence (S : PumpSystem) where
  pumpShutoffPositive : S.pump.shutoffHead > 0
  pumpDesignFlowPositive : S.pump.designFlow > 0
  pumpDesignHeadPositive : S.pump.designHead > 0
  pumpEfficiencyPositive : S.pump.efficiency > 0
  systemStaticHeadPositive : S.system.staticHead > 0
  systemFrictionCoefficientPositive : S.system.frictionCoefficient > 0
  operatingPointMatch : S.operatingPointHead = systemHead S.system.staticHead S.system.frictionCoefficient S.operatingPointFlow S.system.flowExponent ∧ S.operatingPointHead = S.pump.shutoffHead - (S.pump.shutoffHead - S.pump.designHead) * (S.operatingPointFlow / S.pump.designFlow)^2

def PumpSystemClosed (S : PumpSystem) : Prop :=
  S.pump.shutoffHead > 0 ∧ S.pump.designFlow > 0 ∧ S.pump.designHead > 0 ∧
  S.pump.efficiency > 0 ∧ S.system.staticHead > 0 ∧
  S.system.frictionCoefficient > 0 ∧
  (S.operatingPointHead = systemHead S.system.staticHead S.system.frictionCoefficient S.operatingPointFlow S.system.flowExponent ∧
   S.operatingPointHead = S.pump.shutoffHead - (S.pump.shutoffHead - S.pump.designHead) * (S.operatingPointFlow / S.pump.designFlow)^2)

theorem pump_system_closed_from_evidence (S : PumpSystem) (E : PumpSystemEvidence S) :
    PumpSystemClosed S := by
  exact And.intro E.pumpShutoffPositive
    (And.intro E.pumpDesignFlowPositive
      (And.intro E.pumpDesignHeadPositive
        (And.intro E.pumpEfficiencyPositive
          (And.intro E.systemStaticHeadPositive
            (And.intro E.systemFrictionCoefficientPositive E.operatingPointMatch)))))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse