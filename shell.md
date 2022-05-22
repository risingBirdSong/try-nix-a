# { nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

# let

#   inherit (nixpkgs) pkgs;

#   f = { mkDerivation, aeson, async, base, binary, bytestring
#       , containers, deriving-aeson, foldl, hspec, hspec-expectations, lib
#       , primitive, QuickCheck, safe-exceptions, text
#       , unordered-containers, vector
#       }:
#       mkDerivation {
#         pname = "aaa";
#         version = "0.0.0.0";
#         src = ./.;
#         isLibrary = true;
#         isExecutable = true;
#         libraryHaskellDepends = [
#           aeson async base binary bytestring containers deriving-aeson foldl
#           primitive safe-exceptions text unordered-containers vector
#         ];
#         executableHaskellDepends = [
#           aeson async base binary bytestring containers deriving-aeson foldl
#           primitive safe-exceptions text unordered-containers vector
#         ];
#         testHaskellDepends = [
#           aeson async base binary bytestring containers deriving-aeson foldl  
#           hspec hspec-expectations primitive QuickCheck safe-exceptions text
#           unordered-containers vector
#         ];
#         license = "unknown";
#         hydraPlatforms = lib.platforms.none;
#       };

#   haskellPackages = if compiler == "default"
#                        then pkgs.haskellPackages
#                        else pkgs.haskell.packages.${compiler};

#   variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

#   drv = variant (haskellPackages.callPackage f {});

# in

#   if pkgs.lib.inNixShell then drv.env else drv
