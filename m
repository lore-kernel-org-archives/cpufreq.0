From: Erich Boleyn <erich@uruk.org>
Subject: SMP CPUfreq support in Linux kernel mainline??
Date: Mon, 31 Jan 2005 11:49:09 -0800
Message-ID: <E1CvhY8-0007pa-AJ@parcelfarce.linux.theplanet.co.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk


Greetings all,

I am having a problem getting SMP CPUfreq support to function correctly
on recent Linux kernels, and wanted to know if what I am seeing is a
known bug or infrastructure problem.

Setup:  dual-Opteron 250 (and right revision, won't go into that yet ;-)
	with latest Powernow-K8 driver code hacked to pretend a BIOS is
	present enabling the P-states directly, but NOT putting in ACPI
	P-state tables and associated cruft.

Caveat: This requires a bit of special sauce as motherboard vendors in
	general haven't released BIOSes that support these configurations,
	but my understanding is that it's coming down the pipeline.

OK, on recent kernels (most of which I have tested are 2.6.8 or later
vintage Fedora Core 3 and SuSE 9.2 Pro kernels), I can get both processors
to perform frequency/voltage transitions reliably just fine.

BUT I am seeing a consistent problem on every kernel I've tried.  Programs
seem to mostly work, but...

It appears that the cpu TSC (timestamp counter) is getting out of sync
between the two processors, yet the Linux kernel isn't trying to correct
for this.  (on Opterons, the TSC runs at core frequency)

Symptoms that lead me to this conclusion:
  --  At first transition, you get messages in the log saying something
	like "too many lost ticks...(speculation on why...)".
  --  After the first transition, typing "date" on the console gives you
	one of two times, with them drifting apart if you leave the two
	processors in different frequency states.  If you switch the states
	back, then you get the dates moving ahead normally, but you get
	one or the other presumably depending on which processor executes
	the RDTSC instruction.
  --  "sleep" commands get lost (presumably due to the timing problem shown
	by the "date" commands above), so a script like:
		while [ true ] ; do
			sleep 1
			echo "hi"
		done
	...will, once the clocks are out of sync, sometimes pop out "hi"
	more than once/second, or very occasionally wait longer than one
	second.

So, *is* this a known problem?  Is there a solution already being planned,
etc?  My apologies if this is a semi-FAQ on your mailing lists, but I
can't seem to search the archives right now, our web proxy at work seems
to be busted today (grumble).

If not, then I'd like to talk with someone about fixing it...  I can look
at it and propose a fix myself, but don't want to step on anyone's toes
particularly if they might already have a better solution than I would
in mind.  :-)

Thanks much all.

--
    Erich Stefan Boleyn     <erich@uruk.org>     http://www.uruk.org/
"Reality is truly stranger than fiction; Probably why fiction is so popular"
