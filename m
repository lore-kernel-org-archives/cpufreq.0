From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8: support acpi
Date: Tue, 6 Apr 2004 16:47:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406154750.GE6930@redhat.com>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163902.GC5688@redhat.com>
	<20040402170926.GA289@elf.ucw.cz>
	<20040406130730.GA5133@redhat.com>
	<20040406145502.GA7307@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040406145502.GA7307@dominikbrodowski.de>
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
To: Pavel Machek <pavel@ucw.cz>, Andrew Morton <akpm@osdl.org>, Bruno Ducrot <ducrot@poupinou.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, paul.devriendt@amd.com

On Tue, Apr 06, 2004 at 04:55:02PM +0200, Dominik Brodowski wrote:

 > Just found a small bug which would leave the preempt count negative(!) in
 > special cases. Patch is attached.

good catch. applied.

 > > You can grab what I have in my tree pending pushing to Linus at
 > > http://www.codemonkey.org.uk/projects/cpufreq/pending.diff
 > 
 > Will http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/
 > be a permanent institution, or is it just available for the moment?

I set it up this morning to do a snapshot each night along with the
other trees one level up from there.  It'll continually keep one weeks
worth of patches.

 > > <f> found a funny bug in the powernow-k8 acpi changes
 > > <f> when  acpi is disabled processor.ko won't load, but the new module needs symbols from that
 > > <f> i added a hack to keep it loaded anyways
 > > 
 > > Be nice to get that fixed, and merged before these changes get pushed to mainline.
 > 
 > Hm. Keeping processor.ko loaded seems to be an ugly hack to me. However, I
 > can't see a way (yet) how powernow-k8.ko can rely on processor.ko's objects
 > but not depend on it if these are not neeeded (psb case).

True, it's a sledgehammer to crack a walnut, but I'm not sure messing with
weak symbols would be any cleaner, and other than that or moving bits out
to a seperate module (double ugh), I don't really have any ideas.

		Dave
