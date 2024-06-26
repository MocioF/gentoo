# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools edo

DESCRIPTION="Test your typing speed, and get your fingers CPS"
HOMEPAGE="https://typespeed.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="nls"

RDEPEND="
	acct-group/gamestat
	sys-libs/ncurses:=
	nls? ( virtual/libintl )
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
"

PATCHES=(
	"${FILESDIR}"/${P}-musl.patch
	"${FILESDIR}"/${P}-use-extern.patch
	"${FILESDIR}"/${P}-link-tinfo.patch
	"${FILESDIR}"/${P}-lto.patch
	"${FILESDIR}"/${P}-gamestat.patch
)

src_prepare() {
	default

	sed -i -e '/^CC =/d' \
		src/Makefile.am \
		testsuite/Makefile.am || die
	# bug #417265
	rm -r m4 || die
	eautoreconf
}

src_configure() {
	econf $(use_enable nls)
}

src_test() {
	default

	cd testsuite || die
	local test
	for test in t_level t_loadwords t_typorankkaus ; do
		edo ./${test}
	done
}

src_install() {
	default
	dodoc doc/README
}
