From: Mattia Dongili <malattia@linux.it>
Subject: Re: linux-2.6.19-rc6-g1b9bb3c1 build #128 failed
Date: Fri, 17 Nov 2006 20:58:54 +0100
Message-ID: <20061117195854.GE12979@inferi.kami.home>
References: <200611171353.36458.toralf.foerster@gmx.de>
	<20061117193759.GD12979@inferi.kami.home>
	<20061117194432.GH30591@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061117194432.GH30591@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Toralf F???rster <toralf.foerster@gmx.de>, cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

On Fri, Nov 17, 2006 at 02:44:32PM -0500, Dave Jones wrote:
> On Fri, Nov 17, 2006 at 08:37:59PM +0100, Mattia Dongili wrote:
> 
>  > 
>  > diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
>  > index 2cc71b6..491779a 100644
>  > --- a/drivers/cpufreq/Kconfig
>  > +++ b/drivers/cpufreq/Kconfig
>  > @@ -107,6 +107,7 @@ config CPU_FREQ_GOV_USERSPACE
>  >  
>  >  config CPU_FREQ_GOV_ONDEMAND
>  >  	tristate "'ondemand' cpufreq policy governor"
>  > +	select CPU_FREQ_TABLE
>  >  	help
>  >  	  'ondemand' - This driver adds a dynamic cpufreq policy governor.
>  >  	  The governor does a periodic polling and 
> 
> I suspect conservative needs a similar change?

I grep-ed for cpufreq_frequency_table_target and only ondemand
showed-up. I suppose conservative won't need it until it's re-synced
with ondemand. 
The change that introduced this dependency is 05ca0350:
[CPUFREQ][2/2] ondemand: updated add powersave_bias tunable

-- 
mattia
:wq!
