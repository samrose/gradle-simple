{callPackage,pkgs, ...}:
    let
      buildGradle = callPackage ./gradle-env.nix {};
    in
      buildGradle {
        pname = "gradle-simple";
    
        envSpec = ./gradle-env.json;
    
        src = ../..;
    
        gradleFlags = [ "assemble" ];
    
        installPhase = ''
          ls -la $GRADLE_USER_HOME 
          mkdir -p $out/bin
          cp -r gradle  $out/bin
        '';
      }
