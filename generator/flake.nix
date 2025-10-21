{
  description = "snmp builder";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = [
            pkgs.go
            pkgs.gnumake
            pkgs.nodejs_20
            pkgs.unzip
            pkgs.gcc14
            pkgs.net-snmp
          ];

          shellHook = ''
            echo "dev shell initialized"
          '';
        };
   };
}

