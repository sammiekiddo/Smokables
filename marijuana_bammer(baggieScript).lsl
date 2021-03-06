//Author Samantha Bene` Howze (sammiekiddo)
//Copyright Samantha Bene` Howze (sammiekiddo)
//All right of scripted code belong to Samantha Bene` Howze (sammiekiddo)



 /////////////////////NOTECARD READER SETUP///////////////////////////

list    ToolType;       // %%% all foos configured (subject)
list    PrepCheck;      

list    DrugChannel;    // %%% value for each foo configured (integer value)

list    PrepChannel;    // %%% value for each foo configured (integer value)


list    ReadyChannel;

float   RegistryNumbers;        // %%% a configurable parameter

// %%% Static parameters for reading card config: you may change these, but don't have to.

integer ConfigRequired          = FALSE;        // whether to fail if no config cards

string  ConfigNotecardSuffix    = ".cfg";       // string identifying config notecards

float   ConfigTimeout           = 60.0;         // seconds to wait for slow server

 

 

// Globals for reading card config

integer ConfigLineIndex;    // line number in notecard we're reading

key     ConfigRequestID;    // request we're waiting for

list    ConfigCards;        // list of names of config notecards

string  ConfigCardName;     // name of card being read

integer ConfigCardIndex;    // index of next card to read

 

integer Debug;              // Whether to print debug text

 

 

config_init()

{


    ToolType = [];          // %%%
    PrepCheck = [];          // %%% 

    RegistryNumbers  = 000000000;        // %%%

}

 

// print the configuration, handy for debugging.

 

config_dump()

{

    // Replace this example code with your config %%%.

    say("ToolType: "       + llList2CSV(ToolType));      // %%%
    say("PrepCheck: "      + llList2CSV(PrepCheck));

    say("DrugChannel: "    + llList2CSV(DrugChannel));   // %%%


    say("PrepChannel: "    + llList2CSV(PrepChannel));   // %%%


    say("ReadyChannel: "    + llList2CSV(ReadyChannel));   // %%%

    say("RegistryNumbers: "        + (string) RegistryNumbers);          // %%%     

}

 

config_parse(string str, string cardName, integer lineNum)

{

    str = llStringTrim(str, STRING_TRIM_HEAD);  // delete leading spaces

 

    // lines beginning with slash are comments -- ignore them

    if (llGetSubString(str,0,0) == "/") {

        return;

    }

 

    list ldata  = llParseStringKeepNulls(str, ["="], [""]);

    string cmd  = llList2String(ldata,0);

    string arg1 = llList2String(ldata,1);

    string arg2 = llList2String(ldata,2);

    // %%% Add more lines such as the above as needed for more arguments.
    //ADD ADDITIONAL LINES FOR TOOLCHANNEL FROM LISTENERS
    //STARTING WITH:

  //  string arg3 = llList2String(ldata,3);//LINE 3 OF NOTECARD
   // string arg4 = llList2String(ldata,4);
    //weed=WEED1_CHANNEL=-18065431=SOMETHING ELSE (also and new varible EX.ToolMessage)

    // %%% Process example commands -- replace this code with meaningful stuff! %%%


//////////////////DRUGS///////////////////////////
    if (cmd == "weed") {

 

        ToolType    += [arg1];
        DrugChannel1 += [(integer) arg2];
        channelCodes_weed1 += (integer)arg2;

    } else if (cmd == "weed2") {

        ToolType    += [arg1];
        DrugChannel2 += [(integer) arg2];

    } else if (cmd == "weed3") {

        ToolType    += [arg1];
        DrugChannel3 += [(integer) arg2];

    }else if (cmd == "weed4"){

        ToolType    += [arg1];
        DrugChannel4 += [(integer) arg2];

    } 
//////////////////ROLLUP///////////////////////////
    else if (cmd == "rollup") {

        PrepCheck    += [arg1];
        PrepChannel1 += [(integer) arg2];
        channelCodes_rollup1 += (integer)arg2;
        

    }else if (cmd == "rollup2") {
        PrepCheck    += [arg1];
        PrepChannel2 += [(integer) arg2];
    }
    else if (cmd == "rollup3") {
        PrepCheck    += [arg1];
        PrepChannel3 += [(integer) arg2];
    }
    else if (cmd == "rollup4") {
        PrepCheck    += [arg1];
        PrepChannel4 += [(integer) arg2];
    }

    else if (cmd == "foo") {
        ToolType    += [arg1];

        ReadyChannel += [(integer) arg2];
    }
    
     else if (cmd == "bar") {

        RegistryNumbers = (float) arg1;

    }

 

    // this one is a good one to keep

    else if (cmd == "debug") {

        Debug = (integer) arg1;

    }

}


