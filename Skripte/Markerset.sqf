If(!isServer)exitWith{};

[] spawn
	{
	_marker = createMarker ["FunkAlpha", position Funk01];
	"FunkAlpha" setMarkerColor "ColorRed";
	"FunkAlpha" setMarkerType "o_installation";
	"FunkAlpha" setMarkerText "Kommunikationsanlage Alpha";
	};
	
[] spawn
	{
	_marker = createMarker ["FunkBravo", position Funk02];
	"FunkBravo" setMarkerColor "ColorRed";
	"FunkBravo" setMarkerType "o_installation";
	"FunkBravo" setMarkerText "Kommunikationsanlage Bravo";
	};
	
[] spawn
	{
	_marker = createMarker ["Airport", position Airport01];
	"Airport" setMarkerColor "ColorRed";
	"Airport" setMarkerType "o_installation";
	"Airport" setMarkerText "Flugplatz Treibstoffdepot ";
	};
	
[] spawn
	{
	_marker = createMarker ["Hafen", position Hafen01];
	"Hafen" setMarkerColor "ColorRed";
	"Hafen" setMarkerType "o_installation";
	"Hafen" setMarkerText "Hafen Treibstoffdepot";
	};