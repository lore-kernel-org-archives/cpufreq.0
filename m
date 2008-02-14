From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [PATCH] Use menuconfig for CONFIG_CPU_FREQ
Date: Thu, 14 Feb 2008 02:47:56 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0802140246440.1822@scrub.home>
References: <200802132330.23817.alessandro.guido@gmail.com>
	<20080213225058.GA20358@flint.arm.linux.org.uk>
	<200802140000.52936.alessandro.guido@gmail.com>
	<20080213231512.GB20358@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080213231512.GB20358@flint.arm.linux.org.uk>
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
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-arch@vger.kernel.org, Alessandro Guido <alessandro.guido@gmail.com>, cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

Hi,

On Wed, 13 Feb 2008, Russell King wrote:

> > No because they all depend on CPU_FREQ and as far as I understand Kconfig
> > automagically puts them under the same menu.
> 
> Hmm, that's not documented behaviour.  If we're starting to rely on that
> maybe it should be documented as being the expected behaviour?

It is. :)
Look for "Menu structure" in kconfig-language.txt.

bye, Roman
