From: Dave Jones <davej@redhat.com>
Subject: Re: Fix for longhaul deadlock ?
Date: Wed, 10 May 2006 19:40:39 -0400
Message-ID: <20060510234039.GD25646@redhat.com>
References: <446275B3.8010802@kelkoo.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <446275B3.8010802@kelkoo.net>
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
To: Xavier Bachelot <xb_ml@kelkoo.net>
Cc: cpufreq@lists.linux.org.uk

On Thu, May 11, 2006 at 01:22:27AM +0200, Xavier Bachelot wrote:
 > Hi,
 > 
 > VIA recently pretended to have fixed the long-known longhaul bug. I've 
 > diff'ed the longhaul.c file from kernel tree against their patched 
 > version. Result is attached. I didn't tested it and I don't pretend to 
 > understand what the patch does, but I though I just post it here in case 
 > someone more knowledgeable could kindly take a look.
 > For reference, here is the link to VIA site : 
 > http://www.viaarena.com/default.aspx?PageID=420&OSID=30&CatID=2800

*sigh*, I've now seen three separate 'fixes' for this driver, all different,
and all of them against some ancient version of the driver, which makes
creating diffs painful.

I'm in the process of moving house, but once I'm moved into my new place,
putting my via machines back in working order and getting this driver
ship-shape again is pretty high on my todo list.

		Dave

-- 
http://www.codemonkey.org.uk