// Post-process any config, if necessary

config_done() {

    if (Debug) {

        config_dump();

    }

    say("Config done");

}


// ==== Utilities ====

 

// Say something, in this case to owner (%%% modify to whisper or whatever)

 

say(string str)

{

    llOwnerSay(str);

}

 
// Say something if debug is enabled

debug(string str)

{

    if (Debug) {

        say(llGetScriptName() + ": " + str);

    }

}

 

// Get the next notecard name, and

// return TRUE if there is one

 

integer next_card()

{

    if (ConfigCardIndex >= llGetListLength(ConfigCards)) {

        ConfigCards = [];

        return (FALSE);

    }

 

    ConfigLineIndex = 0;

    ConfigCardName = llList2String(ConfigCards, ConfigCardIndex);

    ConfigCardIndex++;

    ConfigRequestID = llGetNotecardLine(ConfigCardName, ConfigLineIndex);

    say("Reading " + ConfigCardName);

    return (TRUE);

}


 /////////////////////NOTECARD READER SETUP END///////////////////////////


integer ROLLEDUP_CHANNEL;
integer WEED_CHANNEL;

integer CHECK4ERROR_CHANNEL = -16547321;
integer WAITING_CHANNEL = - 000001011;
integer START_CHANNEL = - 000001011;
integer _holding = FALSE;
integer _used = FALSE;

key avatarKey;
key owner;

integer REPORT_WEED_CHANNEL = 2485934316;
integer REPORT_ROLLEDUP_CHANNEL = 9547341316;
integer ATTACH_KEY_CHANNEL = 4936412338;

integer groupSession = FALSE;

//COLOR CHANGER
vector NAVY    = <0,     0.122, 0.247>;
vector BLUE    = <0,     0.455, 0.851>;
vector AQUA    = <0.498, 0.859, 1    >;
vector TEAL    = <0.224, 0.8,   0.8  >;
vector OLIVE   = <0.239, 0.6,   0.439>;
vector GREEN   = <0.18,  0.8,   0.251>;
vector LIME    = <0.004, 1    , 0.439>;
vector YELLOW  = <1    , 0.863, 0    >;
vector ORANGE  = <1    , 0.522, 0.106>;
vector RED     = <1    , 0.255, 0.212>;
vector MAROON  = <0.522, 0.078, 0.294>;
vector FUCHSIA = <0.941, 0.071, 0.745>;
vector PURPLE  = <0.694, 0.051, 0.788>;
vector WHITE   = <1    , 1    , 1    >;
vector SILVER  = <0.867, 0.867, 0.867>;
vector GRAY    = <0.667, 0.667, 0.667>;
vector BLACK   = <0.000, 0.000, 0.000>;
 
string  hoverText   = "TEXT GOES HERE";//NAME OF MARIJUANA
vector  hoverColor  = GRAY;//  set predefined color or any RGB color vector in float form
vector  hoverColor2  = PURPLE;//
float   hoverAlpha  = 1.0; // Sets the text's transparency, 1.0 being opaque, while 0.0 would be transparent

sendID(){
    key smokerKey = avatarKey;
    string IDReport = "users key";
    llRegionSayTo(smokerKey,ATTACH_KEY_CHANNEL, IDReport);

}

reportInfo()
{
    key smokerKey = avatarKey;
    string weedReport = (string)WEED_CHANNEL;
    llRegionSayTo(smokerKey,REPORT_WEED_CHANNEL, weedReport);
    llSetTimerEvent(3);
 
    }


rollupOwner()
{
    //key smokerKey = llDetectedKey(0);
    key smokerKey = owner;
    string msg = "UseSomeHerb" + (string) smokerKey;
     llRegionSayTo(smokerKey,WEED_CHANNEL, msg);
     _used = TRUE;
    }
    
rollup()
{
    //key smokerKey = llDetectedKey(0);
    key smokerKey = avatarKey;
    string msg = "UseSomeHerb" + (string) smokerKey;
     llRegionSayTo(smokerKey,WEED_CHANNEL, msg);
     _used = TRUE;
    }    
    
remove() {
    llDie();
    llDetachFromAvatar();
    }
    
