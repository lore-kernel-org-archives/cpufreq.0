From: Bell <bell.jw@gmx.ch>
Subject: Re: Kernel Options for changing the settings of coservative govenor?
Date: Mon, 20 Feb 2006 11:04:28 +0100
Message-ID: <200602201104.28829.bell.jw@gmx.ch>
References: <88056F38E9E48644A0F562A38C64FB60074BD55E@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60074BD55E@scsmsx403.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Am Montag 20 Februar 2006 02:11 schrieb Pallipadi, Venkatesh:
> Just echo the value that you want into corresponding
> /sys/devices/system/..../cpufreq/conservative/.. file in your init
> script.

Thats what I am doing now yes. But the other way with kernel parameters would 
be a lot nicer... This just means it's no possible?

Thanks

Cyrill

>
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Cyrill Helg
> >Sent: Monday, February 13, 2006 1:26 AM
> >To: cpufreq@www.linux.org.uk
> >Subject: Kernel Options for changing the settings of
> >coservative govenor?
> >
> >Hi guys
> >
> >I'm using the conservative govenor. But I think that the
> >down_threshold is too
> >low for my use. So I'd like to change that to 55 or so. How
> >can I put that as
> >a kernel Option? Because that would be the most elegant way of
> >doing it.
> >
> >Thanks for any help!
> >
> >Cyrill
> >
> >_______________________________________________
> >Cpufreq mailing list
> >Cpufreq@lists.linux.org.uk
> >http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
