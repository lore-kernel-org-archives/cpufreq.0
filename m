From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 17:39:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402163902.GC5688@redhat.com>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040402162447.GP19001@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Andrew Morton <akpm@osdl.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, paul.devriendt@amd.com, Dominik Brodowski <linux@dominikbrodowski.de>

On Fri, Apr 02, 2004 at 06:24:47PM +0200, Bruno Ducrot wrote:

 > > http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.5-rc3/2.6.5-rc3-mm4/broken-out/bk-cpufreq.patch)
 > This is Dominik work.  Not mine.

My apologies.. I got my wires crossed.

 > > Would this driver be better off using that ?
 > 
 > At first, yes, it's needed anyway for the SMP case if I'm correct (there is
 > a flaw in how the v1.4 psb header have been changed wrt 1.2 that make that
 > impossible apparently).
 > 
 > But I can't say for sure which have to be favored: legacy or ACPI.
 > I don't have enough dump of ACPI tables and PSB/PST from machines shipped
 > with AMD64.

Ok. I think for the time being we'll roll with what Pavel has come up with.
We can always improve on it later, whichever way we decide to turn.
I'm about to disappear for a day or two. I'll look into integrating whats
outstanding on Sunday.  Pavel, if you have time between now and then
to do a diff of whats remaining between your tree and the driver I posted
this afternoon, that would make my life a little easier.

thanks,

		Dave
