// Copyright (c) 2024 Epic Games Tools
// Licensed under the MIT license (https://opensource.org/license/mit/)

////////////////////////////////
//~ rjf: Config Sources

@table(string, name, load_cmd, write_cmd, apply_cmd)
DF_CfgSrcTable:
{
  {"user"            User             LoadUser       WriteUserData       ApplyUserData    }
  {"profile"         Profile          LoadProfile    WriteProfileData    ApplyProfileData }
  {"command_line"    CommandLine      Null           Null                Null             }
}

////////////////////////////////
//~ rjf: Entity Kind Tables

@table(name)
DF_NameKindTable:
{
  {Null}
  {EntityName}
  {EntityKindName}
}

@table(name          name_lower            op_delete     op_freeze       op_edit      op_rename    op_enable       op_cond       op_dup       lf_mut_user_cfg     tr_mut_user_cfg     lf_mut_prof_cfg     tr_mut_prof_cfg     lf_mut_halt   lf_mut_dbg   tr_mut_halt   tr_mut_dbg   name_is_code   user_lifetime            name_label          icon_kind              display_string)
DF_EntityKindTable:
{
  {Nil                nil                   0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "Nil"                        }
  {Root               root                  0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "Root"                       }
  {Machine            machine               0             1               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Machine                "Machine"                    }
  
  //- rjf: filesystem modeling
  {File               file                  0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             FileOutline            "File"                       }
  {OverrideFileLink   override_file_link    0             0               0            0            0               0             0            1                   0                    0                  0                   0             0            0             0            0              0                        "Label"             FileOutline            "Override File Link"         }
  {PendingFileChange  pending_file_change   0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             FileOutline            "Pending File Change"        }
  
  //- rjf: diagnostics log
  {DiagLog            diag_log              0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             FileOutline            "Diagnostics Log"            }
  
  //- rjf: text attachments
  {FlashMarker        flash_marker          0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "Flash Marker"               }
  
  //- rjf: watch pins
  {WatchPin           watch_pin             1             0               0            1            0               0             1            0                   0                    0                  0                   0             0            0             0            1              1                        "Expression"        Pin                    "Watch Pin"                  }
  
  //- rjf: breakpoints
  {Breakpoint         breakpoint            1             0               0            1            1               1             1            0                   0                    1                  0                   1             0            0             0            0              1                        "Label"             CircleFilled           "Breakpoint"                 }
  {Condition          condition             0             0               0            0            0               0             0            0                   0                    1                  1                   1             0            0             0            1              1                        "Expression"        CircleFilled           "Condition"                  }
  
  //- rjf: targets
  {Target             target                1             0               1            1            1               0             1            0                   0                    1                  0                   0             0            0             0            0              1                        "Label"             Target                 "Target"                     }
  {Executable         executable            0             0               0            0            0               0             0            0                   0                    1                  0                   0             0            0             0            0              1                        "Executable"        Null                   "Executable"                 }
  {Arguments          arguments             0             0               0            0            0               0             0            0                   0                    1                  0                   0             0            0             0            0              1                        "Arguments"         Null                   "Arguments"                  }
  {ExecutionPath      execution_path        0             0               0            0            0               0             0            0                   0                    1                  0                   0             0            0             0            0              1                        "Execution Path"    Null                   "Execution Path"             }
  {EntryPointName     entry_point_name      0             0               0            0            0               0             0            0                   0                    1                  0                   1             0            0             0            0              1                        "Symbol Name"       Null                   "Entry Point Name"           }
  
  //- rjf: src -> dst mapping
  {Source             source                0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Path"              Null                   "Source"                     }
  {Dest               dest                  0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Path"              Null                   "Destination"                }
  
  //- rjf: control system entities
  {CtrlRequest        ctrl_request          0             0               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "Control Request"            }
  {Process            process               0             1               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Threads                "Process"                    }
  {Thread             thread                0             1               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Thread                 "Thread"                     }
  {Module             module                0             0               0            0            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Module                 "Module"                     }
  {DebugInfoOverride  debug_info_override   0             0               0            0            0               0             0            0                   0                    0                  0                   1             1            1             1            0              0                        "Label"             Null                   "Debug Info Override"        }
  
  //- rjf: parser task entities
  {ConversionTask     conversion_task       0             0               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "Conversion Task"            }
  {ConversionFail     conversion_fail       0             0               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "Conversion Failure"         }
  
  //- rjf: history
  {EndedProcess       ended_process         1             0               0            1            0               0             0            0                   0                    0                  0                   0             0            0             0            0              0                        "Label"             Null                   "EndedProcess"               }
}

////////////////////////////////
//~ rjf: Built-In Command Tables

@table(name, name_lower, c_type)
DF_CmdParamSlotTable:
{
  {Window,            window,      `DF_Handle`}
  {Panel,             panel,       `DF_Handle`}
  {DestPanel,         dest_panel,  `DF_Handle`}
  {PrevView,          prev_view,   `DF_Handle`}
  {View,              view,        `DF_Handle`}
  {Entity,            entity,      `DF_Handle`}
  {EntityList,        entity_list, `DF_HandleList`}
  {String,            string,      `String8`}
  {FilePath,          file_path,   `String8`}
  {TextPoint,         text_point,  `TxtPt`}
  {CmdSpec,           cmd_spec,    `struct DF_CmdSpec *`}
  {VirtualAddr,       vaddr,       `U64`}
  {VirtualOff,        voff,        `U64`}
  {Index,             index,       `U64`}
  {ID,                id,          `U64`}
  {PreferDisassembly, prefer_dasm, `B32`}
}

@table(name, display_string, args_desc)
DF_CmdQueryRuleTable:
{
  {Null                    ""                 ""                                            }
  {Entity                  ""                 ""                                            }
  {String                  ""                 ""                                            }
  {SearchString            ""                 ""                                            }
  {FilePath                "File Path"        "<file path>"                                 }
  {TextPoint               "Text Point"       "<line>[:column]"                             }
  {FilePathAndTextPoint    "Source Location"  "<file path>[:line[:column]]"                 }
  {VirtualAddr             "Virtual Address"  "<address>"                                   }
  {VirtualOff              "Virtual Offset"   "<offset>"                                    }
  {Index                   "Index"            "<index>"                                     }
  {ID                      "ID"               "<id>"                                        }
}

@table(name                      lister_omit  keep_query   old_input   apply_to_view   query_is_code     query_slot0        query_slot1        query_slot2              query_entity_filter         query_rule           query_info_0_u64                     query_info_1_u64                                 canonical_icon        string                        display_name                                  desc                                                                                                               search_tags                      )
DF_CoreCmdTable:
{
  {Null                           1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  ""                            ""                                            ""                                                                                                                 ""                               }
  
  //- rjf: exiting
  {Exit                           0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                X                     "exit"                        "Exit"                                        "Exits the debugger."                                                                                              "quit,close,abort"               }
  
  //- rjf: command fast path
  {CommandFastPath                1            0            0           0               0                 CmdSpec            Null               Null                     Null                        Null                 0                                    0                                                Null                  "command_fast_path"           "Command Fast Path"                           "Performs the fast path for the command named by the argument."                                                    ""                               }
  
  //- rjf: notifications
  {Error                          1            0            0           0               0                 String             Null               Null                     Null                        Null                 0                                    0                                                Null                  "error"                       "Error"                                       "Notifies of an error."                                                                                            ""                               }
  
  //- rjf: low-level target control operations
  {LaunchAndRun                   0            0            0           0               0                 EntityList         Null               Null                     Target                      Entity               DF_EntityKind_Target                 0                                                Play                  "launch_and_run"              "Launch and Run"                              "Starts debugging a new instance of a target, then runs."                                                          "launch,start,run,target"        }
  {LaunchAndInit                  0            0            0           0               0                 EntityList         Null               Null                     Target                      Entity               DF_EntityKind_Target                 0                                                PlayStepForward       "launch_and_init"             "Launch and Initialize"                       "Starts debugging a new instance of a target, then stops at the program's entry point."                            "launch,start,entry,point"       }
  {Kill                           0            0            0           0               0                 EntityList         Null               Null                     Process                     Entity               DF_EntityKind_Process                0                                                Stop                  "kill"                        "Kill"                                        "Kills the specified existing debugged process(es)."                                                               "stop,kill"                      }
  {KillAll                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Stop                  "kill_all"                    "Kill All"                                    "Kills all debugged child processes."                                                                              "stop,kill,all"                  }
  {Detach                         0            0            0           0               0                 EntityList         Null               Null                     Process                     Entity               DF_EntityKind_Process                0                                                Null                  "detach"                      "Detach"                                      "Detaches the specified debugged process."                                                                         "detach"                         }
  {Continue                       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Play                  "continue"                    "Continue"                                    "Continues all halted threads."                                                                                    ""                               }
  {StepIntoInst                   0            0            0           0               0                 Entity             Null               Null                     Null                        Null                 0                                    0                                                StepInto              "step_into_inst"              "Step Into (Assembly)"                        "Performs a step that goes into calls, at the instruction level."                                                  "single,step,thread"             }
  {StepOverInst                   0            0            0           0               0                 Entity             Null               Null                     Null                        Null                 0                                    0                                                StepOver              "step_over_inst"              "Step Over (Assembly)"                        "Performs a step that skips calls, at the instruction level."                                                      "single,step,thread"             }
  {StepIntoLine                   0            0            0           0               0                 Entity             Null               Null                     Null                        Null                 0                                    0                                                StepInto              "step_into_line"              "Step Into (Line)"                            "Performs a step that goes into calls, at the source code line level."                                             "step,thread"                    }
  {StepOverLine                   0            0            0           0               0                 Entity             Null               Null                     Null                        Null                 0                                    0                                                StepOver              "step_over_line"              "Step Over (Line)"                            "Performs a step that skips calls, at the source code line level."                                                 "step,thread"                    }
  {StepOut                        0            0            0           0               0                 Entity             Null               Null                     Null                        Null                 0                                    0                                                StepOut               "step_out"                    "Step Out"                                    "Runs to the end of the current function and exits it."                                                            ""                               }
  {RunToAddress                   0            0            0           0               0                 Entity             VirtualAddr        Null                     Thread                      VirtualAddr          0                                    0                                                PlayStepForward       "run_to_address"              "Run To Address"                              "Runs the selected thread to the specified address."                                                               ""                               }
  {RunToModuleOffset              0            0            0           0               0                 Entity             VirtualOff         Null                     Thread                      VirtualOff           0                                    0                                                PlayStepForward       "run_to_module_offset"        "Run To Module Offset"                        "Runs the selected thread to the specified offset within the current module."                                      ""                               }
  {Halt                           0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Pause                 "halt"                        "Halt"                                        "Halts all running processes."                                                                                     "pause"                          }
  {SoftHaltRefresh                0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Refresh               "soft_halt_refresh"           "Soft Halt Refresh"                           "Interrupts all running processes to collect data, and then resumes them."                                         ""                               }
  {SetThreadIP                    1            0            0           0               0                 Entity             VirtualAddr        Null                     Null                        Null                 0                                    0                                                Null                  "set_thread_ip"               "Set Thread IP"                               "Sets the passed thread's instruction pointer at the passed address."                                              ""                               }
  
  //- rjf: high-level composite target control operations
  {Run                            0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Play                  "run"                         "Run"                                         "Runs all targets after starting them if they have not been started yet."                                          "play"                           }
  {Restart                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Redo                  "restart"                     "Restart"                                     "Kills all running processes, then restarts the targets which were used to launch all current processes (if any)." "restart,retry"                  }
  {StepInto                       0            0            0           0               0                 Entity             Null               Null                     Thread                      Null                 0                                    0                                                StepInto              "step_into"                   "Step Into"                                   "Steps once, possibly into function calls, for either line or instructions."                                       ""                               }
  {StepOver                       0            0            0           0               0                 Entity             Null               Null                     Thread                      Null                 0                                    0                                                StepOver              "step_over"                   "Step Over"                                   "Steps once, always over function calls, for either line or instructions."                                         ""                               }
  {RunToCursor                    0            0            0           0               0                 Entity             View               Null                     Thread                      Null                 0                                    0                                                Play                  "run_to_cursor"               "Run To Cursor"                               "Runs the selected thread to the current cursor."                                                                  ""                               }
  {SetNextStatement               0            0            0           0               0                 Entity             View               Null                     Thread                      Null                 0                                    0                                                RightArrow            "set_next_statement"          "Set Next Statement"                          "Sets the selected thread's instruction pointer to the cursor's position."                                         ""                               }
  
  //- rjf: solo stepping mode
  {EnableSoloSteppingMode         0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Thread                "enable_solo_stepping_mode"   "Enable Solo Stepping Mode"                   "Enables 'solo stepping mode', which suspends all non-selected threads before stepping."                           "solo,stepping,mode,suspend"     }
  {DisableSoloSteppingMode        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Thread                "disable_solo_stepping_mode"  "Disable Solo Stepping Mode"                  "Disables 'solo stepping mode', which suspends all non-selected threads before stepping."                          "solo,stepping,mode,suspend"     }
  
  //- rjf: debug control context management operations
  {SelectThread                   0            0            0           0               0                 Entity             Null               Null                     Thread                      Entity               DF_EntityKind_Thread                 0                                                Null                  "select_thread"               "Select Thread"                               "Selects a thread."                                                                                                ""                               }
  {SelectThreadWindow             0            0            0           0               0                 Entity             Window             Null                     Thread                      Entity               DF_EntityKind_Thread                 0                                                Null                  "select_thread_window"        "Select Thread On Window"                     "Selects a thread for the active window, overriding the global selected thread."                                   ""                               }
  {SelectThreadView               0            0            0           0               0                 Entity             View               Null                     Thread                      Entity               DF_EntityKind_Thread                 0                                                Null                  "select_thread_view"          "Select Thread On View"                       "Selects a thread for the active view, overriding the global and per-window selected threads."                     ""                               }
  {SelectUnwind                   1            0            0           0               0                 Index              Null               Null                     Null                        Null                 0                                    0                                                Null                  "select_unwind"               "Select Unwind"                               "Selects an unwind frame number for the selected thread."                                                          ""                               }
  {UpOneFrame                     0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                UpArrow               "up_one_frame"                "Up One Frame"                                "Selects the callstack frame above the currently selected."                                                        ""                               }
  {DownOneFrame                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                DownArrow             "down_one_frame"              "Down One Frame"                              "Selects the callstack frame below the currently selected."                                                        ""                               }
  {FreezeThread                   0            0            0           0               0                 Entity             Null               Null                     Thread                      Entity               DF_EntityKind_Thread                 0                                                Locked                "freeze_thread"               "Freeze Thread"                               "Freezes the passed thread."                                                                                       ""                               }
  {ThawThread                     0            0            0           0               0                 Entity             Null               Null                     Thread                      Entity               DF_EntityKind_Thread                 0                                                Unlocked              "thaw_thread"                 "Thaw Thread"                                 "Thaws the passed thread."                                                                                         ""                               }
  {FreezeProcess                  0            0            0           0               0                 Entity             Null               Null                     Process                     Entity               DF_EntityKind_Process                0                                                Locked                "freeze_process"              "Freeze Process"                              "Freezes the passed process."                                                                                      ""                               }
  {ThawProcess                    0            0            0           0               0                 Entity             Null               Null                     Process                     Entity               DF_EntityKind_Process                0                                                Unlocked              "thaw_process"                "Thaw Process"                                "Thaws the passed process."                                                                                        ""                               }
  {FreezeMachine                  1            0            0           0               0                 Entity             Null               Null                     Machine                     Entity               DF_EntityKind_Machine                0                                                Locked                "freeze_machine"              "Freeze Machine"                              "Freezes the passed machine."                                                                                      ""                               }
  {ThawMachine                    1            0            0           0               0                 Entity             Null               Null                     Machine                     Entity               DF_EntityKind_Machine                0                                                Unlocked              "thaw_machine"                "Thaw Machine"                                "Thaws the passed machine."                                                                                        ""                               }
  {FreezeLocalMachine             0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Machine               "freeze_local_machine"        "Freeze Local Machine"                        "Freezes the local machine."                                                                                       ""                               }
  {ThawLocalMachine               0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Machine               "thaw_local_machine"          "Thaw Local Machine"                          "Thaws the local machine."                                                                                         ""                               }
  
  //- rjf: font sizes
  {IncUIFontScale                 0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Null                  "inc_ui_font_scale"           "Increase UI Font Scale"                      "Increases the font size used for UI."                                                                             ""                               }
  {DecUIFontScale                 0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Null                  "dec_ui_font_scale"           "Decrease UI Font Scale"                      "Decreases the font size used for UI."                                                                             ""                               }
  {IncCodeFontScale               0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Null                  "inc_code_font_scale"         "Increase Code Font Scale"                    "Increases the font size used for code."                                                                           ""                               }
  {DecCodeFontScale               0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Null                  "dec_code_font_scale"         "Decrease Code Font Scale"                    "Decreases the font size used for code."                                                                           ""                               }
  
  //- rjf: windows
  {OpenWindow                     0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Window                "open_window"                 "Open New Window"                             "Opens a new window."                                                                                              ""                               }
  {CloseWindow                    0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Window                "close_window"                "Close Window"                                "Closes an opened window."                                                                                         ""                               }
  {ToggleFullscreen               0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Window                "toggle_fullscreen"           "Toggle Fullscreen"                           "Toggles fullscreen view on the active window."                                                                    ""                               }
  
  //- rjf: panel splitting
  {ResetToDefaultPanels           0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                Window                "reset_to_default_panels"     "Reset To Default Panel Layout"               "Resets the window to the default panel layout."                                                                   "panel"                          }
  {NewPanelRight                  0            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                XSplit                "new_panel_right"             "Split Panel Vertically"                      "Creates a new panel to the right of the active panel."                                                            "panel"                          }
  {NewPanelDown                   0            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                YSplit                "new_panel_down"              "Split Panel Horizontally"                    "Creates a new panel at the bottom of the active panel."                                                           "panel"                          }
  
  //- rjf: panel rotation
  {RotatePanelColumns             0            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                Null                  "rotate_panel_columns"        "Rotate Panel Columns"                        "Rotates all panels at the closest column level of the panel hierarchy."                                           ""                               }
  
  //- rjf: focused panel changing
  {NextPanel                      0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                RightArrow            "next_panel"                  "Focus Next Panel"                            "Cycles the active panel forward."                                                                                 ""                               }
  {PrevPanel                      0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                LeftArrow             "prev_panel"                  "Focus Previous Panel"                        "Cycles the active panel backwards."                                                                               ""                               }
  {FocusPanel                     1            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                Null                  "focus_panel"                 "Focus Panel"                                 "Focuses a new panel."                                                                                             ""                               }
  {FocusPanelRight                0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                RightArrow            "focus_panel_right"           "Focus Panel Right"                           "Focuses a panel rightward of the currently focused panel."                                                        ""                               }
  {FocusPanelLeft                 0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                LeftArrow             "focus_panel_left"            "Focus Panel Left"                            "Focuses a panel leftward of the currently focused panel."                                                         ""                               }
  {FocusPanelUp                   0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                UpArrow               "focus_panel_up"              "Focus Panel Up"                              "Focuses a panel upward of the currently focused panel."                                                           ""                               }
  {FocusPanelDown                 0            0            0           0               0                 Window             Null               Null                     Null                        Null                 0                                    0                                                DownArrow             "focus_panel_down"            "Focus Panel Down"                            "Focuses a panel downward of the currently focused panel."                                                         ""                               }
  
  //- rjf: undo/redo
  {Undo                           1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Undo                  "undo"                        "Undo"                                        "Undoes the previous action."                                                                                      ""                               }
  {Redo                           1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Redo                  "redo"                        "Redo"                                        "Redoes the first previously undone action."                                                                       ""                               }
  
  //- rjf: focus history
  {GoBack                         1            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                LeftArrow             "go_back"                     "Go Back"                                     "Returns to the previously selected panel and tab in recorded history."                                            ""                               }
  {GoForward                      1            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                RightArrow            "go_forward"                  "Go Forward"                                  "Returns to the next selected panel and tab in recorded history."                                                  ""                               }
  
  //- rjf: panel removal
  {ClosePanel                     0            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                ClosePanel            "close_panel"                 "Close Panel"                                 "Closes the currently active panel."                                                                               ""                               }
  
  //- rjf: panel tab
  {NextTab                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                RightArrow            "next_tab"                    "Focus Next Tab"                              "Focuses the next tab on the active panel."                                                                        ""                               }
  {PrevTab                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                LeftArrow             "prev_tab"                    "Focus Previous Tab"                          "Focuses the previous tab on the active panel."                                                                    ""                               }
  {MoveTabRight                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                RightArrow            "move_tab_right"              "Move Tab Right"                              "Moves the selected tab right one slot."                                                                           ""                               }
  {MoveTabLeft                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                LeftArrow             "move_tab_left"               "Move Tab Left"                               "Moves the selected tab left one slot."                                                                            ""                               }
  {CloseTab                       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                X                     "close_tab"                   "Close Tab"                                   "Closes the currently opened tab."                                                                                 ""                               }
  {MoveTab                        1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_tab"                    "Move Tab"                                    "Moves a tab to a new panel."                                                                                      ""                               }
  {TabBarTop                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                UpArrow               "tab_bar_top"                 "Anchor Tab Bar To Top"                       "Anchors a panel's tab bar to the top of the panel."                                                               ""                               }
  {TabBarBottom                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                DownArrow             "tab_bar_bottom"              "Anchor Tab Bar To Bottom"                    "Anchors a panel's tab bar to the bottom of the panel."                                                            ""                               }
  {TabBarEnable                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "tab_bar_enable"              "Enable Tab Bar"                              "Enables a panel's tab bar."                                                                                       ""                               }
  {TabBarDisable                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "tab_bar_disable"             "Disable Tab Bar"                             "Disables a panel's tab bar."                                                                                      ""                               }
  {TabBarHistoryModeEnable        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "tab_bar_history_mode_enable" "Enable Tab Bar History Mode"                 "Enables history mode for a panel's tab bar, which orders and manages tabs as recorded history of views."          ""                               }
  {TabBarHistoryModeDisable       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "tab_bar_history_mode_disable""Disable Tab Bar History Mode"                "Disables history mode for a panel's tab bar."                                                                     ""                               }
  
  //- rjf: files
  {SetCurrentPath                 0            0            0           0               0                 FilePath           Null               Null                     Null                        FilePath             0                                    0                                                FileOutline           "set_current_path"            "Set Current Path"                            "Sets the debugger's current path, which is used as a starting point when browsing for files."                     ""                               }
  {Open                           0            0            0           0               0                 FilePath           Null               Null                     Null                        FilePath             0                                    0                                                FileOutline           "open"                        "Open"                                        "Opens a file."                                                                                                    "code,source,file"               }
  {Reload                         0            0            0           0               0                 Entity             Null               Null                     File                        Entity               DF_EntityKind_File                   0                                                FileOutline           "reload"                      "Reload"                                      "Reloads a loaded file."                                                                                           "code,source,file,reload"        }
  {ReloadActive                   0            0            0           0               0                 Window             Panel              Null                     Null                        Null                 0                                    0                                                FileOutline           "reload_active"               "Reload Active File"                          "Reloads the active file."                                                                                         "code,source,file,reload"        }
  {Switch                         0            0            0           0               0                 Window             Panel              Entity                   File                        Entity               DF_EntityKind_File                   DF_EntityFlag_IsFolder                           FileOutline           "switch"                      "Switch"                                      "Switches to a loaded file."                                                                                       "code,source,file"               }
  
  //- rjf: override file links
  {SetFileOverrideLinkSrc         1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "set_file_override_link_src"  "Set File Override Link Source"               "Sets the source path for an override file link."                                                                  ""                               }
  {SetFileOverrideLinkDst         1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "set_file_override_link_dst"  "Set File Override Link Destination"          "Sets the destination path for an override file link."                                                             ""                               }
  {SetFileReplacementPath         1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "set_file_replacement_path"   "Set File Replacement Path"                   "Sets the path which should be used as the replacement for the passed file."                                       ""                               }
  
  //- rjf: setting config paths
  {LoadUser                       0            0            0           0               0                 FilePath           Null               Null                     Null                        FilePath             0                                    0                                                Person                "load_user"                   "Load User"                                   "Loads and applies a user file."                                                                                   "load,user,profile,layout"       }
  {LoadProfile                    0            0            0           0               0                 FilePath           Null               Null                     Null                        FilePath             0                                    0                                                Briefcase             "load_profile"                "Load Profile"                                "Loads and applies a profile file."                                                                                "profile,project,session"        }
  
  //- rjf: loading/applying stateful config changes
  {ApplyUserData                  1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "apply_user_data"             "Apply User Data"                             "Applies user data from the active user file."                                                                     ""                               }
  {ApplyProfileData               1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "apply_profile_data"          "Apply Profile Data"                          "Applies profile data from the active profile file."                                                               ""                               }
  
  //- rjf: writing config changes
  {WriteUserData                  1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "write_user_data"             "Write User Data"                             "Writes user data to the active user file."                                                                        ""                               }
  {WriteProfileData               1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "write_profile_data"          "Write Profile Data"                          "Writes profile data to the active profile file."                                                                  ""                               }
  
  //- rjf: directional movement & text controls
  {MoveLeft                       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_left"                   "Move Left"                                   "Moves the cursor or selection left."                                                                              ""                               }
  {MoveRight                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_right"                  "Move Right"                                  "Moves the cursor or selection right."                                                                             ""                               }
  {MoveUp                         0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up"                     "Move Up"                                     "Moves the cursor or selection up."                                                                                ""                               }
  {MoveDown                       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down"                   "Move Down"                                   "Moves the cursor or selection down."                                                                              ""                               }
  {MoveLeftSelect                 0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_left_select"            "Move Left Select"                            "Moves the cursor or selection left, while selecting."                                                             ""                               }
  {MoveRightSelect                0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_right_select"           "Move Right Select"                           "Moves the cursor or selection right, while selecting."                                                            ""                               }
  {MoveUpSelect                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_select"              "Move Up Select"                              "Moves the cursor or selection up, while selecting."                                                               ""                               }
  {MoveDownSelect                 0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_select"            "Move Down Select"                            "Moves the cursor or selection down, while selecting."                                                             ""                               }
  {MoveLeftChunk                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_left_chunk"             "Move Left Select"                            "Moves the cursor or selection left one chunk."                                                                    ""                               }
  {MoveRightChunk                 0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_right_chunk"            "Move Right Select"                           "Moves the cursor or selection right one chunk."                                                                   ""                               }
  {MoveUpChunk                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_chunk"               "Move Up Chunk"                               "Moves the cursor or selection up one chunk."                                                                      ""                               }
  {MoveDownChunk                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_chunk"             "Move Down Chunk"                             "Moves the cursor or selection down one chunk."                                                                    ""                               }
  {MoveUpPage                     0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_page"                "Move Up Page"                                "Moves the cursor or selection up one page."                                                                       ""                               }
  {MoveDownPage                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_page"              "Move Down Page"                              "Moves the cursor or selection down one page."                                                                     ""                               }
  {MoveUpWhole                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_whole"               "Move Up Whole"                               "Moves the cursor or selection to the beginning of the relevant content."                                          ""                               }
  {MoveDownWhole                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_whole"             "Move Down Whole"                             "Moves the cursor or selection to the end of the relevant content."                                                ""                               }
  {MoveLeftChunkSelect            0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_left_chunk_select"      "Move Left Chunk Select"                      "Moves the cursor or selection left one chunk."                                                                    ""                               }
  {MoveRightChunkSelect           0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_right_chunk_select"     "Move Right Chunk Select"                     "Moves the cursor or selection right one chunk."                                                                   ""                               }
  {MoveUpChunkSelect              0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_chunk_select"        "Move Up Chunk Select"                        "Moves the cursor or selection up one chunk."                                                                      ""                               }
  {MoveDownChunkSelect            0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_chunk_select"      "Move Down Chunk Select"                      "Moves the cursor or selection down one chunk."                                                                    ""                               }
  {MoveUpPageSelect               0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_page_select"         "Move Up Page Select"                         "Moves the cursor or selection up one page, while selecting."                                                      ""                               }
  {MoveDownPageSelect             0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_page_select"       "Move Down Page Select"                       "Moves the cursor or selection down one page, while selecting."                                                    ""                               }
  {MoveUpWholeSelect              0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_up_whole_select"        "Move Up Whole Select"                        "Moves the cursor or selection to the beginning of the relevant content, while selecting."                         ""                               }
  {MoveDownWholeSelect            0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_down_whole_select"      "Move Down Whole Select"                      "Moves the cursor or selection to the end of the relevant content, while selecting."                               ""                               }
  {MoveHome                       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_home"                   "Move Home"                                   "Moves the cursor to the beginning of the line."                                                                   ""                               }
  {MoveEnd                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_end"                    "Move End"                                    "Moves the cursor to the end of the line."                                                                         ""                               }
  {MoveHomeSelect                 0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_home_select"            "Move Home Select"                            "Moves the cursor to the beginning of the line, while selecting."                                                  ""                               }
  {MoveEndSelect                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "move_end_select"             "Move End Select"                             "Moves the cursor to the end of the line, while selecting."                                                        ""                               }
  {SelectAll                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "select_all"                  "Select All"                                  "Selects everything possible."                                                                                     ""                               }
  {DeleteSingle                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "delete_single"               "Delete Single"                               "Deletes a single element to the right of the cursor, or the active selection."                                    ""                               }
  {DeleteChunk                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "delete_chunk"                "Delete Chunk"                                "Deletes a chunk to the right of the cursor, or the active selection."                                             ""                               }
  {BackspaceSingle                0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "backspace_single"            "Backspace Single"                            "Deletes a single element to the left of the cursor, or the active selection."                                     ""                               }
  {BackspaceChunk                 0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "backspace_chunk"             "Backspace Chunk"                             "Deletes a chunk to the left of the cursor, or the active selection."                                              ""                               }
  {Copy                           0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Clipboard             "copy"                        "Copy"                                        "Copies the active selection to the clipboard."                                                                    ""                               }
  {Cut                            0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Clipboard             "cut"                         "Cut"                                         "Copies the active selection to the clipboard, then deletes it."                                                   ""                               }
  {Paste                          0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Clipboard             "paste"                       "Paste"                                       "Pastes the current contents of the clipboard."                                                                    ""                               }
  {InsertText                     1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "insert_text"                 "Insert Text"                                 "Inserts the text that was used to cause this command."                                                            ""                               }
  
  //- rjf: code navigation
  {GoToLine                       0            0            0           1               0                 TextPoint          Null               Null                     Null                        TextPoint            0                                    0                                                Null                  "goto_line"                   "Go To Line"                                  "Jumps to a line number in the current code file."                                                                 ""                               }
  {GoToAddress                    0            0            0           1               1                 VirtualAddr        Null               Null                     Null                        VirtualAddr          0                                    0                                                Null                  "goto_address"                "Go To Address"                               "Jumps to an address in the current memory or disassembly view."                                                   ""                               }
  {CenterCursor                   0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "center_cursor"               "Center Cursor"                               "Snaps the current code view to center the cursor."                                                                ""                               }
  {ContainCursor                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "contain_cursor"              "Contain Cursor"                              "Snaps the current code view to contain the cursor."                                                               ""                               }
  {FindTextForward                0            1            1           1               1                 String             Null               Null                     Null                        SearchString         0                                    0                                                Find                  "find_text_forward"           "Find Text (Forward)"                         "Searches the current code file forward (from the cursor) for a string."                                           ""                               }
  {FindTextBackward               0            1            1           1               1                 String             Null               Null                     Null                        SearchString         0                                    0                                                Find                  "find_text_backward"          "Find Text (Backwards)"                       "Searches the current code file backwards (from the cursor) for a string."                                         ""                               }
  {FindNext                       0            1            1           1               0                 String             Null               Null                     Null                        Null                 0                                    0                                                Find                  "find_next"                   "Find Next"                                   "Searches the current code file forward (from the cursor) for the last searched string."                           ""                               }
  {FindPrev                       0            1            1           1               0                 String             Null               Null                     Null                        Null                 0                                    0                                                Find                  "find_prev"                   "Find Previous"                               "Searches the current code file backwards (from the cursor) for the last searched string."                         ""                               }
  
  //- rjf: thread finding
  {FindThread                     0            0            0           0               0                 Entity             Null               Null                     Thread                      Entity               DF_EntityKind_Thread                 0                                                Find                  "find_thread"                 "Find Thread"                                 "Jumps to the passed thread in either source code, disassembly, or both if they're already open."                  ""                               }
  {FindSelectedThread             0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Find                  "find_selected_thread"        "Find Selected Thread"                        "Jumps to the selected thread in either source code, disassembly, or both if they're already open."                ""                               }
  
  //- rjf: name finding
  {GoToName                       0            0            0           0               1                 Null               Null               Null                     Null                        String               0                                    0                                                Null                  "goto_name"                   "Go To Name"                                  "Searches for the passed string as a file, a symbol in debug info, and more, then jumps to it if possible."        ""                               }
  {GoToNameAtCursor               0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "goto_name_at_cursor"         "Go To Name At Cursor"                        "Searches for the text at the cursor as a file, a symbol in debug info, and more, then jumps to it if possible."   ""                               }
  
  //- rjf: watch expressions
  {ToggleWatchExpression          0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Binoculars            "toggle_watch_expr"           "Toggle Watch Expression"                     "Adds or removes an expression to an opened watch view."                                                           ""                               }
  {ToggleWatchExpressionAtCursor  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Binoculars            "toggle_watch_expr_at_cursor" "Toggle Watch Expression At Cursor"           "Adds or removes the expression that the cursor or selection is currently over to an opened watch view."           ""                               }
  
  //- rjf: memory openers
  {OpenFileMemory                 0            0            0           0               0                 Entity             Null               Null                     File                        Entity               DF_EntityKind_File                   0                                                Grid                  "open_file_memory"            "Open File Memory"                            "Opens a memory view for the passed file."                                                                         ""                               }
  {OpenProcessMemory              0            0            0           0               0                 Entity             Null               Null                     Process                     Entity               DF_EntityKind_Process                0                                                Grid                  "open_process_memory"         "Open Process Memory"                         "Opens a memory view for the passed process."                                                                      ""                               }
  {OpenSelectedProcessMemory      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Grid                  "open_selected_process_memory""Open Selected Process Memory"                "Opens a memory view for the selected process."                                                                    ""                               }
  
  //- rjf: memory view parameterization
  {SetColumns                     0            0            0           1               0                 Index              Null               Null                     Null                        Index                0                                    0                                                Thumbnails            "set_columns"                 "Set Columns"                                 "Sets the number of columns for a memory view."                                                                    ""                               }
  
  //- rjf: disassembly view parameterization
  {ToggleAddressVisibility        0            0            0           1               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Thumbnails            "toggle_address_visibility"   "Toggle Address Visibility"                   "Toggles the visibility of addresses in a disassembly view."                                                       ""                               }
  {ToggleCodeBytesVisibility      0            0            0           1               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Thumbnails            "toggle_code_bytes_visibility""Toggle Code Bytes Visibility"                "Toggles the visibility of machine code bytes in a disassembly view."                                              ""                               }
  
  //- rjf: general entity operations
  {EnableEntity                   1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "enable_entity"               "Enable Entity"                               "Enables an entity."                                                                                               ""                               }
  {DisableEntity                  1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "disable_entity"              "Disable Entity"                              "Disables an entity."                                                                                              ""                               }
  {FreezeEntity                   1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "freeze_entity"               "Freeze Entity"                               "Freezes an entity."                                                                                               ""                               }
  {ThawEntity                     1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "thaw_entity"                 "Thaw Entity"                                 "Thaws an entity."                                                                                                 ""                               }
  {RemoveEntity                   1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "remove_entity"               "Remove Entity"                               "Removes an entity."                                                                                               ""                               }
  {NameEntity                     1            0            0           0               0                 Entity             String             Null                     Null                        Null                 0                                    0                                                Null                  "name_entity"                 "Name Entity"                                 "Equips an entity with a name."                                                                                    ""                               }
  {EditEntity                     1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "edit_entity"                 "Edit Entity"                                 "Opens the editor for an entity."                                                                                  ""                               }
  {DuplicateEntity                1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "duplicate_entity"            "Duplicate Entity"                            "Duplicates an entity."                                                                                            ""                               }
  
  //- rjf: breakpoints
  {TextBreakpoint                 1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                CircleFilled          "text_breakpoint"             "Text Breakpoint"                             "Places or removes a breakpoint on the specified line of source code."                                             ""                               }
  {AddressBreakpoint              0            0            0           0               1                 VirtualAddr        Null               Null                     Null                        VirtualAddr          0                                    0                                                CircleFilled          "address_breakpoint"          "Address Breakpoint"                          "Places or removes a breakpoint on the specified address."                                                         ""                               }
  {FunctionBreakpoint             0            0            0           0               1                 String             Null               Null                     Null                        String               0                                    0                                                CircleFilled          "function_breakpoint"         "Function Breakpoint"                         "Places or removes a breakpoint on the first address(es) of the specified function."                               ""                               }
  {ToggleBreakpointAtCursor       0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                CircleFilled          "toggle_breakpoint_cursor"    "Toggle Breakpoint At Cursor"                 "Places or removes a breakpoint on the line on which the active cursor sits."                                      ""                               }
  {RemoveBreakpoint               0            0            0           0               0                 Entity             Null               Null                     Breakpoint                  Entity               DF_EntityKind_Breakpoint             0                                                Trash                 "remove_breakpoint"           "Remove Breakpoint"                           "Removes an existing breakpoint."                                                                                  ""                               }
  {EnableBreakpoint               0            0            0           0               0                 Entity             Null               Null                     Breakpoint                  Entity               DF_EntityKind_Breakpoint             0                                                CheckFilled           "enable_breakpoint"           "Enable Breakpoint"                           "Enables a breakpoint."                                                                                            ""                               }
  {DisableBreakpoint              0            0            0           0               0                 Entity             Null               Null                     Breakpoint                  Entity               DF_EntityKind_Breakpoint             0                                                CheckHollow           "disable_breakpoint"          "Disable Breakpoint"                          "Disables a breakpoint."                                                                                           ""                               }
  
  //- rjf: watches
  {ToggleWatchPin                 1            0            0           0               1                 Entity             TextPoint          String                   Null                        String               0                                    0                                                Binoculars            "toggle_watch_pin"            "Toggle Watch Pin"                            "Places or removes a watch pin on a textual location on a particular entity."                                      ""                               }
  {ToggleWatchPinAtCursor         0            0            0           1               1                 String             Null               Null                     Null                        String               0                                    0                                                Binoculars            "toggle_watch_pin_at_cursor"  "Toggle Watch Pin At Cursor"                  "Places or removes a watch pin at the cursor on the currently active file."                                        ""                               }
  
  //- rjf: targets
  {AddTarget                      0            0            0           0               0                 FilePath           Null               Null                     Null                        FilePath             0                                    0                                                Target                "add_target"                  "Add Target"                                  "Adds a new target."                                                                                               "application,executable,debug"   }
  {RemoveTarget                   0            0            0           0               0                 Entity             Null               Null                     Target                      Entity               DF_EntityKind_Target                 0                                                Trash                 "remove_target"               "Remove Target"                               "Removes an existing target."                                                                                      "delete,remove,target"           }
  {EditTarget                     0            0            0           0               0                 Entity             Null               Null                     Target                      Entity               DF_EntityKind_Target                 0                                                Pencil                "edit_target"                 "Edit Target"                                 "Edits an existing target."                                                                                        ""                               }
  
  //- rjf: ended processes
  {RetryEndedProcess              1            0            0           0               0                 Entity             Null               Null                     EndedProcess                Entity               DF_EntityKind_EndedProcess           0                                                Null                  "retry_ended_process"         "Retry Ended Process"                         "Launches a new process with the same options as the passed ended process."                                        ""                               }
  
  //- rjf: attaching
  {Attach                         0            0            0           0               0                 String             Null               Null                     Null                        String               0                                    0                                                Null                  "attach"                      "Attach"                                      "Attaches to a process that is already running on the local machine."                                              ""                               }
  {RegisterAsJITDebugger          0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "register_as_jit_debugger"    "Register As Just-In-Time (JIT) Debugger"     "Registers the RAD debugger as the just-in-time (JIT) debugger used by the operating system."                      ""                               }
  
  //- rjf: catchall general entity activation paths (drag/drop, clicking)
  {EntityRefFastPath              1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "entity_ref_fast_path"        "Entity Reference Fast Path"                  "Activates the default behavior when clicking an entity reference."                                                ""                               }
  {SpawnEntityView                1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "spawn_entity_view"           "Spawn Entity View"                           "Spawns a new view, given an entity and other parameterizations."                                                  ""                               }
  {FindCodeLocation               0            0            0           0               0                 FilePath           TextPoint          Null                     Null                        FilePathAndTextPoint 0                                    0                                                FileOutline           "find_code_location"          "Find Code Location"                          "Finds a specific source code location given file, line, and column coordinates. Opens the file if necessary."     ""                               }
  
  //- rjf: view drivers
  {Commands                       0            0            0           0               0                 Null               Null               Null                     Null                        String               0                                    0                                                List                  "commands"                    "Commands"                                    "Opens the list of all commands."                                                                                  ""                               }
  {Target                         1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Target                "target_editor"               "Target"                                      "Opens the editor for a target."                                                                                   ""                               }
  {Targets                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Target                "targets"                     "Targets"                                     "Opens the list of all targets."                                                                                   ""                               }
  {FilePathMap                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                FileOutline           "file_path_map"               "File Path Map"                               "Opens the file path mapping editor."                                                                              ""                               }
  {Scheduler                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Scheduler             "scheduler"                   "Scheduler"                                   "Opens the scheduler view, for process and thread controls."                                                       ""                               }
  {CallStack                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Thread                "call_stack"                  "Call Stack"                                  "Opens the call stack view."                                                                                       "callstack,thread"               }
  {Modules                        0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Module                "modules"                     "Modules"                                     "Opens the modules view."                                                                                          ""                               }
  {PendingEntity                  1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                FileOutline           "pending_entity"              "Pending Entity"                              "Opens a view which waits for the passed entity to be completely loaded, then replaces itself with a new view."    ""                               }
  {Code                           1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                FileOutline           "code"                        "Code"                                        "Opens the code view for an already-loaded file."                                                                  ""                               }
  {Watch                          0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Binoculars            "watch"                       "Watch"                                       "Opens a watch view."                                                                                              ""                               }
  {Locals                         0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Binoculars            "locals"                      "Locals"                                      "Opens a locals view."                                                                                             ""                               }
  {Registers                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Binoculars            "registers"                   "Registers"                                   "Opens a registers view for the currently selected thread."                                                        ""                               }
  {Output                         0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                List                  "output"                      "Output"                                      "Opens an output view."                                                                                            ""                               }
  {Memory                         0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Grid                  "memory"                      "Memory"                                      "Opens a memory view."                                                                                             ""                               }
  {Disassembly                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Glasses               "disassembly"                 "Disassembly"                                 "Opens the disassembly view."                                                                                      "disasm"                         }
  {Breakpoints                    0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                CircleFilled          "breakpoints"                 "Breakpoints"                                 "Opens the breakpoints view."                                                                                      ""                               }
  {WatchPins                      0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Pin                   "watch_pins"                  "Watch Pins"                                  "Opens the watch pins view."                                                                                       ""                               }
  {ExceptionFilters               0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Gear                  "exception_filters"           "Exception Filters"                           "Opens the exception filters view."                                                                                "exceptions,filters"             }
  {Theme                          0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Palette               "theme"                       "Theme"                                       "Opens the theme view."                                                                                            "theme,color,scheme,palette"     }
  {PickFile                       1            0            0           1               0                 FilePath           Null               Null                     Null                        FilePath             0                                    0                                                FileOutline           "pick_file"                   "Pick File"                                   "Opens the file browser to pick a file."                                                                           ""                               }
  
  //- rjf: core pass-through view result commands
  {ViewReturn                     1            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "complete_view"               "Complete View"                               "Completes a view, passing all parameters to a new command matching the passed command spec."                      ""                               }
  
  //- rjf: developer commands
  {ToggleDevMenu                  0            0            0           0               0                 Null               Null               Null                     Null                        Null                 0                                    0                                                Null                  "toggle_dev_menu"             "Toggle Developer Menu"                       "Opens and closes the developer menu."                                                                             ""                               }
}

////////////////////////////////
//~ rjf: Built-In View Rules
//
// @view_rule_info
//
// NOTE(rjf): View rules are subtle in that they may impact any subset of the
// eval visualization pipeline. The "array" view rule, for example, functions
// by tweaking the type of an eval from `X *` to `X (*)[N]` (where N is
// computed from whatever expression is specified by the view rule). The "list"
// view rule, on the other hand, does not require any changes to the actual
// eval nor its type - instead, it follows an alternative path in constructing
// "viz blocks", and then constructing "viz rows" from those blocks. Compare
// these to the simpler 'dec', 'bin', or 'oct' rules, which simply tweak the
// radix used when stringizing numbers, which is something that only occurs in
// single-line eval stringization building.
//
// As such, each view rule specification has a mask, which determines which
// stages it may be used for. For a given view rule specification, if the bit
// corresponding to a particular eval stage is set, then that view rule spec-
// -ification also includes a hook which can be called from that stage.
//
// Below is a list of the stages in the eval visualization pipeline, as well as
// abbreviations which are used in the tables.
//
// eval resolution, "er" -> provides a chance for a view rule to impact an eval
//                          value or type, before the rest of the eval visual
//                          pipeline continues.
//
// viz block prod, "vb"  -> given a resolved eval, produce a list of non-
//                          windowed "viz blocks", which correspond to one or
//                          many contiguous rows in a watch-window-style UI.
//                          one level of expanded struct members, with no sub-
//                          expansions, would be one viz block. if one of those
//                          members - in the middle - were expanded too, then
//                          it would require three viz blocks - one for the
//                          members before the sub-expansion, one for the
//                          sub expansion members, and one for the members
//                          after, and so on. this is done recursively.
//
// viz row prod, "vr"    -> given a list of viz blocks, a windowed list of viz
//                          rows may be produced. each of these rows has info
//                          for building actual UI in e.g. a watch window -
//                          whether or not the row can be expanded, whether or
//                          not the row's value can be edited, what the edit-
//                          able string is for a row, what the display string
//                          is for a row, what the expression string is for a
//                          row, what the type is for a row, and so on.
//                          
// line stringize, "ls"  -> this is the stage used to produce display strings
//                          in the "viz row prod" stage, as well as basically
//                          any time UI needs to display the result of an eval
//                          in a single line. this also occurs recursively,
//                          descending into members & elements as needed,
//                          constrained by # of available pixels and font size
//                          and so on.
//
// row ui build, "ru"    -> finally, after the previous stages are completed,
//                          ui can finally be built according to all of the
//                          per-row information produced. this is the stage
//                          where view rules can insert their own arbitrary ui
//                          on a per-row basis.
//
// block ui build, "bu"  -> sometimes, view rules want to take over an entire
//                          viz block. while those viz blocks will still be
//                          used to size a collapsed region in terms of #-of-
//                          rows, this stage offers the ability to build a ui
//                          stretching over all of the rows.
//
// A few other bits are included for various ways in which a view rule may be
// applied throughout the eval visualization pipeline. A list follows:
//
// inherited, "ih"       -> is this view rule included, or not included, in
//                          child expansions?
//
// expandable, "ex"      -> does this view rule force the ability to expand
//                          an expression, even if traditional analysis of type
//                          info would not allow expansion?
//
// Not all of these stages are specified at this layer, however, since the
// "df_core" layer is for the non-graphical core debugger features. So the
// information pertaining to the eval visualization pipeline stages which
// do require graphical subsystems (e.g. UI, fonts, rendering) are specified
// in the "df_gfx" layer.
//
// For any view rules in this layer which also have graphical features, they
// are specified in both tables under the same name.

@table(name  name_lower  string          ih  ex  er  vb                display_name                  docs    description)
DF_CoreViewRuleTable:
{
  {Null       null        ""              -   -   -   -                 ""                            -       ""                                                                                                                                                                           }
  {Array      array       "array"         -   -   x   -                 "Array"                       x       "Specifies that a pointer points to N elements, rather than only 1."                                                                                                         }
  {List       list        "list"          -   -   -   x                 "List"                        x       "Specifies that some struct, union, or class forms the top of a linked list, and the member which points at the following element in the list."                              }
  {ByteSwap   bswap       "bswap"         x   -   x   -                 "Byte Swap"                   x       "Specifies that all integer primitives should be byte-swapped, such that their endianness is reversed."                                                                      }
  {BaseDec    base_dec    "dec"           x   -   -   -                 "Decimal Base (Base 10)"      x       "Specifies that all integral evaluations should appear in base-10 form."                                                                                                     }
  {BaseBin    base_bin    "bin"           x   -   -   -                 "Binary Base (Base 2)"        x       "Specifies that all integral evaluations should appear in base-2 form."                                                                                                      }
  {BaseOct    base_oct    "oct"           x   -   -   -                 "Octal Base (Base 8)"         x       "Specifies that all integral evaluations should appear in base-8 form."                                                                                                      }
  {BaseHex    base_hex    "hex"           x   -   -   -                 "Hexadecimal Base (Base 16)"  x       "Specifies that all integral evaluations should appear in base-16 form."                                                                                                     }
  {Only       only        "only"          x   -   -   x                 "Only Specified Members"      x       "Specifies that only the specified members should appear in struct, union, or class evaluations."                                                                            }
  {Omit       omit        "omit"          x   -   -   x                 "Omit Specified Members"      x       "Omits a list of member names from appearing in struct, union, or class evaluations."                                                                                        }
  {NoAddr     no_addr     "no_addr"       x   -   -   -                 "Disable Address Values"      x       "Displays only what pointers point to, if possible, without the pointer's address value."                                                                                    }
  {RGBA       rgba        "rgba"          -   x   -   x                 "Color (RGBA)"                x       "Displays as a color, interpreting the data as encoding R, G, B, and A values."                                                                                              }
  {Text       text        "text"          -   x   -   x                 "Text"                        x       "Displays as text."                                                                                                                                                          }
  {Disasm     disasm      "disasm"        -   x   -   x                 "Disassembly"                 x       "Displays as disassembled instructions, interpreting the data as raw machine code."                                                                                          }
  {Bitmap     bitmap      "bitmap"        -   x   -   x                 "Bitmap"                      x       "Displays as a bitmap, interpreting the data as raw pixel data."                                                                                                             }
  {Geo        geo         "geo"           -   x   -   x                 "Geometry"                    x       "Displays as geometry, interpreting the data as vertex data."                                                                                                                }
}

////////////////////////////////
//~ rjf: Icons (TODO(rjf): this needs to move to the df_gfx graphical layer)

@table(name, text)
DF_IconTable:
{
  (Null                     "")
  (FolderOpenOutline        "b")
  (FolderClosedOutline      "c")
  (FolderOpenFilled         "B")
  (FolderClosedFilled       "C")
  (FileOutline              "f")
  (FileFilled               "F")
  (Play                     "g")
  (PlayStepForward          "h")
  (Pause                    "r")
  (Stop                     "s")
  (Info                     "i")
  (WarningSmall             "w")
  (WarningBig               "W")
  (Unlocked                 "k")
  (Locked                   "K")
  (LeftArrow                "L")
  (RightArrow               "R")
  (UpArrow                  "U")
  (DownArrow                "D")
  (Gear                     "G")
  (Pencil                   "P")
  (Trash                    "3")
  (Pin                      "p")
  (RadioHollow              "O")
  (RadioFilled              "o")
  (CheckHollow              "!")
  (CheckFilled              "1")
  (LeftCaret                "<")
  (RightCaret               ">")
  (UpCaret                  "^")
  (DownCaret                "v")
  (UpScroll                 "9")
  (DownScroll               "0")
  (LeftScroll               "7")
  (RightScroll              "8")
  (Add                      "+")
  (Minus                    "-")
  (Thread                   "'")
  (Threads                  '\\"')
  (Machine                  "M")
  (CircleFilled             ".")
  (X                        "x")
  (Refresh                  "q")
  (Undo                     "j")
  (Redo                     "u")
  (Save                     "m")
  (Window                   "n")
  (Target                   "l")
  (Clipboard                "a")
  (Scheduler                "z")
  (Module                   "y")
  (XSplit                   "X")
  (YSplit                   "Y")
  (ClosePanel               "S")
  (StepInto                 "T")
  (StepOver                 "Z")
  (StepOut                  "d")
  (Find                     "N")
  (Palette                  "E")
  (Thumbnails               "H")
  (Glasses                  "e")
  (Binoculars               "I")
  (List                     "J")
  (Grid                     "A")
  (QuestionMark             "?")
  (Person                   "4")
  (Briefcase                "5")
  (Dot                      "c")
}

////////////////////////////////
//~ rjf: X64 Instruction Table

@table(name summary)
DF_InstTableX64:
{
  
  //- rjf: core
  {AAA                       "ASCII Adjust After Addition"                                                                                           }
  {AAD                       "ASCII Adjust AX Before Division"                                                                                       }
  {AAM                       "ASCII Adjust AX After Multiply"                                                                                        }
  {AAS                       "ASCII Adjust AL After Subtraction"                                                                                     }
  {ADC                       "Add with Carry"                                                                                                        }
  {ADCX                      "Unsigned Integer Addition of Two Operands with Carry Flag"                                                             }
  {ADD                       "Add"                                                                                                                   }
  {ADDPD                     "Add Packed Double-Precision Floating-Point Values"                                                                     }
  {ADDPS                     "Add Packed Single-Precision Floating-Point Values"                                                                     }
  {ADDSD                     "Add Scalar Double-Precision Floating-Point Values"                                                                     }
  {ADDSS                     "Add Scalar Single-Precision Floating-Point Values"                                                                     }
  {ADDSUBPD                  "Packed Double-FP Add/Subtract"                                                                                         }
  {ADDSUBPS                  "Packed Single-FP Add/Subtract"                                                                                         }
  {ADOX                      "Unsigned Integer Addition of Two Operands with Overflow Flag"                                                          }
  {AESDEC                    "Perform One Round of an AES Decryption Flow"                                                                           }
  {AESDEC128KL               "Perform Ten Rounds of AES Decryption Flow with Key Locker Using 128-Bit Key"                                           }
  {AESDEC256KL               "Perform 14 Rounds of AES Decryption Flow with Key Locker Using 256-Bit Key"                                            }
  {AESDECLAST                "Perform Last Round of an AES Decryption Flow"                                                                          }
  {AESDECWIDE128KL           "Perform Ten Rounds of AES Decryption Flow with Key Locker on 8 Blocks Using 128-Bit Key"                               }
  {AESDECWIDE256KL           "Perform 14 Rounds of AES Decryption Flow with Key Locker on 8 Blocks Using 256-Bit Key"                                }
  {AESENC                    "Perform One Round of an AES Encryption Flow"                                                                           }
  {AESENC128KL               "Perform Ten Rounds of AES Encryption Flow with Key Locker Using 128-Bit Key"                                           }
  {AESENC256KL               "Perform 14 Rounds of AES Encryption Flow with Key Locker Using 256-Bit Key"                                            }
  {AESENCLAST                "Perform Last Round of an AES Encryption Flow"                                                                          }
  {AESENCWIDE128KL           "Perform Ten Rounds of AES Encryption Flow with Key Locker on 8 Blocks Using 128-Bit Key"                               }
  {AESENCWIDE256KL           "Perform 14 Rounds of AES Encryption Flow with Key Locker on 8 Blocks Using 256-Bit Key"                                }
  {AESIMC                    "Perform the AES InvMixColumn Transformation"                                                                           }
  {AESKEYGENASSIST           "AES Round Key Generation Assist"                                                                                       }
  {AND                       "Logical AND"                                                                                                           }
  {ANDN                      "Logical AND NOT"                                                                                                       }
  {ANDNPD                    "Bitwise Logical AND NOT of Packed Double Precision Floating-Point Values"                                              }
  {ANDNPS                    "Bitwise Logical AND NOT of Packed Single Precision Floating-Point Values"                                              }
  {ANDPD                     "Bitwise Logical AND of Packed Double Precision Floating-Point Values"                                                  }
  {ANDPS                     "Bitwise Logical AND of Packed Single Precision Floating-Point Values"                                                  }
  {ARPL                      "Adjust RPL Field of Segment Selector"                                                                                  }
  {BEXTR                     "Bit Field Extract"                                                                                                     }
  {BLENDPD                   "Blend Packed Double Precision Floating-Point Values"                                                                   }
  {BLENDPS                   "Blend Packed Single Precision Floating-Point Values"                                                                   }
  {BLENDVPD                  "Variable Blend Packed Double Precision Floating-Point Values"                                                          }
  {BLENDVPS                  "Variable Blend Packed Single Precision Floating-Point Values"                                                          }
  {BLSI                      "Extract Lowest Set Isolated Bit"                                                                                       }
  {BLSMSK                    "Get Mask Up to Lowest Set Bit"                                                                                         }
  {BLSR                      "Reset Lowest Set Bit"                                                                                                  }
  {BNDCL                     "Check Lower Bound"                                                                                                     }
  {BNDCN                     "Check Upper Bound"                                                                                                     }
  {BNDCU                     "Check Upper Bound"                                                                                                     }
  {BNDLDX                    "Load Extended Bounds Using Address Translation"                                                                        }
  {BNDMK                     "Make Bounds"                                                                                                           }
  {BNDMOV                    "Move Bounds"                                                                                                           }
  {BNDSTX                    "Store Extended Bounds Using Address Translation"                                                                       }
  {BOUND                     "Check Array Index Against Bounds"                                                                                      }
  {BSF                       "Bit Scan Forward"                                                                                                      }
  {BSR                       "Bit Scan Reverse"                                                                                                      }
  {BSWAP                     "Byte Swap"                                                                                                             }
  {BT                        "Bit Test"                                                                                                              }
  {BTC                       "Bit Test and Complement"                                                                                               }
  {BTR                       "Bit Test and Reset"                                                                                                    }
  {BTS                       "Bit Test and Set"                                                                                                      }
  {BZHI                      "Zero High Bits Starting with Specified Bit Position"                                                                   }
  {CALL                      "Call Procedure"                                                                                                        }
  {CBW                       "Convert Byte to Word/Convert Word to Doubleword/Convert Doubleword to Quadword"                                        }
  {CDQ                       "Convert Word to Doubleword/Convert Doubleword to Quadword"                                                             }
  {CDQE                      "Convert Byte to Word/Convert Word to Doubleword/Convert Doubleword to Quadword"                                        }
  {CLAC                      "Clear AC Flag in EFLAGS Register"                                                                                      }
  {CLC                       "Clear Carry Flag"                                                                                                      }
  {CLD                       "Clear Direction Flag"                                                                                                  }
  {CLDEMOTE                  "Cache Line Demote"                                                                                                     }
  {CLFLUSH                   "Flush Cache Line"                                                                                                      }
  {CLFLUSHOPT                "Flush Cache Line Optimized"                                                                                            }
  {CLI                       "Clear Interrupt Flag"                                                                                                  }
  {CLRSSBSY                  "Clear Busy Flag in a Supervisor Shadow Stack Token"                                                                    }
  {CLTS                      "Clear Task-Switched Flag in CR0"                                                                                       }
  {CLWB                      "Cache Line Write Back"                                                                                                 }
  {CMC                       "Complement Carry Flag"                                                                                                 }
  {CMOVcc                    "Conditional Move"                                                                                                      }
  {CMP                       "Compare Two Operands"                                                                                                  }
  {CMPPD                     "Compare Packed Double-Precision Floating-Point Values"                                                                 }
  {CMPPS                     "Compare Packed Single-Precision Floating-Point Values"                                                                 }
  {CMPS                      "Compare String Operands"                                                                                               }
  {CMPSB                     "Compare String Operands"                                                                                               }
  {CMPSD                     "Compare String Operands"                                                                                               }
  {CMPSQ                     "Compare String Operands"                                                                                               }
  {CMPSS                     "Compare Scalar Single-Precision Floating-Point Value"                                                                  }
  {CMPSW                     "Compare String Operands"                                                                                               }
  {CMPXCHG                   "Compare and Exchange"                                                                                                  }
  {CMPXCHG16B                "Compare and Exchange Bytes"                                                                                            }
  {CMPXCHG8B                 "Compare and Exchange Bytes"                                                                                            }
  {COMISD                    "Compare Scalar Ordered Double-Precision Floating-Point Values and Set EFLAGS"                                          }
  {COMISS                    "Compare Scalar Ordered Single-Precision Floating-Point Values and Set EFLAGS"                                          }
  {CPUID                     "CPU Identification"                                                                                                    }
  {CQO                       "Convert Word to Doubleword/Convert Doubleword to Quadword"                                                             }
  {CRC32                     "Accumulate CRC32 Value"                                                                                                }
  {CVTDQ2PD                  "Convert Packed Doubleword Integers to Packed Double-Precision Floating-Point Values"                                   }
  {CVTDQ2PS                  "Convert Packed Doubleword Integers to Packed Single-Precision Floating-Point Values"                                   }
  {CVTPD2DQ                  "Convert Packed Double-Precision Floating-Point Values to Packed Doubleword Integers"                                   }
  {CVTPD2PI                  "Convert Packed Double-Precision FP Values to Packed Dword Integers"                                                    }
  {CVTPD2PS                  "Convert Packed Double-Precision Floating-Point Values to Packed Single-Precision Floating-Point Values"                }
  {CVTPI2PD                  "Convert Packed Dword Integers to Packed Double-Precision FP Values"                                                    }
  {CVTPI2PS                  "Convert Packed Dword Integers to Packed Single-Precision FP Values"                                                    }
  {CVTPS2DQ                  "Convert Packed Single-Precision Floating-Point Values to Packed Signed Doubleword Integer Values"                      }
  {CVTPS2PD                  "Convert Packed Single-Precision Floating-Point Values to Packed Double-Precision Floating-Point Values"                }
  {CVTPS2PI                  "Convert Packed Single-Precision FP Values to Packed Dword Integers"                                                    }
  {CVTSD2SI                  "Convert Scalar Double-Precision Floating-Point Value to Doubleword Integer"                                            }
  {CVTSD2SS                  "Convert Scalar Double-Precision Floating-Point Value to Scalar Single-Precision Floating-Point Value"                  }
  {CVTSI2SD                  "Convert Doubleword Integer to Scalar Double-Precision Floating-Point Value"                                            }
  {CVTSI2SS                  "Convert Doubleword Integer to Scalar Single-Precision Floating-Point Value"                                            }
  {CVTSS2SD                  "Convert Scalar Single-Precision Floating-Point Value to Scalar Double-Precision Floating-Point Value"                  }
  {CVTSS2SI                  "Convert Scalar Single-Precision Floating-Point Value to Doubleword Integer"                                            }
  {CVTTPD2DQ                 "Convert with Truncation Packed Double-Precision Floating-Point Values to Packed Doubleword Integers"                   }
  {CVTTPD2PI                 "Convert with Truncation Packed Double-Precision FP Values to Packed Dword Integers"                                    }
  {CVTTPS2DQ                 "Convert with Truncation Packed Single-Precision Floating-Point Values to Packed Signed Doubleword Integer Values"      }
  {CVTTPS2PI                 "Convert with Truncation Packed Single-Precision FP Values to Packed Dword Integers"                                    }
  {CVTTSD2SI                 "Convert with Truncation Scalar Double-Precision Floating-Point Value to Signed Integer"                                }
  {CVTTSS2SI                 "Convert with Truncation Scalar Single-Precision Floating-Point Value to Integer"                                       }
  {CWD                       "Convert Word to Doubleword/Convert Doubleword to Quadword"                                                             }
  {CWDE                      "Convert Byte to Word/Convert Word to Doubleword/Convert Doubleword to Quadword"                                        }
  {DAA                       "Decimal Adjust AL after Addition"                                                                                      }
  {DAS                       "Decimal Adjust AL after Subtraction"                                                                                   }
  {DEC                       "Decrement by 1"                                                                                                        }
  {DIV                       "Unsigned Divide"                                                                                                       }
  {DIVPD                     "Divide Packed Double-Precision Floating-Point Values"                                                                  }
  {DIVPS                     "Divide Packed Single-Precision Floating-Point Values"                                                                  }
  {DIVSD                     "Divide Scalar Double-Precision Floating-Point Value"                                                                   }
  {DIVSS                     "Divide Scalar Single-Precision Floating-Point Values"                                                                  }
  {DPPD                      "Dot Product of Packed Double Precision Floating-Point Values"                                                          }
  {DPPS                      "Dot Product of Packed Single Precision Floating-Point Values"                                                          }
  {EMMS                      "Empty MMX Technology State"                                                                                            }
  {ENCODEKEY128              "Encode 128-Bit Key with Key Locker"                                                                                    }
  {ENCODEKEY256              "Encode 256-Bit Key with Key Locker"                                                                                    }
  {ENDBR32                   "Terminate an Indirect Branch in 32-bit and Compatibility Mode"                                                         }
  {ENDBR64                   "Terminate an Indirect Branch in 64-bit Mode"                                                                           }
  {ENTER                     "Make Stack Frame for Procedure Parameters"                                                                             }
  {EXTRACTPS                 "Extract Packed Floating-Point Values"                                                                                  }
  {F2XM1                     "Compute 2x–1"                                                                                                          }
  {FABS                      "Absolute Value"                                                                                                        }
  {FADD                      "Add"                                                                                                                   }
  {FADDP                     "Add"                                                                                                                   }
  {FBLD                      "Load Binary Coded Decimal"                                                                                             }
  {FBSTP                     "Store BCD Integer and Pop"                                                                                             }
  {FCHS                      "Change Sign"                                                                                                           }
  {FCLEX                     "Clear Exceptions"                                                                                                      }
  {FCMOVcc                   "Floating-Point Conditional Move"                                                                                       }
  {FCOM                      "Compare Floating Point Values"                                                                                         }
  {FCOMI                     "Compare Floating Point Values and Set EFLAGS"                                                                          }
  {FCOMIP                    "Compare Floating Point Values and Set EFLAGS"                                                                          }
  {FCOMP                     "Compare Floating Point Values"                                                                                         }
  {FCOMPP                    "Compare Floating Point Values"                                                                                         }
  {FCOS                      "Cosine"                                                                                                                }
  {FDECSTP                   "Decrement Stack-Top Pointer"                                                                                           }
  {FDIV                      "Divide"                                                                                                                }
  {FDIVP                     "Divide"                                                                                                                }
  {FDIVR                     "Reverse Divide"                                                                                                        }
  {FDIVRP                    "Reverse Divide"                                                                                                        }
  {FFREE                     "Free Floating-Point Register"                                                                                          }
  {FIADD                     "Add"                                                                                                                   }
  {FICOM                     "Compare Integer"                                                                                                       }
  {FICOMP                    "Compare Integer"                                                                                                       }
  {FIDIV                     "Divide"                                                                                                                }
  {FIDIVR                    "Reverse Divide"                                                                                                        }
  {FILD                      "Load Integer"                                                                                                          }
  {FIMUL                     "Multiply"                                                                                                              }
  {FINCSTP                   "Increment Stack-Top Pointer"                                                                                           }
  {FINIT                     "Initialize Floating-Point Unit"                                                                                        }
  {FIST                      "Store Integer"                                                                                                         }
  {FISTP                     "Store Integer"                                                                                                         }
  {FISTTP                    "Store Integer with Truncation"                                                                                         }
  {FISUB                     "Subtract"                                                                                                              }
  {FISUBR                    "Reverse Subtract"                                                                                                      }
  {FLD                       "Load Floating Point Value"                                                                                             }
  {FLD1                      "Load Constant"                                                                                                         }
  {FLDCW                     "Load x87 FPU Control Word"                                                                                             }
  {FLDENV                    "Load x87 FPU Environment"                                                                                              }
  {FLDL2E                    "Load Constant"                                                                                                         }
  {FLDL2T                    "Load Constant"                                                                                                         }
  {FLDLG2                    "Load Constant"                                                                                                         }
  {FLDLN2                    "Load Constant"                                                                                                         }
  {FLDPI                     "Load Constant"                                                                                                         }
  {FLDZ                      "Load Constant"                                                                                                         }
  {FMUL                      "Multiply"                                                                                                              }
  {FMULP                     "Multiply"                                                                                                              }
  {FNCLEX                    "Clear Exceptions"                                                                                                      }
  {FNINIT                    "Initialize Floating-Point Unit"                                                                                        }
  {FNOP                      "No Operation"                                                                                                          }
  {FNSAVE                    "Store x87 FPU State"                                                                                                   }
  {FNSTCW                    "Store x87 FPU Control Word"                                                                                            }
  {FNSTENV                   "Store x87 FPU Environment"                                                                                             }
  {FNSTSW                    "Store x87 FPU Status Word"                                                                                             }
  {FPATAN                    "Partial Arctangent"                                                                                                    }
  {FPREM                     "Partial Remainder"                                                                                                     }
  {FPREM1                    "Partial Remainder"                                                                                                     }
  {FPTAN                     "Partial Tangent"                                                                                                       }
  {FRNDINT                   "Round to Integer"                                                                                                      }
  {FRSTOR                    "Restore x87 FPU State"                                                                                                 }
  {FSAVE                     "Store x87 FPU State"                                                                                                   }
  {FSCALE                    "Scale"                                                                                                                 }
  {FSIN                      "Sine"                                                                                                                  }
  {FSINCOS                   "Sine and Cosine"                                                                                                       }
  {FSQRT                     "Square Root"                                                                                                           }
  {FST                       "Store Floating Point Value"                                                                                            }
  {FSTCW                     "Store x87 FPU Control Word"                                                                                            }
  {FSTENV                    "Store x87 FPU Environment"                                                                                             }
  {FSTP                      "Store Floating Point Value"                                                                                            }
  {FSTSW                     "Store x87 FPU Status Word"                                                                                             }
  {FSUB                      "Subtract"                                                                                                              }
  {FSUBP                     "Subtract"                                                                                                              }
  {FSUBR                     "Reverse Subtract"                                                                                                      }
  {FSUBRP                    "Reverse Subtract"                                                                                                      }
  {FTST                      "TEST"                                                                                                                  }
  {FUCOM                     "Unordered Compare Floating Point Values"                                                                               }
  {FUCOMI                    "Compare Floating Point Values and Set EFLAGS"                                                                          }
  {FUCOMIP                   "Compare Floating Point Values and Set EFLAGS"                                                                          }
  {FUCOMP                    "Unordered Compare Floating Point Values"                                                                               }
  {FUCOMPP                   "Unordered Compare Floating Point Values"                                                                               }
  {FWAIT                     "Wait"                                                                                                                  }
  {FXAM                      "Examine Floating-Point"                                                                                                }
  {FXCH                      "Exchange Register Contents"                                                                                            }
  {FXRSTOR                   "Restore x87 FPU, MMX, XMM, and MXCSR State"                                                                            }
  {FXSAVE                    "Save x87 FPU, MMX Technology, and SSE State"                                                                           }
  {FXTRACT                   "Extract Exponent and Significand"                                                                                      }
  {FYL2X                     "Compute y * log2x"                                                                                                     }
  {FYL2XP1                   "Compute y * log2(x +1)"                                                                                                }
  {GF2P8AFFINEINVQB          "Galois Field Affine Transformation Inverse"                                                                            }
  {GF2P8AFFINEQB             "Galois Field Affine Transformation"                                                                                    }
  {GF2P8MULB                 "Galois Field Multiply Bytes"                                                                                           }
  {HADDPD                    "Packed Double-FP Horizontal Add"                                                                                       }
  {HADDPS                    "Packed Single-FP Horizontal Add"                                                                                       }
  {HLT                       "Halt"                                                                                                                  }
  {HRESET                    "History Reset"                                                                                                         }
  {HSUBPD                    "Packed Double-FP Horizontal Subtract"                                                                                  }
  {HSUBPS                    "Packed Single-FP Horizontal Subtract"                                                                                  }
  {IDIV                      "Signed Divide"                                                                                                         }
  {IMUL                      "Signed Multiply"                                                                                                       }
  {IN                        "Input from Port"                                                                                                       }
  {INC                       "Increment by 1"                                                                                                        }
  {INCSSPD                   "Increment Shadow Stack Pointer"                                                                                        }
  {INCSSPQ                   "Increment Shadow Stack Pointer"                                                                                        }
  {INS                       "Input from Port to String"                                                                                             }
  {INSB                      "Input from Port to String"                                                                                             }
  {INSD                      "Input from Port to String"                                                                                             }
  {INSERTPS                  "Insert Scalar Single-Precision Floating-Point Value"                                                                   }
  {INSW                      "Input from Port to String"                                                                                             }
  {INT                       "Call to Interrupt Procedure"                                                                                           }
  {INT1                      "Call to Interrupt Procedure"                                                                                           }
  {INT3                      "Call to Interrupt Procedure"                                                                                           }
  {INTO                      "Call to Interrupt Procedure"                                                                                           }
  {INVD                      "Invalidate Internal Caches"                                                                                            }
  {INVLPG                    "Invalidate TLB Entries"                                                                                                }
  {INVPCID                   "Invalidate Process-Context Identifier"                                                                                 }
  {IRET                      "Interrupt Return"                                                                                                      }
  {IRETD                     "Interrupt Return"                                                                                                      }
  {IRETQ                     "Interrupt Return"                                                                                                      }
  {JMP                       "Jump"                                                                                                                  }
  {Jcc                       "Jump if Condition Is Met"                                                                                              }
  {KADDB                     "ADD Two Masks"                                                                                                         }
  {KADDD                     "ADD Two Masks"                                                                                                         }
  {KADDQ                     "ADD Two Masks"                                                                                                         }
  {KADDW                     "ADD Two Masks"                                                                                                         }
  {KANDB                     "Bitwise Logical AND Masks"                                                                                             }
  {KANDD                     "Bitwise Logical AND Masks"                                                                                             }
  {KANDNB                    "Bitwise Logical AND NOT Masks"                                                                                         }
  {KANDND                    "Bitwise Logical AND NOT Masks"                                                                                         }
  {KANDNQ                    "Bitwise Logical AND NOT Masks"                                                                                         }
  {KANDNW                    "Bitwise Logical AND NOT Masks"                                                                                         }
  {KANDQ                     "Bitwise Logical AND Masks"                                                                                             }
  {KANDW                     "Bitwise Logical AND Masks"                                                                                             }
  {KMOVB                     "Move from and to Mask Registers"                                                                                       }
  {KMOVD                     "Move from and to Mask Registers"                                                                                       }
  {KMOVQ                     "Move from and to Mask Registers"                                                                                       }
  {KMOVW                     "Move from and to Mask Registers"                                                                                       }
  {KNOTB                     "NOT Mask Register"                                                                                                     }
  {KNOTD                     "NOT Mask Register"                                                                                                     }
  {KNOTQ                     "NOT Mask Register"                                                                                                     }
  {KNOTW                     "NOT Mask Register"                                                                                                     }
  {KORB                      "Bitwise Logical OR Masks"                                                                                              }
  {KORD                      "Bitwise Logical OR Masks"                                                                                              }
  {KORQ                      "Bitwise Logical OR Masks"                                                                                              }
  {KORTESTB                  "OR Masks And Set Flags"                                                                                                }
  {KORTESTD                  "OR Masks And Set Flags"                                                                                                }
  {KORTESTQ                  "OR Masks And Set Flags"                                                                                                }
  {KORTESTW                  "OR Masks And Set Flags"                                                                                                }
  {KORW                      "Bitwise Logical OR Masks"                                                                                              }
  {KSHIFTLB                  "Shift Left Mask Registers"                                                                                             }
  {KSHIFTLD                  "Shift Left Mask Registers"                                                                                             }
  {KSHIFTLQ                  "Shift Left Mask Registers"                                                                                             }
  {KSHIFTLW                  "Shift Left Mask Registers"                                                                                             }
  {KSHIFTRB                  "Shift Right Mask Registers"                                                                                            }
  {KSHIFTRD                  "Shift Right Mask Registers"                                                                                            }
  {KSHIFTRQ                  "Shift Right Mask Registers"                                                                                            }
  {KSHIFTRW                  "Shift Right Mask Registers"                                                                                            }
  {KTESTB                    "Packed Bit Test Masks and Set Flags"                                                                                   }
  {KTESTD                    "Packed Bit Test Masks and Set Flags"                                                                                   }
  {KTESTQ                    "Packed Bit Test Masks and Set Flags"                                                                                   }
  {KTESTW                    "Packed Bit Test Masks and Set Flags"                                                                                   }
  {KUNPCKBW                  "Unpack for Mask Registers"                                                                                             }
  {KUNPCKDQ                  "Unpack for Mask Registers"                                                                                             }
  {KUNPCKWD                  "Unpack for Mask Registers"                                                                                             }
  {KXNORB                    "Bitwise Logical XNOR Masks"                                                                                            }
  {KXNORD                    "Bitwise Logical XNOR Masks"                                                                                            }
  {KXNORQ                    "Bitwise Logical XNOR Masks"                                                                                            }
  {KXNORW                    "Bitwise Logical XNOR Masks"                                                                                            }
  {KXORB                     "Bitwise Logical XOR Masks"                                                                                             }
  {KXORD                     "Bitwise Logical XOR Masks"                                                                                             }
  {KXORQ                     "Bitwise Logical XOR Masks"                                                                                             }
  {KXORW                     "Bitwise Logical XOR Masks"                                                                                             }
  {LAHF                      "Load Status Flags into AH Register"                                                                                    }
  {LAR                       "Load Access Rights Byte"                                                                                               }
  {LDDQU                     "Load Unaligned Integer 128 Bits"                                                                                       }
  {LDMXCSR                   "Load MXCSR Register"                                                                                                   }
  {LDS                       "Load Far Pointer"                                                                                                      }
  {LEA                       "Load Effective Address"                                                                                                }
  {LEAVE                     "High Level Procedure Exit"                                                                                             }
  {LES                       "Load Far Pointer"                                                                                                      }
  {LFENCE                    "Load Fence"                                                                                                            }
  {LFS                       "Load Far Pointer"                                                                                                      }
  {LGDT                      "Load Global/Interrupt Descriptor Table Register"                                                                       }
  {LGS                       "Load Far Pointer"                                                                                                      }
  {LIDT                      "Load Global/Interrupt Descriptor Table Register"                                                                       }
  {LLDT                      "Load Local Descriptor Table Register"                                                                                  }
  {LMSW                      "Load Machine Status Word"                                                                                              }
  {LOADIWKEY                 "Load Internal Wrapping Key with Key Locker"                                                                            }
  {LOCK                      "Assert LOCK# Signal Prefix"                                                                                            }
  {LODS                      "Load String"                                                                                                           }
  {LODSB                     "Load String"                                                                                                           }
  {LODSD                     "Load String"                                                                                                           }
  {LODSQ                     "Load String"                                                                                                           }
  {LODSW                     "Load String"                                                                                                           }
  {LOOP                      "Loop According to ECX Counter"                                                                                         }
  {LOOPcc                    "Loop According to ECX Counter"                                                                                         }
  {LSL                       "Load Segment Limit"                                                                                                    }
  {LSS                       "Load Far Pointer"                                                                                                      }
  {LTR                       "Load Task Register"                                                                                                    }
  {LZCNT                     "Count the Number of Leading Zero Bits"                                                                                 }
  {MASKMOVDQU                "Store Selected Bytes of Double Quadword"                                                                               }
  {MASKMOVQ                  "Store Selected Bytes of Quadword"                                                                                      }
  {MAXPD                     "Maximum of Packed Double-Precision Floating-Point Values"                                                              }
  {MAXPS                     "Maximum of Packed Single-Precision Floating-Point Values"                                                              }
  {MAXSD                     "Return Maximum Scalar Double-Precision Floating-Point Value"                                                           }
  {MAXSS                     "Return Maximum Scalar Single-Precision Floating-Point Value"                                                           }
  {MFENCE                    "Memory Fence"                                                                                                          }
  {MINPD                     "Minimum of Packed Double-Precision Floating-Point Values"                                                              }
  {MINPS                     "Minimum of Packed Single-Precision Floating-Point Values"                                                              }
  {MINSD                     "Return Minimum Scalar Double-Precision Floating-Point Value"                                                           }
  {MINSS                     "Return Minimum Scalar Single-Precision Floating-Point Value"                                                           }
  {MONITOR                   "Set Up Monitor Address"                                                                                                }
  {MOV                       "Move"                                                                                                                  }
  {MOVAPD                    "Move Aligned Packed Double-Precision Floating-Point Values"                                                            }
  {MOVAPS                    "Move Aligned Packed Single-Precision Floating-Point Values"                                                            }
  {MOVBE                     "Move Data After Swapping Bytes"                                                                                        }
  {MOVD                      "Move Doubleword/Move Quadword"                                                                                         }
  {MOVDDUP                   "Replicate Double FP Values"                                                                                            }
  {MOVDIR64B                 "Move 64 Bytes as Direct Store"                                                                                         }
  {MOVDIRI                   "Move Doubleword as Direct Store"                                                                                       }
  {MOVDQ2Q                   "Move Quadword from XMM to MMX Technology Register"                                                                     }
  {MOVDQA                    "Move Aligned Packed Integer Values"                                                                                    }
  {MOVDQU                    "Move Unaligned Packed Integer Values"                                                                                  }
  {MOVHLPS                   "Move Packed Single-Precision Floating-Point Values High to Low"                                                        }
  {MOVHPD                    "Move High Packed Double-Precision Floating-Point Value"                                                                }
  {MOVHPS                    "Move High Packed Single-Precision Floating-Point Values"                                                               }
  {MOVLHPS                   "Move Packed Single-Precision Floating-Point Values Low to High"                                                        }
  {MOVLPD                    "Move Low Packed Double-Precision Floating-Point Value"                                                                 }
  {MOVLPS                    "Move Low Packed Single-Precision Floating-Point Values"                                                                }
  {MOVMSKPD                  "Extract Packed Double-Precision Floating-Point Sign Mask"                                                              }
  {MOVMSKPS                  "Extract Packed Single-Precision Floating-Point Sign Mask"                                                              }
  {MOVNTDQ                   "Store Packed Integers Using Non-Temporal Hint"                                                                         }
  {MOVNTDQA                  "Load Double Quadword Non-Temporal Aligned Hint"                                                                        }
  {MOVNTI                    "Store Doubleword Using Non-Temporal Hint"                                                                              }
  {MOVNTPD                   "Store Packed Double-Precision Floating-Point Values Using Non-Temporal Hint"                                           }
  {MOVNTPS                   "Store Packed Single-Precision Floating-Point Values Using Non-Temporal Hint"                                           }
  {MOVNTQ                    "Store of Quadword Using Non-Temporal Hint"                                                                             }
  {MOVQ                      "Move Doubleword/Move Quadword"                                                                                         }
  {MOVQ2DQ                   "Move Quadword from MMX Technology to XMM Register"                                                                     }
  {MOVS                      "Move Data from String to String"                                                                                       }
  {MOVSB                     "Move Data from String to String"                                                                                       }
  {MOVSD                     "Move Data from String to String"                                                                                       }
  {MOVSHDUP                  "Replicate Single FP Values"                                                                                            }
  {MOVSLDUP                  "Replicate Single FP Values"                                                                                            }
  {MOVSQ                     "Move Data from String to String"                                                                                       }
  {MOVSS                     "Move or Merge Scalar Single-Precision Floating-Point Value"                                                            }
  {MOVSW                     "Move Data from String to String"                                                                                       }
  {MOVSX                     "Move with Sign-Extension"                                                                                              }
  {MOVSXD                    "Move with Sign-Extension"                                                                                              }
  {MOVUPD                    "Move Unaligned Packed Double-Precision Floating-Point Values"                                                          }
  {MOVUPS                    "Move Unaligned Packed Single-Precision Floating-Point Values"                                                          }
  {MOVZX                     "Move with Zero-Extend"                                                                                                 }
  {MPSADBW                   "Compute Multiple Packed Sums of Absolute Difference"                                                                   }
  {MUL                       "Unsigned Multiply"                                                                                                     }
  {MULPD                     "Multiply Packed Double-Precision Floating-Point Values"                                                                }
  {MULPS                     "Multiply Packed Single-Precision Floating-Point Values"                                                                }
  {MULSD                     "Multiply Scalar Double-Precision Floating-Point Value"                                                                 }
  {MULSS                     "Multiply Scalar Single-Precision Floating-Point Values"                                                                }
  {MULX                      "Unsigned Multiply Without Affecting Flags"                                                                             }
  {MWAIT                     "Monitor Wait"                                                                                                          }
  {NEG                       "Two's Complement Negation"                                                                                             }
  {NOP                       "No Operation"                                                                                                          }
  {NOT                       "One's Complement Negation"                                                                                             }
  {OR                        "Logical Inclusive OR"                                                                                                  }
  {ORPD                      "Bitwise Logical OR of Packed Double Precision Floating-Point Values"                                                   }
  {ORPS                      "Bitwise Logical OR of Packed Single Precision Floating-Point Values"                                                   }
  {OUT                       "Output to Port"                                                                                                        }
  {OUTS                      "Output String to Port"                                                                                                 }
  {OUTSB                     "Output String to Port"                                                                                                 }
  {OUTSD                     "Output String to Port"                                                                                                 }
  {OUTSW                     "Output String to Port"                                                                                                 }
  {PABSB                     "Packed Absolute Value"                                                                                                 }
  {PABSD                     "Packed Absolute Value"                                                                                                 }
  {PABSQ                     "Packed Absolute Value"                                                                                                 }
  {PABSW                     "Packed Absolute Value"                                                                                                 }
  {PACKSSDW                  "Pack with Signed Saturation"                                                                                           }
  {PACKSSWB                  "Pack with Signed Saturation"                                                                                           }
  {PACKUSDW                  "Pack with Unsigned Saturation"                                                                                         }
  {PACKUSWB                  "Pack with Unsigned Saturation"                                                                                         }
  {PADDB                     "Add Packed Integers"                                                                                                   }
  {PADDD                     "Add Packed Integers"                                                                                                   }
  {PADDQ                     "Add Packed Integers"                                                                                                   }
  {PADDSB                    "Add Packed Signed Integers with Signed Saturation"                                                                     }
  {PADDSW                    "Add Packed Signed Integers with Signed Saturation"                                                                     }
  {PADDUSB                   "Add Packed Unsigned Integers with Unsigned Saturation"                                                                 }
  {PADDUSW                   "Add Packed Unsigned Integers with Unsigned Saturation"                                                                 }
  {PADDW                     "Add Packed Integers"                                                                                                   }
  {PALIGNR                   "Packed Align Right"                                                                                                    }
  {PAND                      "Logical AND"                                                                                                           }
  {PANDN                     "Logical AND NOT"                                                                                                       }
  {PAUSE                     "Spin Loop Hint"                                                                                                        }
  {PAVGB                     "Average Packed Integers"                                                                                               }
  {PAVGW                     "Average Packed Integers"                                                                                               }
  {PBLENDVB                  "Variable Blend Packed Bytes"                                                                                           }
  {PBLENDW                   "Blend Packed Words"                                                                                                    }
  {PCLMULQDQ                 "Carry-Less Multiplication Quadword"                                                                                    }
  {PCMPEQB                   "Compare Packed Data for Equal"                                                                                         }
  {PCMPEQD                   "Compare Packed Data for Equal"                                                                                         }
  {PCMPEQQ                   "Compare Packed Qword Data for Equal"                                                                                   }
  {PCMPEQW                   "Compare Packed Data for Equal"                                                                                         }
  {PCMPESTRI                 "Packed Compare Explicit Length Strings, Return Index"                                                                  }
  {PCMPESTRM                 "Packed Compare Explicit Length Strings, Return Mask"                                                                   }
  {PCMPGTB                   "Compare Packed Signed Integers for Greater Than"                                                                       }
  {PCMPGTD                   "Compare Packed Signed Integers for Greater Than"                                                                       }
  {PCMPGTQ                   "Compare Packed Data for Greater Than"                                                                                  }
  {PCMPGTW                   "Compare Packed Signed Integers for Greater Than"                                                                       }
  {PCMPISTRI                 "Packed Compare Implicit Length Strings, Return Index"                                                                  }
  {PCMPISTRM                 "Packed Compare Implicit Length Strings, Return Mask"                                                                   }
  {PCONFIG                   "Platform Configuration"                                                                                                }
  {PDEP                      "Parallel Bits Deposit"                                                                                                 }
  {PEXT                      "Parallel Bits Extract"                                                                                                 }
  {PEXTRB                    "Extract Byte/Dword/Qword"                                                                                              }
  {PEXTRD                    "Extract Byte/Dword/Qword"                                                                                              }
  {PEXTRQ                    "Extract Byte/Dword/Qword"                                                                                              }
  {PEXTRW                    "Extract Word"                                                                                                          }
  {PHADDD                    "Packed Horizontal Add"                                                                                                 }
  {PHADDSW                   "Packed Horizontal Add and Saturate"                                                                                    }
  {PHADDW                    "Packed Horizontal Add"                                                                                                 }
  {PHMINPOSUW                "Packed Horizontal Word Minimum"                                                                                        }
  {PHSUBD                    "Packed Horizontal Subtract"                                                                                            }
  {PHSUBSW                   "Packed Horizontal Subtract and Saturate"                                                                               }
  {PHSUBW                    "Packed Horizontal Subtract"                                                                                            }
  {PINSRB                    "Insert Byte/Dword/Qword"                                                                                               }
  {PINSRD                    "Insert Byte/Dword/Qword"                                                                                               }
  {PINSRQ                    "Insert Byte/Dword/Qword"                                                                                               }
  {PINSRW                    "Insert Word"                                                                                                           }
  {PMADDUBSW                 "Multiply and Add Packed Signed and Unsigned Bytes"                                                                     }
  {PMADDWD                   "Multiply and Add Packed Integers"                                                                                      }
  {PMAXSB                    "Maximum of Packed Signed Integers"                                                                                     }
  {PMAXSD                    "Maximum of Packed Signed Integers"                                                                                     }
  {PMAXSQ                    "Maximum of Packed Signed Integers"                                                                                     }
  {PMAXSW                    "Maximum of Packed Signed Integers"                                                                                     }
  {PMAXUB                    "Maximum of Packed Unsigned Integers"                                                                                   }
  {PMAXUD                    "Maximum of Packed Unsigned Integers"                                                                                   }
  {PMAXUQ                    "Maximum of Packed Unsigned Integers"                                                                                   }
  {PMAXUW                    "Maximum of Packed Unsigned Integers"                                                                                   }
  {PMINSB                    "Minimum of Packed Signed Integers"                                                                                     }
  {PMINSD                    "Minimum of Packed Signed Integers"                                                                                     }
  {PMINSQ                    "Minimum of Packed Signed Integers"                                                                                     }
  {PMINSW                    "Minimum of Packed Signed Integers"                                                                                     }
  {PMINUB                    "Minimum of Packed Unsigned Integers"                                                                                   }
  {PMINUD                    "Minimum of Packed Unsigned Integers"                                                                                   }
  {PMINUQ                    "Minimum of Packed Unsigned Integers"                                                                                   }
  {PMINUW                    "Minimum of Packed Unsigned Integers"                                                                                   }
  {PMOVMSKB                  "Move Byte Mask"                                                                                                        }
  {PMOVSX                    "Packed Move with Sign Extend"                                                                                          }
  {PMOVZX                    "Packed Move with Zero Extend"                                                                                          }
  {PMULDQ                    "Multiply Packed Doubleword Integers"                                                                                   }
  {PMULHRSW                  "Packed Multiply High with Round and Scale"                                                                             }
  {PMULHUW                   "Multiply Packed Unsigned Integers and Store High Result"                                                               }
  {PMULHW                    "Multiply Packed Signed Integers and Store High Result"                                                                 }
  {PMULLD                    "Multiply Packed Integers and Store Low Result"                                                                         }
  {PMULLQ                    "Multiply Packed Integers and Store Low Result"                                                                         }
  {PMULLW                    "Multiply Packed Signed Integers and Store Low Result"                                                                  }
  {PMULUDQ                   "Multiply Packed Unsigned Doubleword Integers"                                                                          }
  {POP                       "Pop a Value from the Stack"                                                                                            }
  {POPA                      "Pop All General-Purpose Registers"                                                                                     }
  {POPAD                     "Pop All General-Purpose Registers"                                                                                     }
  {POPCNT                    "Return the Count of Number of Bits Set to 1"                                                                           }
  {POPF                      "Pop Stack into EFLAGS Register"                                                                                        }
  {POPFD                     "Pop Stack into EFLAGS Register"                                                                                        }
  {POPFQ                     "Pop Stack into EFLAGS Register"                                                                                        }
  {POR                       "Bitwise Logical OR"                                                                                                    }
  {PREFETCHW                 "Prefetch Data into Caches in Anticipation of a Write"                                                                  }
  {PREFETCHh                 "Prefetch Data Into Caches"                                                                                             }
  {PSADBW                    "Compute Sum of Absolute Differences"                                                                                   }
  {PSHUFB                    "Packed Shuffle Bytes"                                                                                                  }
  {PSHUFD                    "Shuffle Packed Doublewords"                                                                                            }
  {PSHUFHW                   "Shuffle Packed High Words"                                                                                             }
  {PSHUFLW                   "Shuffle Packed Low Words"                                                                                              }
  {PSHUFW                    "Shuffle Packed Words"                                                                                                  }
  {PSIGNB                    "Packed SIGN"                                                                                                           }
  {PSIGND                    "Packed SIGN"                                                                                                           }
  {PSIGNW                    "Packed SIGN"                                                                                                           }
  {PSLLD                     "Shift Packed Data Left Logical"                                                                                        }
  {PSLLDQ                    "Shift Double Quadword Left Logical"                                                                                    }
  {PSLLQ                     "Shift Packed Data Left Logical"                                                                                        }
  {PSLLW                     "Shift Packed Data Left Logical"                                                                                        }
  {PSRAD                     "Shift Packed Data Right Arithmetic"                                                                                    }
  {PSRAQ                     "Shift Packed Data Right Arithmetic"                                                                                    }
  {PSRAW                     "Shift Packed Data Right Arithmetic"                                                                                    }
  {PSRLD                     "Shift Packed Data Right Logical"                                                                                       }
  {PSRLDQ                    "Shift Double Quadword Right Logical"                                                                                   }
  {PSRLQ                     "Shift Packed Data Right Logical"                                                                                       }
  {PSRLW                     "Shift Packed Data Right Logical"                                                                                       }
  {PSUBB                     "Subtract Packed Integers"                                                                                              }
  {PSUBD                     "Subtract Packed Integers"                                                                                              }
  {PSUBQ                     "Subtract Packed Quadword Integers"                                                                                     }
  {PSUBSB                    "Subtract Packed Signed Integers with Signed Saturation"                                                                }
  {PSUBSW                    "Subtract Packed Signed Integers with Signed Saturation"                                                                }
  {PSUBUSB                   "Subtract Packed Unsigned Integers with Unsigned Saturation"                                                            }
  {PSUBUSW                   "Subtract Packed Unsigned Integers with Unsigned Saturation"                                                            }
  {PSUBW                     "Subtract Packed Integers"                                                                                              }
  {PTEST                     "Logical Compare"                                                                                                       }
  {PTWRITE                   "Write Data to a Processor Trace Packet"                                                                                }
  {PUNPCKHBW                 "Unpack High Data"                                                                                                      }
  {PUNPCKHDQ                 "Unpack High Data"                                                                                                      }
  {PUNPCKHQDQ                "Unpack High Data"                                                                                                      }
  {PUNPCKHWD                 "Unpack High Data"                                                                                                      }
  {PUNPCKLBW                 "Unpack Low Data"                                                                                                       }
  {PUNPCKLDQ                 "Unpack Low Data"                                                                                                       }
  {PUNPCKLQDQ                "Unpack Low Data"                                                                                                       }
  {PUNPCKLWD                 "Unpack Low Data"                                                                                                       }
  {PUSH                      "Push Word, Doubleword or Quadword Onto the Stack"                                                                      }
  {PUSHA                     "Push All General-Purpose Registers"                                                                                    }
  {PUSHAD                    "Push All General-Purpose Registers"                                                                                    }
  {PUSHF                     "Push EFLAGS Register onto the Stack"                                                                                   }
  {PUSHFD                    "Push EFLAGS Register onto the Stack"                                                                                   }
  {PUSHFQ                    "Push EFLAGS Register onto the Stack"                                                                                   }
  {PXOR                      "Logical Exclusive OR"                                                                                                  }
  {RCL                       "Rotate"                                                                                                                }
  {RCPPS                     "Compute Reciprocals of Packed Single-Precision Floating-Point Values"                                                  }
  {RCPSS                     "Compute Reciprocal of Scalar Single-Precision Floating-Point Values"                                                   }
  {RCR                       "Rotate"                                                                                                                }
  {RDFSBASE                  "Read FS/GS Segment Base"                                                                                               }
  {RDGSBASE                  "Read FS/GS Segment Base"                                                                                               }
  {RDMSR                     "Read from Model Specific Register"                                                                                     }
  {RDPID                     "Read Processor ID"                                                                                                     }
  {RDPKRU                    "Read Protection Key Rights for User Pages"                                                                             }
  {RDPMC                     "Read Performance-Monitoring Counters"                                                                                  }
  {RDRAND                    "Read Random Number"                                                                                                    }
  {RDSEED                    "Read Random SEED"                                                                                                      }
  {RDSSPD                    "Read Shadow Stack Pointer"                                                                                             }
  {RDSSPQ                    "Read Shadow Stack Pointer"                                                                                             }
  {RDTSC                     "Read Time-Stamp Counter"                                                                                               }
  {RDTSCP                    "Read Time-Stamp Counter and Processor ID"                                                                              }
  {REP                       "Repeat String Operation Prefix"                                                                                        }
  {REPE                      "Repeat String Operation Prefix"                                                                                        }
  {REPNE                     "Repeat String Operation Prefix"                                                                                        }
  {REPNZ                     "Repeat String Operation Prefix"                                                                                        }
  {REPZ                      "Repeat String Operation Prefix"                                                                                        }
  {RET                       "Return from Procedure"                                                                                                 }
  {ROL                       "Rotate"                                                                                                                }
  {ROR                       "Rotate"                                                                                                                }
  {RORX                      "Rotate Right Logical Without Affecting Flags"                                                                          }
  {ROUNDPD                   "Round Packed Double Precision Floating-Point Values"                                                                   }
  {ROUNDPS                   "Round Packed Single Precision Floating-Point Values"                                                                   }
  {ROUNDSD                   "Round Scalar Double Precision Floating-Point Values"                                                                   }
  {ROUNDSS                   "Round Scalar Single Precision Floating-Point Values"                                                                   }
  {RSM                       "Resume from System Management Mode"                                                                                    }
  {RSQRTPS                   "Compute Reciprocals of Square Roots of Packed Single-Precision Floating-Point Values"                                  }
  {RSQRTSS                   "Compute Reciprocal of Square Root of Scalar Single-Precision Floating-Point Value"                                     }
  {RSTORSSP                  "Restore Saved Shadow Stack Pointer"                                                                                    }
  {SAHF                      "Store AH into Flags"                                                                                                   }
  {SAL                       "Shift"                                                                                                                 }
  {SAR                       "Shift"                                                                                                                 }
  {SARX                      "Shift Without Affecting Flags"                                                                                         }
  {SAVEPREVSSP               "Save Previous Shadow Stack Pointer"                                                                                    }
  {SBB                       "Integer Subtraction with Borrow"                                                                                       }
  {SCAS                      "Scan String"                                                                                                           }
  {SCASB                     "Scan String"                                                                                                           }
  {SCASD                     "Scan String"                                                                                                           }
  {SCASW                     "Scan String"                                                                                                           }
  {SERIALIZE                 "Serialize Instruction Execution"                                                                                       }
  {SETSSBSY                  "Mark Shadow Stack Busy"                                                                                                }
  {SETcc                     "Set Byte on Condition"                                                                                                 }
  {SFENCE                    "Store Fence"                                                                                                           }
  {SGDT                      "Store Global Descriptor Table Register"                                                                                }
  {SHA1MSG1                  "Perform an Intermediate Calculation for the Next Four SHA1 Message Dwords"                                             }
  {SHA1MSG2                  "Perform a Final Calculation for the Next Four SHA1 Message Dwords"                                                     }
  {SHA1NEXTE                 "Calculate SHA1 State Variable E after Four Rounds"                                                                     }
  {SHA1RNDS4                 "Perform Four Rounds of SHA1 Operation"                                                                                 }
  {SHA256MSG1                "Perform an Intermediate Calculation for the Next Four SHA256 Message Dwords"                                           }
  {SHA256MSG2                "Perform a Final Calculation for the Next Four SHA256 Message Dwords"                                                   }
  {SHA256RNDS2               "Perform Two Rounds of SHA256 Operation"                                                                                }
  {SHL                       "Shift"                                                                                                                 }
  {SHLD                      "Double Precision Shift Left"                                                                                           }
  {SHLX                      "Shift Without Affecting Flags"                                                                                         }
  {SHR                       "Shift"                                                                                                                 }
  {SHRD                      "Double Precision Shift Right"                                                                                          }
  {SHRX                      "Shift Without Affecting Flags"                                                                                         }
  {SHUFPD                    "Packed Interleave Shuffle of Pairs of Double-Precision Floating-Point Values"                                          }
  {SHUFPS                    "Packed Interleave Shuffle of Quadruplets of Single-Precision Floating-Point Values"                                    }
  {SIDT                      "Store Interrupt Descriptor Table Register"                                                                             }
  {SLDT                      "Store Local Descriptor Table Register"                                                                                 }
  {SMSW                      "Store Machine Status Word"                                                                                             }
  {SQRTPD                    "Square Root of Double-Precision Floating-Point Values"                                                                 }
  {SQRTPS                    "Square Root of Single-Precision Floating-Point Values"                                                                 }
  {SQRTSD                    "Compute Square Root of Scalar Double-Precision Floating-Point Value"                                                   }
  {SQRTSS                    "Compute Square Root of Scalar Single-Precision Value"                                                                  }
  {STAC                      "Set AC Flag in EFLAGS Register"                                                                                        }
  {STC                       "Set Carry Flag"                                                                                                        }
  {STD                       "Set Direction Flag"                                                                                                    }
  {STI                       "Set Interrupt Flag"                                                                                                    }
  {STMXCSR                   "Store MXCSR Register State"                                                                                            }
  {STOS                      "Store String"                                                                                                          }
  {STOSB                     "Store String"                                                                                                          }
  {STOSD                     "Store String"                                                                                                          }
  {STOSQ                     "Store String"                                                                                                          }
  {STOSW                     "Store String"                                                                                                          }
  {STR                       "Store Task Register"                                                                                                   }
  {SUB                       "Subtract"                                                                                                              }
  {SUBPD                     "Subtract Packed Double-Precision Floating-Point Values"                                                                }
  {SUBPS                     "Subtract Packed Single-Precision Floating-Point Values"                                                                }
  {SUBSD                     "Subtract Scalar Double-Precision Floating-Point Value"                                                                 }
  {SUBSS                     "Subtract Scalar Single-Precision Floating-Point Value"                                                                 }
  {SWAPGS                    "Swap GS Base Register"                                                                                                 }
  {SYSCALL                   "Fast System Call"                                                                                                      }
  {SYSENTER                  "Fast System Call"                                                                                                      }
  {SYSEXIT                   "Fast Return from Fast System Call"                                                                                     }
  {SYSRET                    "Return From Fast System Call"                                                                                          }
  {TEST                      "Logical Compare"                                                                                                       }
  {TPAUSE                    "Timed PAUSE"                                                                                                           }
  {TZCNT                     "Count the Number of Trailing Zero Bits"                                                                                }
  {UCOMISD                   "Unordered Compare Scalar Double-Precision Floating-Point Values and Set EFLAGS"                                        }
  {UCOMISS                   "Unordered Compare Scalar Single-Precision Floating-Point Values and Set EFLAGS"                                        }
  {UD                        "Undefined Instruction"                                                                                                 }
  {UMONITOR                  "User Level Set Up Monitor Address"                                                                                     }
  {UMWAIT                    "User Level Monitor Wait"                                                                                               }
  {UNPCKHPD                  "Unpack and Interleave High Packed Double-Precision Floating-Point Values"                                              }
  {UNPCKHPS                  "Unpack and Interleave High Packed Single-Precision Floating-Point Values"                                              }
  {UNPCKLPD                  "Unpack and Interleave Low Packed Double-Precision Floating-Point Values"                                               }
  {UNPCKLPS                  "Unpack and Interleave Low Packed Single-Precision Floating-Point Values"                                               }
  {VALIGND                   "Align Doubleword/Quadword Vectors"                                                                                     }
  {VALIGNQ                   "Align Doubleword/Quadword Vectors"                                                                                     }
  {VBLENDMPD                 "Blend Float64/Float32 Vectors Using an OpMask Control"                                                                 }
  {VBLENDMPS                 "Blend Float64/Float32 Vectors Using an OpMask Control"                                                                 }
  {VBROADCAST                "Load with Broadcast Floating-Point Data"                                                                               }
  {VCOMPRESSPD               "Store Sparse Packed Double-Precision Floating-Point Values into Dense Memory"                                          }
  {VCOMPRESSPS               "Store Sparse Packed Single-Precision Floating-Point Values into Dense Memory"                                          }
  {VCOMPRESSW                "Store Sparse Packed Byte/Word Integer Values into Dense Memory/Register"                                               }
  {VCVTNE2PS2BF16            "Convert Two Packed Single Data to One Packed BF16 Data"                                                                }
  {VCVTNEPS2BF16             "Convert Packed Single Data to Packed BF16 Data"                                                                        }
  {VCVTPD2QQ                 "Convert Packed Double-Precision Floating-Point Values to Packed Quadword Integers"                                     }
  {VCVTPD2UDQ                "Convert Packed Double-Precision Floating-Point Values to Packed Unsigned Doubleword Integers"                          }
  {VCVTPD2UQQ                "Convert Packed Double-Precision Floating-Point Values to Packed Unsigned Quadword Integers"                            }
  {VCVTPH2PS                 "Convert 16-bit FP values to Single-Precision FP values"                                                                }
  {VCVTPS2PH                 "Convert Single-Precision FP value to 16-bit FP value"                                                                  }
  {VCVTPS2QQ                 "Convert Packed Single Precision Floating-Point Values to Packed Signed Quadword Integer Values"                        }
  {VCVTPS2UDQ                "Convert Packed Single-Precision Floating-Point Values to Packed Unsigned Doubleword Integer Values"                    }
  {VCVTPS2UQQ                "Convert Packed Single Precision Floating-Point Values to Packed Unsigned Quadword Integer Values"                      }
  {VCVTQQ2PD                 "Convert Packed Quadword Integers to Packed Double-Precision Floating-Point Values"                                     }
  {VCVTQQ2PS                 "Convert Packed Quadword Integers to Packed Single-Precision Floating-Point Values"                                     }
  {VCVTSD2USI                "Convert Scalar Double-Precision Floating-Point Value to Unsigned Doubleword Integer"                                   }
  {VCVTSS2USI                "Convert Scalar Single-Precision Floating-Point Value to Unsigned Doubleword Integer"                                   }
  {VCVTTPD2QQ                "Convert with Truncation Packed Double-Precision Floating-Point Values to Packed Quadword Integers"                     }
  {VCVTTPD2UDQ               "Convert with Truncation Packed Double-Precision Floating-Point Values to Packed Unsigned Doubleword Integers"          }
  {VCVTTPD2UQQ               "Convert with Truncation Packed Double-Precision Floating-Point Values to Packed Unsigned Quadword Integers"            }
  {VCVTTPS2QQ                "Convert with Truncation Packed Single Precision Floating-Point Values to Packed Signed Quadword Integer Values"        }
  {VCVTTPS2UDQ               "Convert with Truncation Packed Single-Precision Floating-Point Values to Packed Unsigned Doubleword Integer Values"    }
  {VCVTTPS2UQQ               "Convert with Truncation Packed Single Precision Floating-Point Values to Packed Unsigned Quadword Integer Values"      }
  {VCVTTSD2USI               "Convert with Truncation Scalar Double-Precision Floating-Point Value to Unsigned Integer"                              }
  {VCVTTSS2USI               "Convert with Truncation Scalar Single-Precision Floating-Point Value to Unsigned Integer"                              }
  {VCVTUDQ2PD                "Convert Packed Unsigned Doubleword Integers to Packed Double-Precision Floating-Point Values"                          }
  {VCVTUDQ2PS                "Convert Packed Unsigned Doubleword Integers to Packed Single-Precision Floating-Point Values"                          }
  {VCVTUQQ2PD                "Convert Packed Unsigned Quadword Integers to Packed Double-Precision Floating-Point Values"                            }
  {VCVTUQQ2PS                "Convert Packed Unsigned Quadword Integers to Packed Single-Precision Floating-Point Values"                            }
  {VCVTUSI2SD                "Convert Unsigned Integer to Scalar Double-Precision Floating-Point Value"                                              }
  {VCVTUSI2SS                "Convert Unsigned Integer to Scalar Single-Precision Floating-Point Value"                                              }
  {VDBPSADBW                 "Double Block Packed Sum-Absolute-Differences (SAD) on Unsigned Bytes"                                                  }
  {VDPBF16PS                 "Dot Product of BF16 Pairs Accumulated into Packed Single Precision"                                                    }
  {VERR                      "Verify a Segment for Reading or Writing"                                                                               }
  {VERW                      "Verify a Segment for Reading or Writing"                                                                               }
  {VEXPANDPD                 "Load Sparse Packed Double-Precision Floating-Point Values from Dense Memory"                                           }
  {VEXPANDPS                 "Load Sparse Packed Single-Precision Floating-Point Values from Dense Memory"                                           }
  {VEXTRACTF128              "Extr act Packed Floating-Point Values"                                                                                 }
  {VEXTRACTF32x4             "Extr act Packed Floating-Point Values"                                                                                 }
  {VEXTRACTF32x8             "Extr act Packed Floating-Point Values"                                                                                 }
  {VEXTRACTF64x2             "Extr act Packed Floating-Point Values"                                                                                 }
  {VEXTRACTF64x4             "Extr act Packed Floating-Point Values"                                                                                 }
  {VEXTRACTI128              "Extract packed Integer Values"                                                                                         }
  {VEXTRACTI32x4             "Extract packed Integer Values"                                                                                         }
  {VEXTRACTI32x8             "Extract packed Integer Values"                                                                                         }
  {VEXTRACTI64x2             "Extract packed Integer Values"                                                                                         }
  {VEXTRACTI64x4             "Extract packed Integer Values"                                                                                         }
  {VFIXUPIMMPD               "Fix Up Special Packed Float64 Values"                                                                                  }
  {VFIXUPIMMPS               "Fix Up Special Packed Float32 Values"                                                                                  }
  {VFIXUPIMMSD               "Fix Up Special Scalar Float64 Value"                                                                                   }
  {VFIXUPIMMSS               "Fix Up Special Scalar Float32 Value"                                                                                   }
  {VFMADD132PD               "Fused Multiply-Add of Packed Double- Precision Floating-Point Values"                                                  }
  {VFMADD132PS               "Fused Multiply-Add of Packed Single- Precision Floating-Point Values"                                                  }
  {VFMADD132SD               "Fused Multiply-Add of Scalar Double- Precision Floating-Point Values"                                                  }
  {VFMADD132SS               "Fused Multiply-Add of Scalar Single-Precision Floating-Point Values"                                                   }
  {VFMADD213PD               "Fused Multiply-Add of Packed Double- Precision Floating-Point Values"                                                  }
  {VFMADD213PS               "Fused Multiply-Add of Packed Single- Precision Floating-Point Values"                                                  }
  {VFMADD213SD               "Fused Multiply-Add of Scalar Double- Precision Floating-Point Values"                                                  }
  {VFMADD213SS               "Fused Multiply-Add of Scalar Single-Precision Floating-Point Values"                                                   }
  {VFMADD231PD               "Fused Multiply-Add of Packed Double- Precision Floating-Point Values"                                                  }
  {VFMADD231PS               "Fused Multiply-Add of Packed Single- Precision Floating-Point Values"                                                  }
  {VFMADD231SD               "Fused Multiply-Add of Scalar Double- Precision Floating-Point Values"                                                  }
  {VFMADD231SS               "Fused Multiply-Add of Scalar Single-Precision Floating-Point Values"                                                   }
  {VFMADDSUB132PD            "Fused Multiply-Alternating Add/Subtract of Packed Double-Precision Floating-Point Values"                              }
  {VFMADDSUB132PS            "Fused Multiply-Alternating Add/Subtract of Packed Single-Precision Floating-Point Values"                              }
  {VFMADDSUB213PD            "Fused Multiply-Alternating Add/Subtract of Packed Double-Precision Floating-Point Values"                              }
  {VFMADDSUB213PS            "Fused Multiply-Alternating Add/Subtract of Packed Single-Precision Floating-Point Values"                              }
  {VFMADDSUB231PD            "Fused Multiply-Alternating Add/Subtract of Packed Double-Precision Floating-Point Values"                              }
  {VFMADDSUB231PS            "Fused Multiply-Alternating Add/Subtract of Packed Single-Precision Floating-Point Values"                              }
  {VFMSUB132PD               "Fused Multiply-Subtract of Packed Double- Precision Floating-Point Values"                                             }
  {VFMSUB132PS               "Fused Multiply-Subtract of Packed Single- Precision Floating-Point Values"                                             }
  {VFMSUB132SD               "Fused Multiply-Subtract of Scalar Double- Precision Floating-Point Values"                                             }
  {VFMSUB132SS               "Fused Multiply-Subtract of Scalar Single- Precision Floating-Point Values"                                             }
  {VFMSUB213PD               "Fused Multiply-Subtract of Packed Double- Precision Floating-Point Values"                                             }
  {VFMSUB213PS               "Fused Multiply-Subtract of Packed Single- Precision Floating-Point Values"                                             }
  {VFMSUB213SD               "Fused Multiply-Subtract of Scalar Double- Precision Floating-Point Values"                                             }
  {VFMSUB213SS               "Fused Multiply-Subtract of Scalar Single- Precision Floating-Point Values"                                             }
  {VFMSUB231PD               "Fused Multiply-Subtract of Packed Double- Precision Floating-Point Values"                                             }
  {VFMSUB231PS               "Fused Multiply-Subtract of Packed Single- Precision Floating-Point Values"                                             }
  {VFMSUB231SD               "Fused Multiply-Subtract of Scalar Double- Precision Floating-Point Values"                                             }
  {VFMSUB231SS               "Fused Multiply-Subtract of Scalar Single- Precision Floating-Point Values"                                             }
  {VFMSUBADD132PD            "Fused Multiply-Alternating Subtract/Add of Packed Double-Precision Floating-Point Values"                              }
  {VFMSUBADD132PS            "Fused Multiply-Alternating Subtract/Add of Packed Single-Precision Floating-Point Values"                              }
  {VFMSUBADD213PD            "Fused Multiply-Alternating Subtract/Add of Packed Double-Precision Floating-Point Values"                              }
  {VFMSUBADD213PS            "Fused Multiply-Alternating Subtract/Add of Packed Single-Precision Floating-Point Values"                              }
  {VFMSUBADD231PD            "Fused Multiply-Alternating Subtract/Add of Packed Double-Precision Floating-Point Values"                              }
  {VFMSUBADD231PS            "Fused Multiply-Alternating Subtract/Add of Packed Single-Precision Floating-Point Values"                              }
  {VFNMADD132PD              "Fused Negative Multiply-Add of Packed Double-Precision Floating-Point Values"                                          }
  {VFNMADD132PS              "Fused Negative Multiply-Add of Packed Single-Precision Floating-Point Values"                                          }
  {VFNMADD132SD              "Fused Negative Multiply-Add of Scalar Double-Precision Floating-Point Values"                                          }
  {VFNMADD132SS              "Fused Negative Multiply-Add of Scalar Single-Precision Floating-Point Values"                                          }
  {VFNMADD213PD              "Fused Negative Multiply-Add of Packed Double-Precision Floating-Point Values"                                          }
  {VFNMADD213PS              "Fused Negative Multiply-Add of Packed Single-Precision Floating-Point Values"                                          }
  {VFNMADD213SD              "Fused Negative Multiply-Add of Scalar Double-Precision Floating-Point Values"                                          }
  {VFNMADD213SS              "Fused Negative Multiply-Add of Scalar Single-Precision Floating-Point Values"                                          }
  {VFNMADD231PD              "Fused Negative Multiply-Add of Packed Double-Precision Floating-Point Values"                                          }
  {VFNMADD231PS              "Fused Negative Multiply-Add of Packed Single-Precision Floating-Point Values"                                          }
  {VFNMADD231SD              "Fused Negative Multiply-Add of Scalar Double-Precision Floating-Point Values"                                          }
  {VFNMADD231SS              "Fused Negative Multiply-Add of Scalar Single-Precision Floating-Point Values"                                          }
  {VFNMSUB132PD              "Fused Negative Multiply-Subtract of Packed Double-Precision Floating-Point Values"                                     }
  {VFNMSUB132PS              "Fused Negative Multiply-Subtract of Packed Single-Precision Floating-Point Values"                                     }
  {VFNMSUB132SD              "Fused Negative Multiply-Subtract of Scalar Double-Precision Floating-Point Values"                                     }
  {VFNMSUB132SS              "Fused Negative Multiply-Subtract of Scalar Single-Precision Floating-Point Values"                                     }
  {VFNMSUB213PD              "Fused Negative Multiply-Subtract of Packed Double-Precision Floating-Point Values"                                     }
  {VFNMSUB213PS              "Fused Negative Multiply-Subtract of Packed Single-Precision Floating-Point Values"                                     }
  {VFNMSUB213SD              "Fused Negative Multiply-Subtract of Scalar Double-Precision Floating-Point Values"                                     }
  {VFNMSUB213SS              "Fused Negative Multiply-Subtract of Scalar Single-Precision Floating-Point Values"                                     }
  {VFNMSUB231PD              "Fused Negative Multiply-Subtract of Packed Double-Precision Floating-Point Values"                                     }
  {VFNMSUB231PS              "Fused Negative Multiply-Subtract of Packed Single-Precision Floating-Point Values"                                     }
  {VFNMSUB231SD              "Fused Negative Multiply-Subtract of Scalar Double-Precision Floating-Point Values"                                     }
  {VFNMSUB231SS              "Fused Negative Multiply-Subtract of Scalar Single-Precision Floating-Point Values"                                     }
  {VFPCLASSPD                "Tests Types Of a Packed Float64 Values"                                                                                }
  {VFPCLASSPS                "Tests Types Of a Packed Float32 Values"                                                                                }
  {VFPCLASSSD                "Tests Types Of a Scalar Float64 Values"                                                                                }
  {VFPCLASSSS                "Tests Types Of a Scalar Float32 Values"                                                                                }
  {VGATHERDPD                "Gather Packed DP FP Values Using Signed Dword/Qword Indices"                                                           }
  {VGATHERDPS                "Gather Packed SP FP values Using Signed Dword/Qword Indices"                                                           }
  {VGATHERQPD                "Gather Packed DP FP Values Using Signed Dword/Qword Indices"                                                           }
  {VGATHERQPS                "Gather Packed SP FP values Using Signed Dword/Qword Indices"                                                           }
  {VGETEXPPD                 "Convert Exponents of Packed DP FP Values to DP FP Values"                                                              }
  {VGETEXPPS                 "Convert Exponents of Packed SP FP Values to SP FP Values"                                                              }
  {VGETEXPSD                 "Convert Exponents of Scalar DP FP Values to DP FP Value"                                                               }
  {VGETEXPSS                 "Convert Exponents of Scalar SP FP Values to SP FP Value"                                                               }
  {VGETMANTPD                "Extract Float64 Vector of Normalized Mantissas from Float64 Vector"                                                    }
  {VGETMANTPS                "Extract Float32 Vector of Normalized Mantissas from Float32 Vector"                                                    }
  {VGETMANTSD                "Extract Float64 of Normalized Mantissas from Float64 Scalar"                                                           }
  {VGETMANTSS                "Extract Float32 Vector of Normalized Mantissa from Float32 Vector"                                                     }
  {VINSERTF128               "Insert Packed Floating-Point Values"                                                                                   }
  {VINSERTF32x4              "Insert Packed Floating-Point Values"                                                                                   }
  {VINSERTF32x8              "Insert Packed Floating-Point Values"                                                                                   }
  {VINSERTF64x2              "Insert Packed Floating-Point Values"                                                                                   }
  {VINSERTF64x4              "Insert Packed Floating-Point Values"                                                                                   }
  {VINSERTI128               "Insert Packed Integer Values"                                                                                          }
  {VINSERTI32x4              "Insert Packed Integer Values"                                                                                          }
  {VINSERTI32x8              "Insert Packed Integer Values"                                                                                          }
  {VINSERTI64x2              "Insert Packed Integer Values"                                                                                          }
  {VINSERTI64x4              "Insert Packed Integer Values"                                                                                          }
  {VMASKMOV                  "Conditional SIMD Packed Loads and Stores"                                                                              }
  {VMOVDQA32                 "Move Aligned Packed Integer Values"                                                                                    }
  {VMOVDQA64                 "Move Aligned Packed Integer Values"                                                                                    }
  {VMOVDQU16                 "Move Unaligned Packed Integer Values"                                                                                  }
  {VMOVDQU32                 "Move Unaligned Packed Integer Values"                                                                                  }
  {VMOVDQU64                 "Move Unaligned Packed Integer Values"                                                                                  }
  {VMOVDQU8                  "Move Unaligned Packed Integer Values"                                                                                  }
  {VP2INTERSECTD             "Compute Intersection Between DWORDS/QUADWORDS to a Pair of Mask Registers"                                             }
  {VP2INTERSECTQ             "Compute Intersection Between DWORDS/QUADWORDS to a Pair of Mask Registers"                                             }
  {VPBLENDD                  "Blend Packed Dwords"                                                                                                   }
  {VPBLENDMB                 "Blend Byte/Word Vectors Using an Opmask Control"                                                                       }
  {VPBLENDMD                 "Blend Int32/Int64 Vectors Using an OpMask Control"                                                                     }
  {VPBLENDMQ                 "Blend Int32/Int64 Vectors Using an OpMask Control"                                                                     }
  {VPBLENDMW                 "Blend Byte/Word Vectors Using an Opmask Control"                                                                       }
  {VPBROADCAST               "Load Integer and Broadcast"                                                                                            }
  {VPBROADCASTB              "Load with Broadcast Integer Data from General Purpose Register"                                                        }
  {VPBROADCASTD              "Load with Broadcast Integer Data from General Purpose Register"                                                        }
  {VPBROADCASTM              "Broadcast Mask to Vector Register"                                                                                     }
  {VPBROADCASTQ              "Load with Broadcast Integer Data from General Purpose Register"                                                        }
  {VPBROADCASTW              "Load with Broadcast Integer Data from General Purpose Register"                                                        }
  {VPCMPB                    "Compare Packed Byte Values Into Mask"                                                                                  }
  {VPCMPD                    "Compare Packed Integer Values into Mask"                                                                               }
  {VPCMPQ                    "Compare Packed Integer Values into Mask"                                                                               }
  {VPCMPUB                   "Compare Packed Byte Values Into Mask"                                                                                  }
  {VPCMPUD                   "Compare Packed Integer Values into Mask"                                                                               }
  {VPCMPUQ                   "Compare Packed Integer Values into Mask"                                                                               }
  {VPCMPUW                   "Compare Packed Word Values Into Mask"                                                                                  }
  {VPCMPW                    "Compare Packed Word Values Into Mask"                                                                                  }
  {VPCOMPRESSB               "Store Sparse Packed Byte/Word Integer Values into Dense Memory/Register"                                               }
  {VPCOMPRESSD               "Store Sparse Packed Doubleword Integer Values into Dense Memory/Register"                                              }
  {VPCOMPRESSQ               "Store Sparse Packed Quadword Integer Values into Dense Memory/Register"                                                }
  {VPCONFLICTD               "Detect Conflicts Within a Vector of Packed Dword/Qword Values into Dense Memory/ Register"                             }
  {VPCONFLICTQ               "Detect Conflicts Within a Vector of Packed Dword/Qword Values into Dense Memory/ Register"                             }
  {VPDPBUSD                  "Multiply and Add Unsigned and Signed Bytes"                                                                            }
  {VPDPBUSDS                 "Multiply and Add Unsigned and Signed Bytes with Saturation"                                                            }
  {VPDPWSSD                  "Multiply and Add Signed Word Integers"                                                                                 }
  {VPDPWSSDS                 "Multiply and Add Signed Word Integers with Saturation"                                                                 }
  {VPERM2F128                "Permute Floating-Point Values"                                                                                         }
  {VPERM2I128                "Permute Integer Values"                                                                                                }
  {VPERMB                    "Permute Packed Bytes Elements"                                                                                         }
  {VPERMD                    "Permute Packed Doublewords/Words Elements"                                                                             }
  {VPERMI2B                  "Full Permute of Bytes from Two Tables Overwriting the Index"                                                           }
  {VPERMI2D                  "Full Permute From Two Tables Overwriting the Index"                                                                    }
  {VPERMI2PD                 "Full Permute From Two Tables Overwriting the Index"                                                                    }
  {VPERMI2PS                 "Full Permute From Two Tables Overwriting the Index"                                                                    }
  {VPERMI2Q                  "Full Permute From Two Tables Overwriting the Index"                                                                    }
  {VPERMI2W                  "Full Permute From Two Tables Overwriting the Index"                                                                    }
  {VPERMILPD                 "Permute In-Lane of Pairs of Double-Precision Floating-Point Values"                                                    }
  {VPERMILPS                 "Permute In-Lane of Quadruples of Single-Precision Floating-Point Values"                                               }
  {VPERMPD                   "Permute Double-Precision Floating-Point Elements"                                                                      }
  {VPERMPS                   "Permute Single-Precision Floating-Point Elements"                                                                      }
  {VPERMQ                    "Qwords Element Permutation"                                                                                            }
  {VPERMT2B                  "Full Permute of Bytes from Two Tables Overwriting a Table"                                                             }
  {VPERMT2D                  "Full Permute from Two Tables Overwriting one Table"                                                                    }
  {VPERMT2PD                 "Full Permute from Two Tables Overwriting one Table"                                                                    }
  {VPERMT2PS                 "Full Permute from Two Tables Overwriting one Table"                                                                    }
  {VPERMT2Q                  "Full Permute from Two Tables Overwriting one Table"                                                                    }
  {VPERMT2W                  "Full Permute from Two Tables Overwriting one Table"                                                                    }
  {VPERMW                    "Permute Packed Doublewords/Words Elements"                                                                             }
  {VPEXPANDB                 "Expand Byte/Word Values"                                                                                               }
  {VPEXPANDD                 "Load Sparse Packed Doubleword Integer Values from Dense Memory / Register"                                             }
  {VPEXPANDQ                 "Load Sparse Packed Quadword Integer Values from Dense Memory / Register"                                               }
  {VPEXPANDW                 "Expand Byte/Word Values"                                                                                               }
  {VPGATHERDD                "Gather Packed Dword Values Using Signed Dword/Qword Indices"                                                           }
  {VPGATHERDQ                "Gather Packed Dword, Packed Qword with Signed Dword Indices"                                                           }
  {VPGATHERQD                "Gather Packed Dword Values Using Signed Dword/Qword Indices"                                                           }
  {VPGATHERQQ                "Gather Packed Qword Values Using Signed Dword/Qword Indices"                                                           }
  {VPLZCNTD                  "Count the Number of Leading Zero Bits for Packed Dword, Packed Qword Values"                                           }
  {VPLZCNTQ                  "Count the Number of Leading Zero Bits for Packed Dword, Packed Qword Values"                                           }
  {VPMADD52HUQ               "Packed Multiply of Unsigned 52-bit Unsigned Integers and Add High 52-bit Products to 64-bit Accumulators"              }
  {VPMADD52LUQ               "Packed Multiply of Unsigned 52-bit Integers and Add the Low 52-bit Products to Qword Accumulators"                     }
  {VPMASKMOV                 "Conditional SIMD Integer Packed Loads and Stores"                                                                      }
  {VPMOVB2M                  "Convert a Vector Register to a Mask"                                                                                   }
  {VPMOVD2M                  "Convert a Vector Register to a Mask"                                                                                   }
  {VPMOVDB                   "Down Convert DWord to Byte"                                                                                            }
  {VPMOVDW                   "Down Convert DWord to Word"                                                                                            }
  {VPMOVM2B                  "Convert a Mask Register to a Vector Register"                                                                          }
  {VPMOVM2D                  "Convert a Mask Register to a Vector Register"                                                                          }
  {VPMOVM2Q                  "Convert a Mask Register to a Vector Register"                                                                          }
  {VPMOVM2W                  "Convert a Mask Register to a Vector Register"                                                                          }
  {VPMOVQ2M                  "Convert a Vector Register to a Mask"                                                                                   }
  {VPMOVQB                   "Down Convert QWord to Byte"                                                                                            }
  {VPMOVQD                   "Down Convert QWord to DWord"                                                                                           }
  {VPMOVQW                   "Down Convert QWord to Word"                                                                                            }
  {VPMOVSDB                  "Down Convert DWord to Byte"                                                                                            }
  {VPMOVSDW                  "Down Convert DWord to Word"                                                                                            }
  {VPMOVSQB                  "Down Convert QWord to Byte"                                                                                            }
  {VPMOVSQD                  "Down Convert QWord to DWord"                                                                                           }
  {VPMOVSQW                  "Down Convert QWord to Word"                                                                                            }
  {VPMOVSWB                  "Down Convert Word to Byte"                                                                                             }
  {VPMOVUSDB                 "Down Convert DWord to Byte"                                                                                            }
  {VPMOVUSDW                 "Down Convert DWord to Word"                                                                                            }
  {VPMOVUSQB                 "Down Convert QWord to Byte"                                                                                            }
  {VPMOVUSQD                 "Down Convert QWord to DWord"                                                                                           }
  {VPMOVUSQW                 "Down Convert QWord to Word"                                                                                            }
  {VPMOVUSWB                 "Down Convert Word to Byte"                                                                                             }
  {VPMOVW2M                  "Convert a Vector Register to a Mask"                                                                                   }
  {VPMOVWB                   "Down Convert Word to Byte"                                                                                             }
  {VPMULTISHIFTQB            "Select Packed Unaligned Bytes from Quadword Sources"                                                                   }
  {VPOPCNT                   "Return the Count of Number of Bits Set to 1 in BYTE/WORD/DWORD/QWORD"                                                  }
  {VPROLD                    "Bit Rotate Left"                                                                                                       }
  {VPROLQ                    "Bit Rotate Left"                                                                                                       }
  {VPROLVD                   "Bit Rotate Left"                                                                                                       }
  {VPROLVQ                   "Bit Rotate Left"                                                                                                       }
  {VPRORD                    "Bit Rotate Right"                                                                                                      }
  {VPRORQ                    "Bit Rotate Right"                                                                                                      }
  {VPRORVD                   "Bit Rotate Right"                                                                                                      }
  {VPRORVQ                   "Bit Rotate Right"                                                                                                      }
  {VPSCATTERDD               "Scatter Packed Dword, Packed Qword with Signed Dword, Signed Qword Indices"                                            }
  {VPSCATTERDQ               "Scatter Packed Dword, Packed Qword with Signed Dword, Signed Qword Indices"                                            }
  {VPSCATTERQD               "Scatter Packed Dword, Packed Qword with Signed Dword, Signed Qword Indices"                                            }
  {VPSCATTERQQ               "Scatter Packed Dword, Packed Qword with Signed Dword, Signed Qword Indices"                                            }
  {VPSHLD                    "Concatenate and Shift Packed Data Left Logical"                                                                        }
  {VPSHLDV                   "Concatenate and Variable Shift Packed Data Left Logical"                                                               }
  {VPSHRD                    "Concatenate and Shift Packed Data Right Logical"                                                                       }
  {VPSHRDV                   "Concatenate and Variable Shift Packed Data Right Logical"                                                              }
  {VPSHUFBITQMB              "Shuffle Bits from Quadword Elements Using Byte Indexes into Mask"                                                      }
  {VPSLLVD                   "Variable Bit Shift Left Logical"                                                                                       }
  {VPSLLVQ                   "Variable Bit Shift Left Logical"                                                                                       }
  {VPSLLVW                   "Variable Bit Shift Left Logical"                                                                                       }
  {VPSRAVD                   "Variable Bit Shift Right Arithmetic"                                                                                   }
  {VPSRAVQ                   "Variable Bit Shift Right Arithmetic"                                                                                   }
  {VPSRAVW                   "Variable Bit Shift Right Arithmetic"                                                                                   }
  {VPSRLVD                   "Variable Bit Shift Right Logical"                                                                                      }
  {VPSRLVQ                   "Variable Bit Shift Right Logical"                                                                                      }
  {VPSRLVW                   "Variable Bit Shift Right Logical"                                                                                      }
  {VPTERNLOGD                "Bitwise Ternary Logic"                                                                                                 }
  {VPTERNLOGQ                "Bitwise Ternary Logic"                                                                                                 }
  {VPTESTMB                  "Logical AND and Set Mask"                                                                                              }
  {VPTESTMD                  "Logical AND and Set Mask"                                                                                              }
  {VPTESTMQ                  "Logical AND and Set Mask"                                                                                              }
  {VPTESTMW                  "Logical AND and Set Mask"                                                                                              }
  {VPTESTNMB                 "Logical NAND and Set"                                                                                                  }
  {VPTESTNMD                 "Logical NAND and Set"                                                                                                  }
  {VPTESTNMQ                 "Logical NAND and Set"                                                                                                  }
  {VPTESTNMW                 "Logical NAND and Set"                                                                                                  }
  {VRANGEPD                  "Range Restriction Calculation For Packed Pairs of Float64 Values"                                                      }
  {VRANGEPS                  "Range Restriction Calculation For Packed Pairs of Float32 Values"                                                      }
  {VRANGESD                  "Range Restriction Calculation From a pair of Scalar Float64 Values"                                                    }
  {VRANGESS                  "Range Restriction Calculation From a Pair of Scalar Float32 Values"                                                    }
  {VRCP14PD                  "Compute Approximate Reciprocals of Packed Float64 Values"                                                              }
  {VRCP14PS                  "Compute Approximate Reciprocals of Packed Float32 Values"                                                              }
  {VRCP14SD                  "Compute Approximate Reciprocal of Scalar Float64 Value"                                                                }
  {VRCP14SS                  "Compute Approximate Reciprocal of Scalar Float32 Value"                                                                }
  {VREDUCEPD                 "Perform Reduction Transformation on Packed Float64 Values"                                                             }
  {VREDUCEPS                 "Perform Reduction Transformation on Packed Float32 Values"                                                             }
  {VREDUCESD                 "Perform a Reduction Transformation on a Scalar Float64 Value"                                                          }
  {VREDUCESS                 "Perform a Reduction Transformation on a Scalar Float32 Value"                                                          }
  {VRNDSCALEPD               "Round Packed Float64 Values To Include A Given Number Of Fraction Bits"                                                }
  {VRNDSCALEPS               "Round Packed Float32 Values To Include A Given Number Of Fraction Bits"                                                }
  {VRNDSCALESD               "Round Scalar Float64 Value To Include A Given Number Of Fraction Bits"                                                 }
  {VRNDSCALESS               "Round Scalar Float32 Value To Include A Given Number Of Fraction Bits"                                                 }
  {VRSQRT14PD                "Compute Approximate Reciprocals of Square Roots of Packed Float64 Values"                                              }
  {VRSQRT14PS                "Compute Approximate Reciprocals of Square Roots of Packed Float32 Values"                                              }
  {VRSQRT14SD                "Compute Approximate Reciprocal of Square Root of Scalar Float64 Value"                                                 }
  {VRSQRT14SS                "Compute Approximate Reciprocal of Square Root of Scalar Float32 Value"                                                 }
  {VSCALEFPD                 "Scale Packed Float64 Values With Float64 Values"                                                                       }
  {VSCALEFPS                 "Scale Packed Float32 Values With Float32 Values"                                                                       }
  {VSCALEFSD                 "Scale Scalar Float64 Values With Float64 Values"                                                                       }
  {VSCALEFSS                 "Scale Scalar Float32 Value With Float32 Value"                                                                         }
  {VSCATTERDPD               "Scatter Packed Single, Packed Double with Signed Dword and Qword Indices"                                              }
  {VSCATTERDPS               "Scatter Packed Single, Packed Double with Signed Dword and Qword Indices"                                              }
  {VSCATTERQPD               "Scatter Packed Single, Packed Double with Signed Dword and Qword Indices"                                              }
  {VSCATTERQPS               "Scatter Packed Single, Packed Double with Signed Dword and Qword Indices"                                              }
  {VSHUFF32x4                "Shuffle Packed Values at 128-bit Granularity"                                                                          }
  {VSHUFF64x2                "Shuffle Packed Values at 128-bit Granularity"                                                                          }
  {VSHUFI32x4                "Shuffle Packed Values at 128-bit Granularity"                                                                          }
  {VSHUFI64x2                "Shuffle Packed Values at 128-bit Granularity"                                                                          }
  {VTESTPD                   "Packed Bit Test"                                                                                                       }
  {VTESTPS                   "Packed Bit Test"                                                                                                       }
  {VZEROALL                  "Zero XMM, YMM and ZMM Registers"                                                                                       }
  {VZEROUPPER                "Zero Upper Bits of YMM and ZMM Registers"                                                                              }
  {WAIT                      "Wait"                                                                                                                  }
  {WBINVD                    "Write Back and Invalidate Cache"                                                                                       }
  {WBNOINVD                  "Write Back and Do Not Invalidate Cache"                                                                                }
  {WRFSBASE                  "Write FS/GS Segment Base"                                                                                              }
  {WRGSBASE                  "Write FS/GS Segment Base"                                                                                              }
  {WRMSR                     "Write to Model Specific Register"                                                                                      }
  {WRPKRU                    "Write Data to User Page Key Register"                                                                                  }
  {WRSSD                     "Write to Shadow Stack"                                                                                                 }
  {WRSSQ                     "Write to Shadow Stack"                                                                                                 }
  {WRUSSD                    "Write to User Shadow Stack"                                                                                            }
  {WRUSSQ                    "Write to User Shadow Stack"                                                                                            }
  {XABORT                    "Transactional Abort"                                                                                                   }
  {XACQUIRE                  "Hardware Lock Elision Prefix Hints"                                                                                    }
  {XADD                      "Exchange and Add"                                                                                                      }
  {XBEGIN                    "Transactional Begin"                                                                                                   }
  {XCHG                      "Exchange Register/Memory with Register"                                                                                }
  {XEND                      "Transactional End"                                                                                                     }
  {XGETBV                    "Get Value of Extended Control Register"                                                                                }
  {XLAT                      "Table Look-up Translation"                                                                                             }
  {XLATB                     "Table Look-up Translation"                                                                                             }
  {XOR                       "Logical Exclusive OR"                                                                                                  }
  {XORPD                     "Bitwise Logical XOR of Packed Double Precision Floating-Point Values"                                                  }
  {XORPS                     "Bitwise Logical XOR of Packed Single Precision Floating-Point Values"                                                  }
  {XRELEASE                  "Hardware Lock Elision Prefix Hints"                                                                                    }
  {XRSTOR                    "Restore Processor Extended States"                                                                                     }
  {XRSTORS                   "Restore Processor Extended States Supervisor"                                                                          }
  {XSAVE                     "Save Processor Extended States"                                                                                        }
  {XSAVEC                    "Save Processor Extended States with Compaction"                                                                        }
  {XSAVEOPT                  "Save Processor Extended States Optimized"                                                                              }
  {XSAVES                    "Save Processor Extended States Supervisor"                                                                             }
  {XSETBV                    "Set Extended Control Register"                                                                                         }
  {XTEST                     "Test If In Transactional Execution"                                                                                    }
  
  //- rjf: sgx
  {ENCLS                     "Execute an Enclave System Function of Specified Leaf Number"                                                           }
  {ENCLS                     "[EADD] Add a Page to an Uninitialized Enclave"                                                                         }
  {ENCLS                     "[EAUG] Add a Page to an Initialized Enclave"                                                                           }
  {ENCLS                     "[EBLOCK] Mark a page in EPC as Blocked"                                                                                }
  {ENCLS                     "[ECREATE] Create an SECS page in the Enclave Page Cache"                                                               }
  {ENCLS                     "[EDBGRD] Read From a Debug Enclave"                                                                                    }
  {ENCLS                     "[EDBGWR] Write to a Debug Enclave"                                                                                     }
  {ENCLS                     "[EEXTEND] Extend Uninitialized Enclave Measurement by 256 Bytes"                                                       }
  {ENCLS                     "[EINIT] Initialize an Enclave for Execution"                                                                           }
  {ENCLS                     "[ELDBC] Load an EPC Page and Mark its State"                                                                           }
  {ENCLS                     "[ELDB] Load an EPC Page and Mark its State"                                                                            }
  {ENCLS                     "[ELDUC] Load an EPC Page and Mark its State"                                                                           }
  {ENCLS                     "[ELDU] Load an EPC Page and Mark its State"                                                                            }
  {ENCLS                     "[EMODPR] Restrict the Permissions of an EPC Page"                                                                      }
  {ENCLS                     "[EMODT] Change the Type of an EPC Page"                                                                                }
  {ENCLS                     "[EPA] Add Version Array"                                                                                               }
  {ENCLS                     "[ERDINFO] Read Type and Status Information About an EPC Page"                                                          }
  {ENCLS                     "[EREMOVE] Remove a page from the EPC"                                                                                  }
  {ENCLS                     "[ETRACKC] Activates EBLOCK Checks"                                                                                     }
  {ENCLS                     "[ETRACK] Activates EBLOCK Checks"                                                                                      }
  {ENCLS                     "[EWB] Invalidate an EPC Page and Write out to Main Memory"                                                             }
  {ENCLU                     "Execute an Enclave User Function of Specified Leaf Number"                                                             }
  {ENCLU                     "[EACCEPTCOPY] Initialize a Pending Page"                                                                               }
  {ENCLU                     "[EACCEPT] Accept Changes to an EPC Page"                                                                               }
  {ENCLU                     "[EENTER] Enters an Enclave"                                                                                            }
  {ENCLU                     "[EEXIT] Exits an Enclave"                                                                                              }
  {ENCLU                     "[EGETKEY] Retrieves a Cryptographic Key"                                                                               }
  {ENCLU                     "[EMODPE] Extend an EPC Page Permissions"                                                                               }
  {ENCLU                     "[EREPORT] Create a Cryptographic Report of the Enclave"                                                                }
  {ENCLU                     "[ERESUME] Re-Enters an Enclave"                                                                                        }
  {ENCLV                     "Execute an Enclave VMM Function of Specified Leaf Number"                                                              }
  
  //- rjf: vmx
  {INVEPT                    "Invalidate Translations Derived from EPT"                                                                              }
  {INVVPID                   "Invalidate Translations Based on VPID"                                                                                 }
  {VMCALL                    "Call to VM Monitor"                                                                                                    }
  {VMCLEAR                   "Clear Virtual-Machine Control Structure"                                                                               }
  {VMFUNC                    "Invoke VM function"                                                                                                    }
  {VMLAUNCH                  "Launch/Resume Virtual Machine"                                                                                         }
  {VMPTRLD                   "Load Pointer to Virtual-Machine Control Structure"                                                                     }
  {VMPTRST                   "Store Pointer to Virtual-Machine Control Structure"                                                                    }
  {VMREAD                    "Read Field from Virtual-Machine Control Structure"                                                                     }
  {VMRESUME                  "Launch/Resume Virtual Machine"                                                                                         }
  {VMWRITE                   "Write Field to Virtual-Machine Control Structure"                                                                      }
  {VMXOFF                    "Leave VMX Operation"                                                                                                   }
  {VMXON                     "Enter VMX Operation"                                                                                                   }
  
  //- rjf: xeon phi
  {PREFETCHWT1               "Prefetch Vector Data Into Caches with Intent to Write and T1 Hint"                                                     }
  {V4FMADDPS                 "Packed Single-Precision Floating-Point Fused Multiply-Add (4-iterations)"                                              }
  {V4FMADDSS                 "Scalar Single-Precision Floating-Point Fused Multiply-Add (4-iterations)"                                              }
  {V4FNMADDPS                "Packed Single-Precision Floating-Point Fused Multiply-Add (4-iterations)"                                              }
  {V4FNMADDSS                "Scalar Single-Precision Floating-Point Fused Multiply-Add (4-iterations)"                                              }
  {VEXP2PD                   "Approximation to the Exponential 2^x of Packed Double-Precision Floating-Point Values with Less Than 2^-23 Relative Error"}
  {VEXP2PS                   "Approximation to the Exponential 2^x of Packed Single-Precision Floating-Point Values with Less Than 2^-23 Relative Error"}
  {VGATHERPF0DPD             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint"                        }
  {VGATHERPF0DPS             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint"                        }
  {VGATHERPF0QPD             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint"                        }
  {VGATHERPF0QPS             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint"                        }
  {VGATHERPF1DPD             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint"                        }
  {VGATHERPF1DPS             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint"                        }
  {VGATHERPF1QPD             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint"                        }
  {VGATHERPF1QPS             "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint"                        }
  {VP4DPWSSD                 "Dot Product of Signed Words with Dword Accumulation (4-iterations)"                                                    }
  {VP4DPWSSDS                "Dot Product of Signed Words with Dword Accumulation and Saturation (4-iterations)"                                     }
  {VRCP28PD                  "Approximation to the Reciprocal of Packed Double-Precision Floating-Point Values with Less Than 2^-28 Relative Error"  }
  {VRCP28PS                  "Approximation to the Reciprocal of Packed Single-Precision Floating-Point Values with Less Than 2^-28 Relative Error"  }
  {VRCP28SD                  "Approximation to the Reciprocal of Scalar Double-Precision Floating-Point Value with Less Than 2^-28 Relative Error"   }
  {VRCP28SS                  "Approximation to the Reciprocal of Scalar Single-Precision Floating-Point Value with Less Than 2^-28 Relative Error"   }
  {VRSQRT28PD                "Approximation to the Reciprocal Square Root of Packed Double-Precision Floating-Point Values with Less Than 2^-28 Relative Error"}
  {VRSQRT28PS                "Approximation to the Reciprocal Square Root of Packed Single-Precision Floating-Point Values with Less Than 2^-28 Relative Error"}
  {VRSQRT28SD                "Approximation to the Reciprocal Square Root of Scalar Double-Precision Floating-Point Value with Less Than 2^-28 Relative Error"}
  {VRSQRT28SS                "Approximation to the Reciprocal Square Root of Scalar Single-Precision Floating- Point Value with Less Than 2^-28 Relative Error"}
  {VSCATTERPF0DPD            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint with Intent to Write"   }
  {VSCATTERPF0DPS            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint with Intent to Write"   }
  {VSCATTERPF0QPD            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint with Intent to Write"   }
  {VSCATTERPF0QPS            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T0 Hint with Intent to Write"   }
  {VSCATTERPF1DPD            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint with Intent to Write"   }
  {VSCATTERPF1DPS            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint with Intent to Write"   }
  {VSCATTERPF1QPD            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint with Intent to Write"   }
  {VSCATTERPF1QPS            "Sparse Prefetch Packed SP/DP Data Values with Signed Dword, Signed Qword Indices Using T1 Hint with Intent to Write"   }
  
}

////////////////////////////////
//~ rjf: Developer Toggles

@table(name)
DF_DevToggleTable:
{
  {telemetry_capture}
  {simulate_lag}
  {draw_ui_text_pos}
  {draw_ui_focus_debug}
  {draw_ui_box_heatmap}
  {eval_compiler_tooltips}
  {eval_watch_key_tooltips}
  {cmd_context_tooltips}
  {scratch_mouse_draw}
  {updating_indicator}
}

////////////////////////////////
//~ rjf: Generators

//- rjf: enums

@table_gen_enum
DF_CfgSrc:
{
  @expand(DF_CfgSrcTable a) `DF_CfgSrc_$(a.name),`;
  `DF_CfgSrc_COUNT`;
}

@table_gen_enum
DF_EntityKind:
{
  @expand(DF_EntityKindTable a) `DF_EntityKind_$(a.name),`;
  `DF_EntityKind_COUNT`;
}

@table_gen_enum
DF_NameKind:
{
  @expand(DF_NameKindTable, a) `DF_NameKind_$(a.name),`;
  `DF_NameKind_COUNT`;
}

@table_gen_enum
DF_CoreCmdKind:
{
  @expand(DF_CoreCmdTable, a)
    `DF_CoreCmdKind_$(a.name),`,
  `DF_CoreCmdKind_COUNT`,
}

@table_gen_enum
DF_IconKind:
{
  @expand(DF_IconTable a)
    `DF_IconKind_$(a.name),`;
  `DF_IconKind_COUNT`;
}

@table_gen_enum
DF_CoreViewRuleKind:
{
  @expand(DF_CoreViewRuleTable a) `DF_CoreViewRuleKind_$(a.name),`;
  `DF_CoreViewRuleKind_COUNT`;
}

//- rjf: command params

@table_gen_enum
DF_CmdParamSlot:
{
  `DF_CmdParamSlot_Null,`;
  @expand(DF_CmdParamSlotTable a)
    `DF_CmdParamSlot_$(a.name),`;
  `DF_CmdParamSlot_COUNT`;
}

@table_gen
{
  `typedef struct DF_CmdParams DF_CmdParams;`;
  `struct DF_CmdParams`;
  `{`;
    `U64 slot_props[(DF_CmdParamSlot_COUNT + 63) / 64];`;
    @expand(DF_CmdParamSlotTable a)
      `$(a.c_type) $(a.name_lower);`;
    `};`;
}

@table_gen_enum
DF_CmdQueryRule:
{
  @expand(DF_CmdQueryRuleTable a)
    `DF_CmdQueryRule_$(a.name),`;
  `DF_CmdQueryRule_COUNT`;
}

@table_gen_data(type: String8, fallback: `{0}`)
df_g_cmd_query_rule_kind_arg_desc_table:
{
  @expand(DF_CmdQueryRuleTable a)
    `str8_lit_comp("$(a.args_desc)"),`;
}

//- rjf: entity kind tables

@table_gen_data(type: DF_IconKind, fallback: `DF_IconKind_Null`)
df_g_entity_kind_icon_kind_table:
{
  @expand(DF_EntityKindTable a) `DF_IconKind_$(a.icon_kind),`;
}

@table_gen_data(type: String8, fallback: `{0}`)
df_g_entity_kind_display_string_table:
{
  @expand(DF_EntityKindTable a) `str8_lit_comp("$(a.display_string)"),`;
}

@table_gen_data(type: String8, fallback: `{0}`)
df_g_entity_kind_name_label_table:
{
  @expand(DF_EntityKindTable a) `str8_lit_comp("$(a.name_label)"),`;
}

@table_gen_data(type:DF_EntityKindFlags, fallback: `0`)
df_g_entity_kind_flags_table:
{
  @expand(DF_EntityKindTable a) `($(a.lf_mut_user_cfg)*DF_EntityKindFlag_LeafMutationUserConfig | $(a.lf_mut_prof_cfg)*DF_EntityKindFlag_LeafMutationProfileConfig | $(a.lf_mut_halt)*DF_EntityKindFlag_LeafMutationSoftHalt | $(a.lf_mut_dbg)*DF_EntityKindFlag_LeafMutationDebugInfoMap | $(a.tr_mut_user_cfg)*DF_EntityKindFlag_TreeMutationUserConfig | $(a.tr_mut_prof_cfg)*DF_EntityKindFlag_TreeMutationProfileConfig | $(a.tr_mut_halt)*DF_EntityKindFlag_TreeMutationSoftHalt | $(a.tr_mut_dbg)*DF_EntityKindFlag_TreeMutationDebugInfoMap | $(a.name_is_code)*DF_EntityKindFlag_NameIsCode | $(a.user_lifetime)*DF_EntityKindFlag_UserDefinedLifetime),`;
}

@table_gen_data(type: DF_EntityOpFlags, fallback: `0`)
df_g_entity_kind_op_flags_table:
{
  @expand(DF_EntityKindTable a) `($(a.op_delete)*DF_EntityOpFlag_Delete) | ($(a.op_freeze)*DF_EntityOpFlag_Freeze) | ($(a.op_edit)*DF_EntityOpFlag_Edit) | ($(a.op_rename)*DF_EntityOpFlag_Rename) | ($(a.op_enable)*DF_EntityOpFlag_Enable) | ($(a.op_cond)*DF_EntityOpFlag_Condition) | ($(a.op_dup)*DF_EntityOpFlag_Duplicate),`;
}

//- rjf: config source tables

@table_gen_data(type: String8, fallback: DF_CoreCmdKind_Null)
df_g_cfg_src_string_table:
{
  @expand(DF_CfgSrcTable a) `str8_lit_comp("$(a.string)"),`;
}

@table_gen_data(type: DF_CoreCmdKind, fallback: DF_CoreCmdKind_Null)
df_g_cfg_src_load_cmd_kind_table:
{
  @expand(DF_CfgSrcTable a) `DF_CoreCmdKind_$(a.load_cmd),`;
}

@table_gen_data(type: DF_CoreCmdKind, fallback: DF_CoreCmdKind_Null)
df_g_cfg_src_write_cmd_kind_table:
{
  @expand(DF_CfgSrcTable a) `DF_CoreCmdKind_$(a.write_cmd),`;
}

@table_gen_data(type: DF_CoreCmdKind, fallback: DF_CoreCmdKind_Null)
df_g_cfg_src_apply_cmd_kind_table:
{
  @expand(DF_CfgSrcTable a) `DF_CoreCmdKind_$(a.apply_cmd),`;
}

//- rjf: core view rule function prototypes

@table_gen
{
  ``;
  @expand(DF_CoreViewRuleTable a)
    `$(a.er == "x" -> "DF_CORE_VIEW_RULE_EVAL_RESOLUTION_FUNCTION_DEF(" .. a.name_lower .. ");")`;
  @expand(DF_CoreViewRuleTable a)
    `$(a.vb == "x" -> "DF_CORE_VIEW_RULE_VIZ_BLOCK_PROD_FUNCTION_DEF(" .. a.name_lower .. ");")`;
}

//- rjf: core command kind tables

@table_gen_data(type: DF_CmdSpecInfo, fallback: `{0}`) @c_file
df_g_core_cmd_kind_spec_info_table:
{
  @expand(DF_CoreCmdTable, a)
    ```{ str8_lit_comp("$(a.string)"), str8_lit_comp("$(a.desc)"), str8_lit_comp("$(a.search_tags)"), str8_lit_comp("$(a.display_name)"), (DF_CmdSpecFlag_OmitFromLists*$(a.lister_omit)) | (DF_CmdSpecFlag_RunKeepsQuery*$(a.keep_query)) | (DF_CmdSpecFlag_QueryUsesOldInput*$(a.old_input)) | (DF_CmdSpecFlag_AppliesToView*$(a.apply_to_view)) | (DF_CmdSpecFlag_QueryIsCode*$(a.query_is_code)), {DF_CmdParamSlot_$(a.query_slot0), DF_CmdParamSlot_$(a.query_slot1), DF_CmdParamSlot_$(a.query_slot2)}, DF_CmdQueryRule_$(a.query_rule), DF_IconKind_$(a.canonical_icon), {$(a.query_info_0_u64), $(a.query_info_1_u64)}},```;
}

//- rjf: core view rule tables

@table_gen_data(type: DF_CoreViewRuleSpecInfo, fallback: `{0}`) @c_file
df_g_core_view_rule_spec_info_table:
{
  @expand(DF_CoreViewRuleTable a)
    ```{str8_lit_comp("$(a.string)"), str8_lit_comp("$(a.display_name)"), str8_lit_comp("$(a.description)"), (DF_CoreViewRuleSpecInfoFlag_Inherited*$(a.ih == "x"))|(DF_CoreViewRuleSpecInfoFlag_Expandable*$(a.ex == "x"))|(DF_CoreViewRuleSpecInfoFlag_EvalResolution*$(a.er == "x"))|(DF_CoreViewRuleSpecInfoFlag_VizBlockProd*$(a.vb == "x")), $(a.er == "x" -> "DF_CORE_VIEW_RULE_EVAL_RESOLUTION_FUNCTION_NAME("..a.name_lower..")") $(a.er != "x" -> 0), $(a.vb == "x" -> "DF_CORE_VIEW_RULE_VIZ_BLOCK_PROD_FUNCTION_NAME("..a.name_lower..")") $(a.vb != "x" -> 0), },```;
}

//- rjf: icon kinds

@table_gen_data(type: String8, fallback: `{0}`)
df_g_icon_kind_text_table:
{
  @expand(DF_IconTable a)
    `str8_lit_comp("$(a.text)"),`;
}

//- rjf: instruction metadata table

@table_gen
{
  ``;
  `struct{String8 mnemonic; String8 summary;} df_g_inst_table_x64[] =`;
  `{`;
    @expand(DF_InstTableX64 a) `{str8_lit_comp("$(a.name)"), str8_lit_comp("$(a.summary)")},`;
    `};`;
  ``;
}

//- rjf: developer toggles

@table_gen
{
  @expand(DF_DevToggleTable a) `global B32 DEV_$(a.name) = 0;`
}

@table_gen
{
  `struct {B32 *value_ptr; String8 name;} DEV_toggle_table[] =`;
  `{`;
    @expand(DF_DevToggleTable a) `{&DEV_$(a.name), str8_lit_comp("$(a.name)")},`
      `};`;
}