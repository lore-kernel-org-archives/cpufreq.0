From: Laurence Darby <ldarby@tuffmail.com>
Subject: Re: [PATCH] Re: cpufreq limits avilable frequencies to 800MHz on
	git kernel
Date: Fri, 18 Jul 2008 11:41:59 +0100
Message-ID: <20080718114159.b713360d.ldarby@tuffmail.com>
References: <200805231944.57320.arekm@maven.pl>
	<200805261815.40601.arekm@maven.pl>
	<200805261823.03140.arekm@maven.pl>
	<200807171548.04584.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200807171548.04584.trenn@suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@lists.linux.org.uk

Thomas Renninger wrote:

> Hi,
> 
> maybe I found something..., can someone review/test this.
> 


Hi, 

I tried this patch, but I don't think it made a difference, ie. _PPC
still got called before the rest.  Was this meant to fix my E8400 not
being recognised problem?



Thanks,
Laurence
