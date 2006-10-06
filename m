From: v+cpufreq@iki.fi
Subject: Re: Intel Core 2 T6600 (Conroe): Unknown p4-clockmod-capable
	CPU.Please send an e-mail to <linux@brodo.de>
Date: Fri, 6 Oct 2006 21:29:01 +0300
Message-ID: <20061006182900.GI23144@vianova.fi>
References: <EB12A50964762B4D8111D55B764A8454B2E105@scsmsx413.amr.corp.intel.com>
Reply-To: vherva@vianova.fi
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454B2E105@scsmsx413.amr.corp.intel.com>
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
To: cpufreq@lists.linux.org.uk

On Fri, Oct 06, 2006 at 07:32:44AM -0700, you [Pallipadi, Venkatesh] wrote:
> 
> >p4-clockmod-capable CPU.Please send an e-mail to <linux@brodo.de>
> >
> >You are probably getting a ton of these, but I did try to 
> >search google,
> >lkml, cpufreq-git and this mailing list and came up with 
> >nothing. So perhaps
> >you can point me to right direction, or ack that Core2 is not (yet)
> >supported?
> 
> P4-clockmod is not the right driver that you should be using here.. 
> If you are using 2.6.18, 

2.6.18-rc7. Sorry I forgot to mention.

> use both acpi-cpufreq and speedstep-centrino 
> and one of them work.
> This is what you need in your config
> CONFIG_X86_ACPI_CPUFREQ=y
> >   CONFIG_X86_SPEEDSTEP_CENTRINO=y
> >   CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
> CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y

Ok, that works. 

I actually had that in my config (CONFIG_X86_ACPI_CPUFREQ=m though) and the
module loaded, but I guess CONFIG_X86_P4_CLOCKMOD=y occluded it, since
CONFIG_X86_SPEEDSTEP_CENTRINO never took over. 

With CONFIG_X86_SPEEDSTEP_CENTRINO=n, I got the cpufreq working, and the box
is satisfyingly silent.

Thanks!
