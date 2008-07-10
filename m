From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: powerpc/cell/cpufreq: add spu aware cpufreq governor
Date: Thu, 10 Jul 2008 23:16:13 +0200
Message-ID: <20080710211613.GA7868@isilmar.linta.de>
References: <200807071702.31240.arnd@arndb.de>
	<20080708152728.GF4997@codemonkey.org.uk>
	<20080710180553.GB13890@isilmar.linta.de>
	<200807102305.08752.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200807102305.08752.arnd@arndb.de>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk, linuxppc-dev@ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, cbe-oss-dev@ozlabs.org

On Thu, Jul 10, 2008 at 11:05:08PM +0200, Arnd Bergmann wrote:
> On Thursday 10 July 2008, Dominik Brodowski wrote:
> > Actually, "cpufreq-set -g spu_governor" should be enough. (BTW, do we really
> > want this name?)
> 
> Do you have a better suggestion for the name? I don't think there was a
> particularly strong reason to choose it over something else.

The issue I was pondering is whether to include "governor" in the name, for
we do not do this for the other governors. So here are my suggestions :)

	spu
	spuload
	spudemand

Best,
	Dominik
