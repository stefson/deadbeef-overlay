# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

GITHUB_COMMIT="353870a66adae81d138a34ea5ebb8ab876b05b40"

DESCRIPTION="DeaDBeeF musical spectrum plugin"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_musical_spectrum"
SRC_URI="https://github.com/cboxdoerfer/ddb_musical_spectrum/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

RDEPEND+=" sci-libs/fftw:3.0="

DEPEND="${RDEPEND}"

S="${WORKDIR}/ddb_musical_spectrum-${GITHUB_COMMIT}"

PATCHES=( "${FILESDIR}/${PN}-cflags.patch" )

src_compile() {
	use gtk2 && emake gtk2
	use gtk3 && emake gtk3
}
