{
  description = "Dependencies of the R-Course";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: 
  let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    env = pkgs.rstudioWrapper.override {
      packages = with pkgs.rPackages; [ 
        cowplot # anotations for ggplot
        curl
        gapminder # data
        gganimate # make animated plots
        ggmosaic # mosaic plots
        ggplot2 # graphic library
        ggrepel
        ggthemes
        gifski # default renderer for gganimate
        gridExtra # arrange multiple plot objects
        haven # load SPSS und STATA data
        janitor # clean names
        lubridate # date fromat
        magrittr # extended pipes
        margins
        needs # wrapper for packag installation (not needed in this case)
        psych # describe()  
        purrr # tidyverse map() family
        ranger
        readr 
        readxl # import excel data
        sf # simple features geo data
        stringr # manipulate strings
        summarytools
        tidyverse
        transformr # helper for gganimate
      ]; 
    };

   in {
     devShell."${system}" = pkgs.mkShell {
        buildInputs =  [ env ];
        shellHook = ''
          echo 'You entered RStudio development shell' 
        '';
     };     
   };
}
