From: Dave Jones <davej@redhat.com>
Subject: Re: linux-2.6.19-rc6-g1b9bb3c1 build #128 failed
Date: Fri, 17 Nov 2006 14:44:32 -0500
Message-ID: <20061117194432.GH30591@redhat.com>
References: <200611171353.36458.toralf.foerster@gmx.de>
	<20061117193759.GD12979@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061117193759.GD12979@inferi.kami.home>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toralf F???rster <toralf.foerster@gmx.de>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

On Fri, Nov 17, 2006 at 08:37:59PM +0100, Mattia Dongili wrote:

 > 
 > diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
 > index 2cc71b6..491779a 100644
 > --- a/drivers/cpufreq/Kconfig
 > +++ b/drivers/cpufreq/Kconfig
 > @@ -107,6 +107,7 @@ config CPU_FREQ_GOV_USERSPACE
 >  
 >  config CPU_FREQ_GOV_ONDEMAND
 >  	tristate "'ondemand' cpufreq policy governor"
 > +	select CPU_FREQ_TABLE
 >  	help
 >  	  'ondemand' - This driver adds a dynamic cpufreq policy governor.
 >  	  The governor does a periodic polling and 

I suspect conservative needs a similar change?

		Dave

-- 
http://www.codemonkey.org.uk