check(){
    //key smokerKey = llDetectedKey(0);
    key smokerKey = avatarKey;
    string msg = "checking4Errors" + (string) smokerKey;
    llRegionSayTo(smokerKey,CHECK4ERROR_CHANNEL, msg);
    }
    
checkOwner(){
    //key smokerKey = llDetectedKey(0);
    key smokerKey = owner;
    string msg = "checking4Errors" + (string) smokerKey;
    llRegionSayTo(smokerKey,CHECK4ERROR_CHANNEL, msg);
    }    
    
_isHere(){
    //key smokerKey = llDetectedKey(0);
    key smokerKey = avatarKey;
    string er = "UseSomeHerb" + (string) smokerKey;
    llOwnerSay("REMOVE EXTRA GRAMS BEFORE ROLLING OR PACKING MARIJUANA. If you do not TAKE, script will delete extra rezzed grams on touch");
    llRegionSayTo(smokerKey,WAITING_CHANNEL, er);
    } 
    
_isHereOwner(){
    
    // key smokerKey = llDetectedKey(0);
    key smokerKey = owner;
    string er = "UseSomeHerb" + (string) smokerKey;
    llOwnerSay("REMOVE EXTRA GRAMS BEFORE ROLLING OR PACKING MARIJUANA. If you do not TAKE, script will delete extra rezzed grams on touch");
    llRegionSayTo(smokerKey,WAITING_CHANNEL, er);
    }       

remove_listen_handleA()
    {
    llListenRemove(listenHandle_a);
    }
    
remove_listen_handleB()
    {
    llListenRemove(listenHandle_b);
    }
    
remove_listen_handleC()
    {
    llListenRemove(listenHandle_c);
    }  
    
remove_listen_handleD()
    {
    llListenRemove(listenHandle_d);
    }  

 remove_listen_handleD()
    {
    llListenRemove(listenHandle_d);
    } 

remove_listen_handleE()
    {
    llListenRemove(listenHandle_e);
    }               

integer listenHandle_a;
integer listenHandle_b;
integer listenHandle_c;
integer listenHandle_d;
integer listenHandle_e;

/////////////////////////LISTENER SETUP END///////////////////////////////////////////


// BEGIN STATES



// Default state can do any init you need that doesn't require configuration.

 

default

{

    state_entry() {

        //llSetText("", <1.0,1.0,1.0>, 1.0);

        state s_config;
        }


// This state is only used to get into s_config, because going from

// s_config to s_config won't redo it's state_entry.  But we might

// not want to redo anything we might have put in default state entry.

 
}
state s_reconfig
{

    state_entry() {

        state s_config;

    }

}

 

// Read card config

// Multiple notecard version - read all cards with the given extension

 

state s_config

{

    state_entry() {

        config_init();

 

        string item;

        ConfigCards = [];

        integer n = llGetInventoryNumber(INVENTORY_NOTECARD);

        while (n-- > 0) {

            item = llGetInventoryName(INVENTORY_NOTECARD, n);

            // Note: for simplicity, read cards with the "suffix" anywhere in the name

            if (llSubStringIndex(item, ConfigNotecardSuffix) != -1) {

                ConfigCards += [item];

            }

        }

 

        ConfigCardIndex = 0;

        if (next_card()) {

            llSetTimerEvent(ConfigTimeout);

        } else if (ConfigRequired) {

            say("Configuration notecard missing.");              

            state s_configRetry;

        } else {

            state s_active;

        }

    }

 

    dataserver(key query_id, string data) {

        if (query_id == ConfigRequestID) {

            if (data == EOF) {

                if (! next_card()) {

                    config_done();

                    state s_active;

                }

            } else {

                config_parse(data, ConfigCardName, ConfigLineIndex);

                ConfigRequestID = llGetNotecardLine(ConfigCardName, ++ConfigLineIndex);

                llSetTimerEvent(ConfigTimeout);

            }

        }

    }

 

    timer() {

        say("Dataserver time out: touch to retry");

        state s_configRetry;

    }

 

    on_rez(integer num) { state s_reconfig; }

 

    changed(integer change) {

        if (change & CHANGED_OWNER) { llResetScript(); }

        if (change & CHANGED_INVENTORY) { state s_reconfig; }

    }

 

    state_exit() {

        llSetTimerEvent(0);

    }

}

 

state s_configRetry

{

    touch_start(integer tot) {

        if (llDetectedKey(0) == llGetOwner()) {

            state s_config;

        }

    }

 

    changed(integer change) {

        if (change & CHANGED_OWNER) { llResetScript(); }

        if (change & CHANGED_INVENTORY) { state s_config; }

    }

}

 

