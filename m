From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8: support acpi
Date: Tue, 6 Apr 2004 14:07:30 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406130730.GA5133@redhat.com>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163902.GC5688@redhat.com>
	<20040402170926.GA289@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040402170926.GA289@elf.ucw.cz>
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
To: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Morton <akpm@osdl.org>, Bruno Ducrot <ducrot@poupinou.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, paul.devriendt@amd.com, Dominik Brodowski <linux@dominikbrodowski.de>

On Fri, Apr 02, 2004 at 07:09:26PM +0200, Pavel Machek wrote:

 > > I'm about to disappear for a day or two. I'll look into integrating whats
 > > outstanding on Sunday.  Pavel, if you have time between now and then
 > > to do a diff of whats remaining between your tree and the driver I posted
 > > this afternoon, that would make my life a little easier.
 > 
 > Here it is: (I was not able to locate your changes, so it is possible
 > I'm reverting some of those; but few extra inlines should not hurt
 > that bad :-).

Ok, the merge-from-hell is complete (split up into 23 csets).
The only diffs between your tree and mine should now be trivial
whitespace changes, and some small bits that looked bogus.

You can grab what I have in my tree pending pushing to Linus at
http://www.codemonkey.org.uk/projects/cpufreq/pending.diff

bk users can clone bk://linux-dj.bkbits.net/cpufreq
And you'll also find this pulled into -mm each time Andrew makes a tree.

One thing outstanding that probably does need fixing. Andi Kleen
mentioned on IRC yesterday ..

<f> found a funny bug in the powernow-k8 acpi changes
<f> when  acpi is disabled processor.ko won't load, but the new module needs symbols from that
<f> i added a hack to keep it loaded anyways

Be nice to get that fixed, and merged before these changes get pushed to mainline.

		Dave
