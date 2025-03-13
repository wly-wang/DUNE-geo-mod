#include <vector>
#include <string>
#include <sstream>
#include <iostream>

#include "TSystem.h"
#include "TGeoManager.h"

void dune10kt_checkOvlaps(bool nowires = false)
{
  gSystem->Load("libGeom");
  gSystem->Load("libGdml");

  std::vector<std::string> geoms;
  geoms.push_back("dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_v2");
  //geoms.push_back("dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol_nowires");
  //geoms.push_back("dune10kt_v6_refactored_1x2x6_modded_dbDrift_cpaPDS_singleVol");
  // geoms.push_back("dune10kt_v6_refactored_1x2x6_modded_double_drift_singleVol_nowires");

  // geoms.push_back("dune10kt_v1_workspace");
  // geoms.push_back("dune10kt_v1_45deg");
  // geoms.push_back("dune10kt_v1_45deg_workspace");
  // geoms.push_back("dune10kt_v1_3mmpitch");
  // geoms.push_back("dune10kt_v1_3mmpitch_workspace");

  for(unsigned int i=0; i<geoms.size(); i++){
    std::cout << "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" << std::endl;

    std::stringstream file;
    file << geoms[i];
    if( nowires ) file << "_nowires";
    file << ".gdml";

    std::cout << "Checking " << file.str() << "\n" << std::endl;

    TGeoManager::Import(file.str().c_str());
    gGeoManager->GetTopVolume();
    gGeoManager->CheckOverlaps(1e-5, "detailed");
    gGeoManager->PrintOverlaps();
    gGeoManager->GetTopVolume()->Draw("ogl");
  }

}

