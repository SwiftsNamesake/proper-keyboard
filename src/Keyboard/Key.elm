
-- API -------------------------------------------------------------------------------------------------------------------------------------

module Keyboard.Key exposing (..)
{-| Readable key names

# Definition
@docs Key, Side

#
@docs fromCode

-}

-- Imports ---------------------------------------------------------------------------------------------------------------------------------

import Keyboard exposing (KeyCode)

-- Types -----------------------------------------------------------------------------------------------------------------------------------

{-| Represents a Key -}
-- TODO | - Complete the set
--        - Categories and groups (eg. NumPad Int | Letter Char)
--        - Distinguishing duplicates (LeftCtrl | RightCtrl | LeftAlt | RightAlt)
--        - Should there be an AltLeft/AltRight?
--        - How do we deal with AltrGr?
type Key =   A | B | C | D | E | F | G | H | I | J
           | K | L | M | N | O | P | Q | R | S | T
           | U | V | W | X | Y | Z
           | Left | Right | Up | Down
           | Shift (Maybe Side) | Ctrl (Maybe Side) | Alt
           | Tab | CapsLock | Esc
           | Enter | Backspace
           | Delete | PageUp | PageDown | End | Home
           | Insert | PrintScreen | PauseBreak
           | Windows | Command | ChromeSearch
           | Ambiguous (List Key) -- TODO: Pattern synonyms?
           | Unknown KeyCode  -- | Special _


{-| Type used to distinguish between multiple instances of the same key (such as Left Ctrl and Right Ctrl) -}
type Side = LeftHand | RightHand

-- Definitions -----------------------------------------------------------------------------------------------------------------------------

{-| Transform a KeyCode to a Key -}
-- TODO | - Use array instead?
fromCode : KeyCode -> Key
fromCode code = case code of
  --
  13 -> Enter

  -- Modifiers
  16 -> Shift Nothing
  17 -> Ctrl  Nothing
  18 -> Alt
  27 -> Esc

  --
  32-> Backspace

  --
  33 -> PageUp
  34 -> PageDown
  35 -> End
  36 -> Home

  -- Arrows
  37 -> Left
  38 -> Up
  39 -> Right
  40 -> Down

  --
  45 -> Insert
  46 -> Delete

  -- Letters
  65 -> A
  66 -> B
  67 -> C
  68 -> D
  69 -> E
  70 -> F
  71 -> G
  72 -> H
  73 -> I
  74 -> J
  75 -> K
  76 -> L
  77 -> M
  78 -> N
  79 -> O
  80 -> P
  81 -> Q
  82 -> R
  83 -> S
  84 -> T
  85 -> U
  86 -> V
  87 -> W
  88 -> X
  89 -> Y
  90 -> Z


  -- System
  91 -> Ambiguous [Windows, Command, ChromeSearch]

  -- Miscellaneous
  _ -> Unknown code

