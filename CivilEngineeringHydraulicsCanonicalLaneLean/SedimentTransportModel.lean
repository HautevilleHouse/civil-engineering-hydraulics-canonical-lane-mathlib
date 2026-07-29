import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringHydraulicsCanonicalLaneLean

structure SedimentTransportModel where
  shearStress : ℝ
  criticalShearStress : ℝ
  sedimentDiameter : ℝ
  shieldsParameter : ℝ
  bedLoadTransport : Prop
  suspendedLoadTransport : Prop
  totalLoadContinuity : Prop

structure SedimentTransportEvidence (S : SedimentTransportModel) where
  bedLoadTransportClosed : S.bedLoadTransport
  suspendedLoadTransportClosed : S.suspendedLoadTransport
  totalLoadContinuityClosed : S.totalLoadContinuity

def SedimentTransportClosed (S : SedimentTransportModel) : Prop :=
  S.bedLoadTransport ∧ S.suspendedLoadTransport ∧ S.totalLoadContinuity

theorem sediment_transport_closed_from_evidence (S : SedimentTransportModel) (E : SedimentTransportEvidence S) :
    SedimentTransportClosed S := by
  exact And.intro E.bedLoadTransportClosed (And.intro E.suspendedLoadTransportClosed E.totalLoadContinuityClosed)

end CivilEngineeringHydraulicsCanonicalLaneLean
end HautevilleHouse