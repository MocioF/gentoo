# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Monospaced font based on terminus and tamsyn"
HOMEPAGE="https://sourceforge.net/projects/termsyn/"
SRC_URI="https://downloads.sourceforge.net/${PN}/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~loong"
IUSE=""

FONT_SUFFIX="pcf psfu"
