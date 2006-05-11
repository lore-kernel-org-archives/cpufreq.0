From: Xavier Bachelot <xb_ml@kelkoo.net>
Subject: Re: Fix for longhaul deadlock ?
Date: Thu, 11 May 2006 10:49:00 +0200
Message-ID: <4462FA7C.9060904@kelkoo.net>
References: <446275B3.8010802@kelkoo.net> <20060510234039.GD25646@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060510234039.GD25646@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Dave Jones wrote:
> On Thu, May 11, 2006 at 01:22:27AM +0200, Xavier Bachelot wrote:
>  > Hi,
>  > 
>  > VIA recently pretended to have fixed the long-known longhaul bug. I've 
>  > diff'ed the longhaul.c file from kernel tree against their patched 
>  > version. Result is attached. I didn't tested it and I don't pretend to 
>  > understand what the patch does, but I though I just post it here in case 
>  > someone more knowledgeable could kindly take a look.
>  > For reference, here is the link to VIA site : 
>  > http://www.viaarena.com/default.aspx?PageID=420&OSID=30&CatID=2800
> 
> *sigh*, I've now seen three separate 'fixes' for this driver, all different,
> and all of them against some ancient version of the driver, which makes
> creating diffs painful.
> 
> I'm in the process of moving house, but once I'm moved into my new place,
> putting my via machines back in working order and getting this driver
> ship-shape again is pretty high on my todo list.
> 
> 		Dave
> 
Nice to know it's on your todo list :-) Count me as a beta tester, 
especially if you plan to push a kernel with longhaul fixes to rawhide. 
A follow-up on this thread or a note sent to cpufreq ml would be much 
appreciated, as I'm not tracking rawhide closely though.

Cheers,

Xavier
