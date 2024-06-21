#include "__cf_untitled.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "untitled_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "untitled.h"
#include "untitled_capi.h"
#include "untitled_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"untitled/Add" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , (
NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 1 , TARGET_STRING (
"untitled/Sine Wave" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0 } , { 2 ,
TARGET_STRING ( "untitled/Sine Wave" ) , TARGET_STRING ( "Bias" ) , 0 , 0 , 0
} , { 3 , TARGET_STRING ( "untitled/Sine Wave" ) , TARGET_STRING (
"Frequency" ) , 0 , 0 , 0 } , { 4 , TARGET_STRING ( "untitled/Sine Wave" ) ,
TARGET_STRING ( "Phase" ) , 0 , 0 , 0 } , { 5 , TARGET_STRING (
"untitled/Sine Wave1" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0 } , { 6 ,
TARGET_STRING ( "untitled/Sine Wave1" ) , TARGET_STRING ( "Bias" ) , 0 , 0 ,
0 } , { 7 , TARGET_STRING ( "untitled/Sine Wave1" ) , TARGET_STRING (
"Frequency" ) , 0 , 0 , 0 } , { 8 , TARGET_STRING ( "untitled/Sine Wave1" ) ,
TARGET_STRING ( "Phase" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 ,
0 } } ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 ,
( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . klczgkm2ox , & rtP . SineWave_Amp
, & rtP . SineWave_Bias , & rtP . SineWave_Freq , & rtP . SineWave_Phase , &
rtP . SineWave1_Amp , & rtP . SineWave1_Bias , & rtP . SineWave1_Freq , & rtP
. SineWave1_Phase , } ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) }
;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 } ; static const
rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 0 ] , 0 , 0 } } ; static
rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 1 , ( NULL )
, 0 , ( NULL ) , 0 } , { rtBlockParameters , 8 , rtModelParameters , 0 } , {
( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap
, rtSampleTimeMap , rtDimensionArray } , "float" , { 964476190U , 3044630110U
, 706644395U , 3902527603U } , ( NULL ) , 0 , 0 } ; const
rtwCAPI_ModelMappingStaticInfo * untitled_GetCAPIStaticMap ( void ) { return
& mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void untitled_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void untitled_host_InitializeDataMapInfo ( untitled_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
