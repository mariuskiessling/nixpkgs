{ lib, rustPlatform, fetchFromGitHub }:
rustPlatform.buildRustPackage rec {
  pname = "cargo-graph";
  version = "0.2.0-d895af1";

  src = fetchFromGitHub {
    owner = "kbknapp";
    repo = "cargo-graph";
    # The last release (v0.2.0) is from 2015. Since then there have been some
    # bug fixes committed that would be good to have.
    rev = "d895af1b7840c7ae8eddaf4e990bfa594c22ba01";
    sha256 = "0myg26cssmbakz53dl61lswsbaqnjqlbc30c2571pq8f7gvz2qv5";
  };

  # Delete this on next update; see #79975 for details
  legacyCargoFetcher = true;

  cargoSha256 = "1k4byg77s1iqhry96pl57mbsvd32sbnvf60dlbd62pvan39rispg";

  meta = with lib; {
    description = "A cargo subcommand for creating GraphViz DOT files and dependency graphs";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ basvandijk ];
    platforms = platforms.all;
  };
}
