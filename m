From: Thomas Breitner <mail@tombreit.de>
Subject: Re: little system-hang when switching frequencies
Date: Wed, 09 Jun 2004 23:26:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086816407.2756.10.camel@localhost>
References: <1086717641.4311.30.camel@localhost>
	<20040609155946.GB9482@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040609155946.GB9482@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk



Am Mi, den 09.06.2004 schrieb Dominik Brodowski um 17:59: 
> Hi,
> 
> On Tue, Jun 08, 2004 at 08:00:41PM +0200, Thomas Breitner wrote:
> > using speedstep_smi, i get little "cpu-hangs" when frequency is
> > switching from a high (here: 1 ghz) to a low (here: 730 mhz) value. for
> > a trickle of a second the systems stops responding (mouse hangs etc),
> > which i noticed especially when listening to music.
> 
> This doesn't really surprise me. speedstep-smi is "1st generation
> speedstep", which was neither intended for dynamic frequency scaling nor to
> be fast. It works by telling the BIOS to change the frequency, which will
> stop all other activity on the system, then set the new frequency, and then
> return to the OS. Obviously, this is much slower than a write to a processor
> MSR, such as the new "Centrino" Pentium-M processors do.
> 
> > this does not occur when switching from low to high frequency.
> 
> In some cases, the BIOS returns an error. Then, empirical testing has shown,
> delaying for some time and re-trying helps: in the first re-try, the system
> is stopped for 50 ms, in the second re-try, it's 100 ms, and the third 150
> ms, fourth 200 ms, fifth 250 ms -- so it may take up to 750 ms plus the time
> the BIOS takes until the system becomes responsive again. To determine
> whether this is the case on your system, uncomment the line
> //#define SPEEDSTEP_DEBUG
> in arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
> use your system as usual, and check whether there are messages like
> cpufreq: retry 1, previous result 1
> in the kernel log

yes, you're right, enabling debuging of speedstep-smi gave me:

---
theoschlepp:/home/theo# tail -f /var/log/kern.log
Jun  9 21:31:40 localhost kernel: cpufreq: retry 4, previous result 0
Jun  9 21:31:40 localhost kernel: cpufreq: retry 5, previous result 0
Jun  9 21:31:40 localhost kernel: cpufreq: change to 731 MHz succeeded
after 6 tries with result 0
Jun  9 21:31:55 localhost kernel: cpufreq: change to 997 MHz succeeded
after 1 tries with result 0
Jun  9 21:32:01 localhost kernel: cpufreq: retry 1, previous result 0
Jun  9 21:32:01 localhost kernel: cpufreq: retry 2, previous result 0
Jun  9 21:32:01 localhost kernel: cpufreq: retry 3, previous result 0
Jun  9 21:32:01 localhost kernel: cpufreq: retry 4, previous result 0
Jun  9 21:32:01 localhost kernel: cpufreq: retry 5, previous result 0
Jun  9 21:32:01 localhost kernel: cpufreq: change to 731 MHz succeeded
after 6 tries with result 0
Jun  9 21:34:01 localhost kernel: cpufreq: change to 997 MHz succeeded
after 1 tries with result 0
Jun  9 21:34:17 localhost kernel: cpufreq: retry 1, previous result 0
Jun  9 21:34:17 localhost kernel: cpufreq: retry 2, previous result 0
Jun  9 21:34:17 localhost kernel: cpufreq: retry 3, previous result 0
Jun  9 21:34:17 localhost kernel: cpufreq: retry 4, previous result 0
Jun  9 21:34:17 localhost kernel: cpufreq: retry 5, previous result 0
Jun  9 21:34:17 localhost kernel: cpufreq: change to 731 MHz succeeded
after 6 tries with result 0
---

i don't understand the meaning of result "0", but it seems that the
system needs *only* one - the first - try to switch from low to high
frequency - but it needs always 6 retries to switch back.
ok, this part is *fixed*, i should buy a new laptop...

> > sorry, i'm not sure if this belongs to the kernel-related 
> > cpu-frequency-scaling-drivers...
> 
> It does -- though cpufreqd might consider not to load on speedstep-smi
> driven systems.
> 
> > especially, because the speedstep_ich-module *should* be right for my 
> > chipset:
> >  >theo@theoschlepp:~$ lspci
> >  >0000:00:00.0 Host bridge: Intel Corp. 82815 815 Chipset 
> >  >Host Bridge and Memory Controller Hub (rev 04)
> 
> Currently, everything which is revision 4 or lower is not handled by
> speedstep-ich because:
> 
>                 /* speedstep.c causes lockups on Dell Inspirons 8000 and
>                  * 8100 which use a pretty old revision of the 82815
>                  * host brige. Abort on these systems.
>                  */
> 
> If you want to try it out on your system, change the line
>                 if (rev < 5) {
> in arch/i386/kernel/cpu/cpufreq/speedstep-ich.c to
> 		if (rev < 4) {
> re-compile, and test -- but be advised that this might cause lockups!
> 
> If it works on your system, then I'll submit a patch which will check for
> Dell Inspiron 8x00 and only disallow speedstep-ich for them, not for the
> notebook you're using.
> 

the same here: i followed your advise, but seemingly trust too much in
my laptop (well, it is in fact an inspiron 8100...):
changed (rev < 5) in (rev < 4) and ended up immediatly after loading
speedstep-ich in a lockup (if thats the technical word for a completly
non-respondent system).
but: switching frequencies under the preinstalled win xp works "in both
directions". how is this possible when it's the bios which is causing
the "little system hang"?

thank you very much,
i will forward this story to the associated debian-cpufreqd-bug,
thomas



> 	Dominik
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq

-- 
______________________________________
thomas breitner

www.tombreit.de   |   mail@tombreit.de
