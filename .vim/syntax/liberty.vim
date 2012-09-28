" Vim syntax file
" Language:     Liberty library definition
" Maintainer:   Peter Debacker "pdback@imec.be"
" Last Change:  27/09/2012
"
" This is based on spectre .vim by Ahmed Nabil

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Liberty syntax is case INsensitive
syn case ignore
setlocal iskeyword=@,48-57,_

syn keyword     libertyTodo        contained TODO

" Numbers, all with engineering suffixes and optional units
"==========================================================
"floating point number, with dot, optional exponent
syn match libertyNumber  "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"floating point number, starting with a dot, optional exponent
syn match libertyNumber  "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"integer number with optional exponent
syn match libertyNumber  "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="

" Group names
"============
syn match libertyGroupName "\<[a-z]\+[0-9a-z_]*\>" contained

" Library Group and its attributes and subgroups
"===============================================
syn keyword     libertyGroup       library
syn keyword     libertySimpleAttr  bus_naming_style comment current_unit date default_fpga_isd
syn keyword     libertySimpleAttr  default_threshold_voltage_group delay_model distance_unit dist_conversion_factor
syn keyword     libertySimpleAttr  em_temp_degradation_factor fpga_domain_style fpga_technology in_place_swap_mode
syn keyword     libertySimpleAttr  input_threshold_pct_fall input_threshold_pct_rise leakage_power_unit nom_calc_mode
syn keyword     libertySimpleAttr  nom_process nom_temperature nom_voltage output_threshold_pct_fall output_threshold_pct_rise
syn keyword     libertySimpleAttr  piece_type power_model preferred_output_pad_slew_rate_control preferred_input_pad_voltage
syn keyword     libertySimpleAttr  preferred_output_pad_voltage pulling_resistance_unit revision simulation
syn keyword     libertySimpleAttr  slew_derate_from_library slew_lower_threshold_pct_fall slew_lower_threshold_pct_rise
syn keyword     libertySimpleAttr  slew_upper_threshold_pct_fall slew_upper_threshold_pct_rise time_unit voltage_unit
syn keyword     libertySimpleAttr  base_curves_group variable_1 variable_2 variable_3 default_operating_conditions
syn keyword     libertySimpleAttr  default_wire_load_selection default_wire_load default_wire_load_mode
syn keyword     libertySimpleAttr  in_place_swap_mode default_max_transition default_inout_pin_cap default_input_pin_cap
syn keyword     libertySimpleAttr  default_output_pin_cap
syn keyword     libertyComplexAttr capacitive_load_unit default_part define define_cell_area define_group
syn keyword     libertyComplexAttr piece_define routing_layers technology voltage_map base_curve_type
syn keyword     libertyComplexAttr curve_x curve_y index_1 index_2 index_3 pin_names vector library_features
syn keyword     libertyGroup       base_curves compact_lut_template char_config dc_current_template em_lut_template
syn keyword     libertyGroup       fall_net_delay fall_transition_degradation faults_lut_template input_voltage fpga_isd
syn keyword     libertyGroup       iv_lut_template lu_table_template maxcap_lut_template maxtrans_lut_template
syn keyword     libertyGroup       noise_lut_template normalized_driver_waveform operating_conditions output_current_template
syn keyword     libertyGroup       output_voltage part pg_current_template poly_template power_lut_template power_poly_template
syn keyword     libertyGroup       power_supply propagation_lut_template rise_net_delay rise_transition_degradation
syn keyword     libertyGroup       scaled_cell sensitization scaling_factors timing timing_range type user_parameters
syn keyword     libertyGroup       wire_load wire_load_selection wire_load_table critical_area_lut_template
syn keyword     libertyGroup       device_layer poly_layer routing_layer cont_layer

" Cell Group and its attributes and subgroups
"============================================
" TODO

" Misc
"=====
syn match   libertyWrapLineOperator       "\\$"
syn match   libertyIgnore                 "\ \ \ "

syn region  libertyString       start=+"+ skip=+\\\\\|\\"+ end=+"+

syn region libertyComment start="/\*" end="\*/" contains=libertyTodo

" Matching pairs of parentheses
"==========================================
syn region  libertyParen      transparent matchgroup=libertyOperator start="(" end=")" contains=libertyGroupName,libertyString
syn region  libertyCurlyBrace transparent matchgroup=libertyOperator start="{" end="}" contains=ALLBUT,libertyCurlyBraceError,libertyGroupName
"syn match libertyKeyword /)\ \<[a-z]\+[0-9]*[a-z]*\>\ /

" Errors
"=======
syn match libertyParenError ")"
syn match libertyCurlyBraceError "}"

" Syncs
" =====
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_liberty_syntax_inits")
  if version < 508
    let did_liberty_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink libertyTodo             Todo
  HiLink libertyWrapLineOperator libertyOperator
  HiLink libertySinglequote      libertyExpr
  HiLink libertyExpr             Function
  HiLink libertyParenError       Error
  HiLink libertyNumber           Number
  HiLink libertyComment          Comment
  HiLink libertyOperator         Operator
  HiLink libertyString           String
  HiLink libertyGroup            Type
  HiLink libertyGroupName        String
  HiLink libertySimpleAttr       Statement
  HiLink libertyComplexAttr      Statement
  HiLink libertyIgnore           Ignore

  delcommand HiLink
endif

let b:current_syntax = "liberty"

" TODO
" insert the following to $VIM/syntax/scripts.vim
" to autodetect HSpice netlists and text listing output:
"
" " Spice netlists and text listings
" elseif getline(1) =~ 'liberty\>' || getline("$") =~ '^\.end'
"   so <sfile>:p:h/liberty.vim

