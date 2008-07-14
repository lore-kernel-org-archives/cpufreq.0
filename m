From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [ANNOUNCE] cpufrequtils-004 released
Date: Mon, 14 Jul 2008 15:28:35 +0200
Message-ID: <20080714132834.GB6949@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Hi!

cpufrequtils-004 is released and available at

http://www.kernel.org/pub/linux/utils/kernel/cpufreq/

See also:
http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html

A newly added feature for cpufrequtils is the statisitics output to
cpufreq-info, and the corresponding libcpufreq update.

The diffstat and list of changes follows below. Many thanks to all who
contributed for this release.

	Dominik

----
 .gitignore         |    4 =

 AUTHORS            |    4 =

 Makefile           |    3 =

 lib/cpufreq.c      |   27 +++++
 lib/cpufreq.h      |   19 +++
 lib/interfaces.h   |    4 =

 lib/sysfs.c        |  282 ++++++++++++++++++++++++++++++++++--------------=
-----
 man/cpufreq-info.1 |   22 ++--
 man/cpufreq-set.1  |   21 +--
 po/cs.po           |   97 ++++++++++--------
 po/de.po           |   82 ++++++++-------
 po/fr.po           |   85 +++++++++------
 po/it.po           |   90 +++++++++-------
 po/pt.po           |   91 +++++++++--------
 utils/info.c       |   53 +++++++++
 15 files changed, 562 insertions(+), 322 deletions(-)
----
Claudio Eduardo (1):
      i18n: update Brazilian Portuguese translation

Dominik Brodowski (4):
      man: avoid low-level troff hackery
      i18n: update German translation
      i18n update
      cpufrequtils-004

Goran Koruga (3):
      Fixed memory leak in sysfs_get_policy().
      Removed dependency on libsysfs.
      Added support for cpufreq statistics.

Joseph Xu (1):
      sysfs: fix sysfs_set_policy()

Karel Voln=FD (1):
      i18n: update Czech translation

Mattia Dongili (1):
      i18n: update Italian translation
