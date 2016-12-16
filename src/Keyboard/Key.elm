
-- API -------------------------------------------------------------------------------------------------------------------------------------

module Keyboard.Key exposing (..)
{-| Readable key names

# Definition
@docs Key, Side

#
@docs fromCode, code

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
--        - How do we deal with Numeric?
type Key =   A | B | C | D | E | F | G | H | I | J
           | K | L | M | N | O | P | Q | R | S | T
           | U | V | W | X | Y | Z
           | Left | Right | Up | Down
           | Shift (Maybe Side) | Ctrl (Maybe Side) | Alt
           | Tab | CapsLock
           | Enter | Backspace
           | Delete | PageUp | PageDown | End | Home
           | Zero | One | Two | Three | Four | Five | Six | Seven | Eight | Nine
           | Insert | PrintScreen | PauseBreak
           | Windows | Command | ChromeSearch
           | NumLock
           | Ambiguous (List Key) -- TODO: Pattern synonyms?
           | Unknown KeyCode -- | Special _


{-| Type used to distinguish between multiple instances of the same key (such as Left Ctrl and Right Ctrl) -}
type Side = LeftHand | RightHand

-- Definitions -----------------------------------------------------------------------------------------------------------------------------

{-| Transform a KeyCode to a Key -}
-- TODO | - Use array instead?
fromCode : KeyCode -> Key
fromCode code = case code of

  --
  9 -> Tab

  --
  13 -> Enter

  -- Modifiers
  16 -> Shift Nothing
  17 -> Ctrl  Nothing
  18 -> Alt
  19 -> PauseBreak
  20 -> CapsLock

  --
  32 -> Backspace

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
  44 -> PrintScreen
  45 -> Insert
  46 -> Delete

  -- Digits
  48 -> Zero
  49 -> One
  50 -> Two
  51 -> Three
  52 -> Four
  53 -> Five
  54 -> Six
  55 -> Seven
  56 -> Eight
  57 -> Nine

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


{-| Attempts to transform a key into a keycode -}
-- TODO | - Use array instead?
code : Key -> Maybe KeyCode
code key = case key of

  --
  Tab -> Just 9

  --
  Enter -> Just 13

  -- Modifiers
  Shift _ -> Just 16
  Ctrl  _ -> Just 17
  Alt     -> Just 18
  PauseBreak -> Just 19
  CapsLock   -> Just 20

  --
  Backspace -> Just 32

  --
  PageUp   -> Just 33
  PageDown -> Just 34
  End      -> Just 35
  Home     -> Just 36

  -- Arrows
  Left  -> Just 37
  Up    -> Just 38
  Right -> Just 39
  Down  -> Just 40

  --
  PrintScreen -> Just 44 -- The OS will probably intercept this one before we have a chance to respond
  Insert -> Just 45
  Delete -> Just 46

  -- Digits
  Zero  -> Just 48
  One   -> Just 49
  Two   -> Just 50
  Three -> Just 51
  Four  -> Just 52
  Five  -> Just 53
  Six   -> Just 54
  Seven -> Just 55
  Eight -> Just 56
  Nine  -> Just 57

  -- Letters
  A -> Just 65
  B -> Just 66
  C -> Just 67
  D -> Just 68
  E -> Just 69
  F -> Just 70
  G -> Just 71
  H -> Just 72
  I -> Just 73
  J -> Just 74
  K -> Just 75
  L -> Just 76
  M -> Just 77
  N -> Just 78
  O -> Just 79
  P -> Just 80
  Q -> Just 81
  R -> Just 82
  S -> Just 83
  T -> Just 84
  U -> Just 85
  V -> Just 86
  W -> Just 87
  X -> Just 88
  Y -> Just 89
  Z -> Just 90

  -- System
  Ambiguous choices -> if List.all (flip List.member [Windows, Command, ChromeSearch]) choices then Just 91 else Nothing
  Windows -> Just 91
  Command -> Just 91
  ChromeSearch -> Just 91

  --
  NumLock -> Just 144

  -- Miscellaneous
  Unknown _ -> Nothing

-- Tests -----------------------------------------------------------------------------------------------------------------------------------
