global function FFA_Init
void function FFA_Init()
{
	ScoreEvent_SetupEarnMeterValuesForMixedModes()

	// northstar missing titan score value
	AddCallback_OnPlayerKilled( HandleFFAScoreEventValue )

	// northstar missing
	FlagSet( "IgnoreStartSpawn" ) // ffa gamemodes should always set this
	SetUpFFAScoreEvents()

	// tempfix specifics
	EarnMeterMP_SetPassiveGainProgessEnable( true ) // enable earnmeter gain progressing like vanilla
	
	AddCallback_OnClientDisconnected( TakeTeamScore )
}

// northstar missing
void function SetUpFFAScoreEvents()
{
	// pilot kill: 20%
	ScoreEvent_SetEarnMeterValues( "KillPilot", 0.10, 0.10 )
}

void function HandleFFAScoreEventValue( entity victim, entity attacker, var damageInfo )
{
	if( attacker.IsPlayer() )
		AddTeamScore( attacker.GetTeam(), 1 )
}
void function TakeTeamScore( entity player )
{
	GameRules_SetTeamScore(player.GetTeam(),0)
}
