with (import <nixpkgs> {});
    let
      buildGradle = callPackage ./gradle-env.nix {};
    in
      buildGradle {
        pname = "gradle-simple";
    
        envSpec = ./gradle-env.json;
    
        src = ./.;
    
        gradleFlags = [];
    
        installPhase = ''
          ls -la /bin 
          mkdir -p $out
          cp -r /build  $out
        '';
      }
