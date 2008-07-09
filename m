From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: powerpc/cell/cpufreq: add spu aware cpufreq governor
Date: Wed, 09 Jul 2008 13:41:38 +1000
Message-ID: <1215574898.8970.308.camel@pasglop>
References: <200807071702.31240.arnd@arndb.de>
	<20080707213105.GD4997@codemonkey.org.uk>
	<200807080843.43674.arnd@arndb.de>
	<20080708152728.GF4997@codemonkey.org.uk>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, cpufreq@lists.linux.org.uk, linuxppc-dev@ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, cbe-oss-dev@ozlabs.org

On Tue, 2008-07-08 at 11:27 -0400, Dave Jones wrote:
> On Tue, Jul 08, 2008 at 08:43:43AM +0200, Arnd Bergmann wrote:
>  > On Monday 07 July 2008, Dave Jones wrote:
>  > > One question I do have though, is how userspace scripts are supposed
>  > > to know they're to echo cbe_spu_governor into the relevant parts of
>  > > sysfs.  I've not used anything with a cell. Do they expose the SPUs
>  > > as regular CPUs, or do they show up in a different part of the tree?
>  > 
>  > An SPU is very different from a CPU from the user perspective.
>  > SPUs show up in /sys/devices/system/spus, and if a user wants to access
>  > them, the "spufs" file system needs to be mounted in the system, by
>  > convention on /spu. 
> 
> Ok, that should be fairly simple to write scripts for.
> All sounds good to me.

Can I add your Acked-by ?

Cheers,
Ben.
