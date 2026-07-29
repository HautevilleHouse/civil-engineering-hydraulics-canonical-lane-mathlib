import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure SedimentTransportPackage where
  sedimentProperties : Type u
  flowConditions : Type v
  bedLoadFormula : Prop
  suspendedLoadFormula : Prop
  totalLoadFormula : Prop

structure SedimentTransportEvidence (P : SedimentTransportPackage) where
  bedLoadFormulaClosed : P.bedLoadFormula
  suspendedLoadFormulaClosed : P.suspendedLoadFormula
  totalLoadFormulaClosed : P.totalLoadFormula

def SedimentTransportClosed (P : SedimentTransportPackage) : Prop :=
  P.bedLoadFormula ∧ P.suspendedLoadFormula ∧ P.totalLoadFormula

theorem sediment_transport_closed_from_evidence (P : SedimentTransportPackage)
    (E : SedimentTransportEvidence P) : SedimentTransportClosed P :=
  And.intro E.bedLoadFormulaClosed (And.intro E.suspendedLoadFormulaClosed E.totalLoadFormulaClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse