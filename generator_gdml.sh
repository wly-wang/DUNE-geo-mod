# First check to remove old version of files
rm dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol.gdml
rm dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_nowires.gdml
rm gdmlWireCenters*

# DUNE-FD1-HD geometry v6 refactored, no wires
perl dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol.pl -o dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_nowires.xml -w=0 -k=2 -s="parts"
perl make_refactored_gdml.pl -i dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_nowires.xml -o dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_nowires.gdml
rm *.xml
rm dune10kt_v6*parts.gdml
mv gdmlWireCenters.txt ./gdmlWireCenters_nowires.txt

# DUNE-FD1-HD geometry v6 refactored, with wires
perl dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol.pl -o dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol.xml -w=1 -k=2 -s="parts"
perl make_refactored_gdml.pl -i dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol.xml -o dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol.gdml
rm *.xml
rm dune10kt_v6_*parts.gdml
