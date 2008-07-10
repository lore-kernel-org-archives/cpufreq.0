From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: powerpc/cell/cpufreq: add spu aware cpufreq governor
Date: Thu, 10 Jul 2008 20:05:53 +0200
Message-ID: <20080710180553.GB13890@isilmar.linta.de>
References: <200807071702.31240.arnd@arndb.de>
	<20080707213105.GD4997@codemonkey.org.uk>
	<200807080843.43674.arnd@arndb.de>
	<20080708152728.GF4997@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20080708152728.GF4997@codemonkey.org.uk>
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, cpufreq@lists.linux.org.uk, cbe-oss-dev@ozlabs.org

On Tue, Jul 08, 2008 at 11:27:28AM -0400, Dave Jones wrote:
> On Tue, Jul 08, 2008 at 08:43:43AM +0200, Arnd Bergmann wrote:
>  > On Monday 07 July 2008, Dave Jones wrote:
>  > > One question I do have though, is how userspace scripts are supposed
>  > > to know they're to echo cbe_spu_governor into the relevant parts of
>  > > sysfs. =A0I've not used anything with a cell. Do they expose the SPUs
>  > > as regular CPUs, or do they show up in a different part of the tree?
>  > =

>  > An SPU is very different from a CPU from the user perspective.
>  > SPUs show up in /sys/devices/system/spus, and if a user wants to access
>  > them, the "spufs" file system needs to be mounted in the system, by
>  > convention on /spu. =

> =

> Ok, that should be fairly simple to write scripts for.

Actually, "cpufreq-set -g spu_governor" should be enough. (BTW, do we really
want this name?)

Best,
	Dominik
