import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure PumpSystemHydraulicsPackage where
  pumpCurve : Type u
  systemCurve : Type v
  operatingPoint : Type w
  netPositiveSuctionHead : Type x
  cavitationMargin : Type y
  affinityLaws : Prop
  pumpSelection : Prop
  parallelSeriesOperation : Prop
  transientAnalysis : Prop

structure PumpSystemHydraulicsEvidence (P : PumpSystemHydraulicsPackage) where
  affinityLawsClosed : P.affinityLaws
  pumpSelectionClosed : P.pumpSelection
  parallelSeriesOperationClosed : P.parallelSeriesOperation
  transientAnalysisClosed : P.transientAnalysis

def PumpSystemHydraulicsClosed (P : PumpSystemHydraulicsPackage) : Prop :=
  P.affinityLaws ∧ P.pumpSelection ∧ P.parallelSeriesOperation ∧ P.transientAnalysis

theorem pump_system_hydraulics_closed_from_evidence
    (P : PumpSystemHydraulicsPackage) (E : PumpSystemHydraulicsEvidence P) :
    PumpSystemHydraulicsClosed P := by
  exact And.intro E.affinityLawsClosed
    (And.intro E.pumpSelectionClosed
      (And.intro E.parallelSeriesOperationClosed E.transientAnalysisClosed))

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse