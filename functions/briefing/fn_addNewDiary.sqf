If(!hasInterface) exitWith {};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_briefing_fnc_addNewDiary

Description: Creates an Diary Record to Player

Parameters: [INDEX]

            INDEX         -     defined NUMBERS

Information: fill the lokal Variables with your Ideas

Returns: Nothing

Examples:
            [2] call MSOT_briefing_fnc_addNewDiary

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_title","_text"];
params ["_idx"];
_title = ""; _text = "";
switch(_idx)do
{
  case 1:{
            _title = "Allgemeine Lage";
            _text = "Die heutige Operation hat das Ziel, die Treibstoffversorung des Gegners nachhaltig zu stören, wenn nicht sogar vollständig zu unterbechen und so die Kampfhandlungen zu beenden!<br/><br/>Die Versorgung mit Treibstoff erfolgt im Wesentlichen über den Hafen von LA ROCHELLE im Norden der Insel Tanoa! Von hier aus wird der Treibstoff verteilt, u. a. an das Depot am Flugplatz von LA ROCHELLE, welcher aktuell ausschließlich vom Militär genutzt wird!<br/><br/> Der Einsatz besteht aus mehreren Phasen!<br/><br/>Phase 1: Unterbrechung der feindlichen Kommunikation durch Zerstörung wichtiger Sendeanlagen, um mögliche Unterstützung zu verhindern!<br/><br/>Phase 2: Zerstörung sämtlicher Treibstofftanks im Hafen von LA ROCHELLE und dem Depot am Flugplatz von LA ROCHELLE!";
         };
  case 2:{
            _title = "Lage-Update Nr.1";
            _text = "Offensichtlich sammelt der Feind die Überreste seiner Kräfte im RED SPRING Tagebau!<br/><br/><img image = 'Bilder\Tagebau.paa' with = '390' height = '270'/><br/><br/> Bevor Sie die Treibstoffdepots am Hafen und am Flugplatz angreifen, müssen die gegnerischen Einheiten im Tagebau dezimiert werden! Wir haben keine aktuellen Informationen über Größe und Zusammensetzung des Feindes! <br/><br/> Ihr aktuelles Ziel bleibt aber unverändert! Zerstören Sie zuerst die Kommunikationsanlagen! Anschließend kümmern wir uns  um den Tagebau!";
         };
  case 3:{
            _title = "Lage-Update Nr.2";
            _text = "Die schlechte Nachricht - Der Feind scheint über mehr Reserven zu verfügen als angenommen! Dank der von Ihnen beschafften Funkcodes haben wir erfahren, dass ein Flugzeugträger und mehrere U-Boote im  Industriehafen BLUE PEARL vor Anker liegen! Des Weiteren wird auf dem Gelände ein bereits teilweise fertiggestelltes neues Treibstoffdepot errichtet! Sollten sich diese Informationen bestätigen, würde dies unsere Pläne maßgeblich erschweren, die Kampfhandlungen zu beenden!";
         };
};
If(count _title > 0 && count _text > 0)then
{
  player createDiaryRecord ["Diary", [_title, _text]];
};