// State to go into if notecard is required but missing.

// You can delete this and the code above that refers to it,

// or just set ConfigurationRequired to FALSE.

state s_unconfigured

{

    state_entry() {

        llSetText("Configuration missing", <1.0,1.0,1.0>, 1.0);

    }

 

    changed(integer change) {

        if (change & CHANGED_OWNER) { llResetScript(); }

        if (change & CHANGED_INVENTORY) { state s_reconfig; }

    }

 

    state_exit() {

        llSetText("", <1.0,1.0,1.0>, 1.0);

    }

}

 

 

// The fun starts here!

 

state s_active

{
    // %%% Your code goes here!
    state_entry()
    {
    owner = llGetOwner();
    //avatarKey = llDetectedKey(0);
    //NAME OF WEED TYPE
    //llSetText("Soil: " + "24/" + (string)bagWeight,hoverColor,hoverAlpha);
    listenHandle_a = llListen( ROLLEDUP_CHANNEL, "", "", "" );
    listenHandle_b = llListen( CHECK4ERROR_CHANNEL, "", "", "" ); 
    listenHandle_c = llListen( WAITING_CHANNEL, "", "", "" );  
    listenHandle_d = llListen( START_CHANNEL, "", "", "" );
    reportInfo();  
    }
    
    
     on_rez(integer smoking)
    {
        owner = llGetOwner();

    }
    
    run_time_permissions( integer vGramPermissions )
    {
        if (owner == avatarKey && vGramPermissions & PERMISSION_ATTACH ){   
            llAttachToAvatarTemp( ATTACH_RHAND );
            _holding = TRUE;
            sendID();
             
        }else if (owner != avatarKey && vGramPermissions & PERMISSION_ATTACH ){     
            llAttachToAvatarTemp( ATTACH_RHAND );
            groupSession = TRUE;
            sendID();
            
        
        }else     
            llSay(0, "Permission to attach denied" );
            
    } 
    
    
   timer()
    {
     
    if(_used == TRUE){
        remove();
        }
        
    
    if(owner == avatarKey)
    {
       checkOwner();
        }
        
     if(owner != avatarKey)
    {
       check();
        }   
    
    }

    touch(integer total_number)
    {
        avatarKey = llDetectedKey(0);
        owner = llGetOwner();


        ////////////////////DEBUG//////////////////////
        //llSay(0, "touch_start event: key of avatar touching: " + (string) llDetectedKey(0) );
        //////////////////////SOLO SESSION////////////////////////

        if(avatarKey == owner && _holding == FALSE){ 
        llSetTimerEvent(0.1);
        llRequestPermissions(owner, PERMISSION_ATTACH );
        }
        
        if(avatarKey == owner && _holding == TRUE) {
        rollupOwner();
        }
        
        //////////////////////GROUP SESSION////////////////////////
        
        if (groupSession == FALSE && avatarKey != owner){
            llSetTimerEvent(0.1);
            llRequestPermissions(owner, PERMISSION_ATTACH );
            }
            
        if(avatarKey != owner && groupSession == TRUE){
        rollup();
        } 
    
    }
    
     listen( integer vIntChn, string vStrNom, key vKeySrc, string vStrMsg)
     { 
     if(vIntChn == CHECK4ERROR_CHANNEL && owner == avatarKey){
         _isHereOwner();
         }
         
      if(vIntChn == CHECK4ERROR_CHANNEL && owner != avatarKey){
         _isHere();
        } 
         
      if(vIntChn == START_CHANNEL && owner != avatarKey){ //&& vKeySrc == llDetectedKey(0)){
         rollup();
         }
         
       if(vIntChn == START_CHANNEL && owner == avatarKey){ //&& vKeySrc == llDetectedKey(0)){
         rollupOwner();
         }  
         
      if(vIntChn == WAITING_CHANNEL){
      // WAIT BEFORE CHECKING AGAIN 
      llSetTimerEvent(1000);
       }    
     
     if(vIntChn == ROLLEDUP_CHANNEL){// && vKeySrc == llDetectedKey(0)){
       //REMOVE HERB 
       remove();
       }


       if(vIntChn == REPORT_ROLLEDUP_CHANNEL)
       {
        integer rw_convertToInt = (integer)vStrMsg;
        ROLLEDUP1_CHANNEL = rw_convertToInt;
        listenHandle_e = llListen( ROLLEDUP_CHANNEL, "", "", "" );
       } 

		}
	}
     
}