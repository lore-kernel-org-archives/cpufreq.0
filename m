From: Dave Jones <davej@redhat.com>
Subject: Re: Bug#271396: Kernel help typo
Date: Tue, 14 Sep 2004 12:57:03 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040914115703.GA13788@redhat.com>
References: <20040912233809.GA4739@nermel> <20040913211011.GB1978@stro.at>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040913211011.GB1978@stro.at>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maks attems <janitor@sternwelten.at>
Cc: davej@codemonkey.org.uk, Gavin Sandie <beach@vicecity.co.uk>, 271396@bugs.debian.org, cpufreq@www.linux.org.uk

On Mon, Sep 13, 2004 at 11:10:11PM +0200, maks attems wrote:
 > On Mon, 13 Sep 2004, Gavin Sandie wrote:
 > 
 > > drivers/cpufreq/Kconfig
 > > 
 > > The help for CONFIG_CPU_FREQ_GOV_POWERSAVE contains a typo.
 > > It starts with 'Theis', I think this should be 'This'.
 > >
 > > I have found a further two typos in the
 > > drivers/cpufreq/Kconfig file.
 > > 
 > > The help section for CPU_FREQ_DEFAULT_GOV_USERSPACE and
 > > CPU_FREQ_GOV_USERSPACE both have contain 'programm' when I
 > > think this should read 'programme'.
 > 
 > belows patch corrects found issues.
 > 
 > 
 > --- linux-2.6.9-rc2-orig/drivers/cpufreq/Kconfig	2004-09-13 22:51:22.000000000 +0200
 > +++ linux-2.6.9-rc2/drivers/cpufreq/Kconfig	2004-09-13 23:04:56.000000000 +0200
 > @@ -33,7 +33,7 @@ config CPU_FREQ_DEFAULT_GOV_USERSPACE
 >  	help
 >  	  Use the CPUFreq governor 'userspace' as default. This allows
 >  	  you to set the CPU frequency manually or when an userspace 
 > -	  programm shall be able to set the CPU dynamically without having
 > +	  programme shall be able to set the CPU dynamically without having
 >  	  to enable the userspace governor manually.
 >  
 >  endchoice
 > @@ -51,7 +51,7 @@ config CPU_FREQ_GOV_POWERSAVE
 >         tristate "'powersave' governor"
 >         depends on CPU_FREQ
 >         help
 > -	  Theis cpufreq governors set the frequency statically to the
 > +	  This cpufreq governors set the frequency statically to the
 >  	  lowest available CPU frequency.
 >  
 >  	  If in doubt, say Y.
 > @@ -61,7 +61,7 @@ config CPU_FREQ_GOV_USERSPACE
 >         depends on CPU_FREQ 
 >         help
 >  	  Enable this cpufreq governor when you either want to set the
 > -	  CPU frequency manually or when an userspace programm shall
 > +	  CPU frequency manually or when an userspace programme shall
 >            be able to set the CPU dynamically, like on LART 
 >  	  <http://www.lart.tudelft.nl/>
 >  

Already fixed up in cpufreq-bk. Matthew Wilcox forwarded me the
debian bugmail yesterday.

		Dave
