From: "Acid Zebra" <acid_zebra@hotmail.com>
Subject: Re: patch doesn't apply cleanly on 2.4.22
Date: Wed, 17 Dec 2003 22:10:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Law12-F12119DBqqtJ10004bf6e@hotmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I also can't apply the patch to 2.4.21 or 2.4.22...
and 2.6.0 is not an option for me; I lose the accelerated radeon mobility 
drivers from gatos.sf.net
So I either have nice CPU freq. tuning or nice speedy graphics...
I spent a whole weekend compiling kernels trying to get cpufreq working but 
no go :(


>From: AthlonRob <AthlonRob@axpr.net>
>To: cpufreq@www.linux.org.uk
>Subject: Re: patch doesn't apply cleanly on 2.4.22
>Date: Mon, 15 Dec 2003 11:35:58 -0800
>
>On Mon, 2003-12-15 at 10:37, paul wisehart wrote:
>
> > I have this patch: cpufreq-LINUX_2_4-20031212.tar.bz2
> > It won't patch cleanly onto a stock kernel.org 2.4.22 kernel-source.
> >
> > Before I get any further, can someone verify that this patch is for 
>2.4.22, or
> > should I be using 2.4.23(, or something else?)?
>
>Hey Paul-
>
>I'm about 95% certain that patch isn't for 2.4.22... it's going to
>either be for 2.4.23 or for 2.4.24-pre1.  My money is on 2.4.23.
>
>However... if you want CPU Frequency support, your best bet is going to
>be with the 2.6.0-test series of kernels.. IMHO, there's no good reason
>to stick with 2.4.x.  :-)
>
>I jumped to 2.6.0-test when I couldn't get CPUFreq working with a kernel
>that worked with the low latency patch.  I haven't looked back.
>
>Rob
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@www.linux.org.uk
>http://www.linux.org.uk/mailman/listinfo/cpufreq

_________________________________________________________________
MSN Search, for accurate results! http://search.msn.nl
