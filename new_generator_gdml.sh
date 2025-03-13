# First check to remove old version of files
rm dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_v2.gdml
rm dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_v2_nowires.gdml
rm gdmlWireCenters*

# DUNE-FD1-HD geometry v6 refactored, no wires
perl remake_generate_dune10kt_modded_dbDrift_cpaPDS_singleVol.pl -o remake_generate_dune10kt_modded_dbDrift_cpaPDS_singleVol_nowires.xml -w=0 -k=2 -s="parts"
perl make_refactored_gdml.pl -i remake_generate_dune10kt_modded_dbDrift_cpaPDS_singleVol_nowires.xml -o dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_v2_nowires.gdml
rm *.xml
rm dune10kt_v6*parts.gdml
mv gdmlWireCenters.txt ./gdmlWireCenters_nowires.txt

# DUNE-FD1-HD geometry v6 refactored, with wires
perl remake_generate_dune10kt_modded_dbDrift_cpaPDS_singleVol.pl -o remake_generate_dune10kt_modded_dbDrift_cpaPDS_singleVol.xml -w=1 -k=2 -s="parts"
perl make_refactored_gdml.pl -i remake_generate_dune10kt_modded_dbDrift_cpaPDS_singleVol.xml -o dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_v2.gdml
rm *.xml
rm dune10kt_v6_*parts.gdml
