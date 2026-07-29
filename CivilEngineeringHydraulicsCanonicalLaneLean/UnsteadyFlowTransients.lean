import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure UnsteadyFlowTransientsPackage where
  waterHammerEquations : Type u
  characteristicMethod : Type v
  surgeTankAnalysis : Type w
  pressureSurgeDamping : Type x
  rigidWaterColumn : Prop
  elasticWaterColumn : Prop
  boundaryConditions : Prop
  numericalScheme : Prop

structure UnsteadyFlowTransientsEvidence (U : UnsteadyFlowTransientsPackage) where
  rigidWaterColumnClosed : U.rigidWaterColumn
  elasticWaterColumnClosed : U.elasticWaterColumn
  boundaryConditionsClosed : U.boundaryConditions
  numericalSchemeClosed : U.numericalScheme

def UnsteadyFlowTransientsClosed (U : UnsteadyFlowTransientsPackage) : Prop :=
  U.rigidWaterColumn ∧ U.elasticWaterColumn ∧ U.boundaryConditions ∧ U.numericalScheme

theorem unsteady_flow_transients_closed_from_evidence
    (U : UnsteadyFlowTransientsPackage) (E : UnsteadyFlowTransientsEvidence U) :
    UnsteadyFlowTransientsClosed U := by
  exact And.intro E.rigidWaterColumnClosed
    (And.intro E.elasticWaterColumnClosed
      (And.intro E.boundaryConditionsClosed E.numericalSchemeClosed))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse