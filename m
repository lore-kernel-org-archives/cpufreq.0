From: Carl Thompson <cet@carlthompson.net>
Subject: Re: PST tables and Sonys Bios
Date: Mon, 21 Jul 2003 13:41:16 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1058820076.bb1af498dc47e@carlthompson.net>
References: <3F1650C3.1030903@searchbroker.de>
	<1058458508.bd23a8ad4d31b@carlthompson.net>
	<20030720165809.GA3019@zaphod.loewis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030720165809.GA3019@zaphod.loewis.de>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: johannes@v.loewis.de
Cc: Cpufreq@www.linux.org.uk

Quoting Johannes von Loewis <johannes@v.loewis.de>:

> ...

> My machine (Sony Vaio FX805, Linux 2.4.2[01]+acpi+swsusp+cpufreq) locks
> up occasionally. The BIOS PST is a "new one" with the voltage of 1.3V
> for all frequencies. I have not yet found out, what the reason(s) for
> the lock-ups is/are. Is it a problem with the standard kernel, a problem
> with one of the patches, or a problem with the softmodem driver
> hsflinmodem-5.03.whatever? Unfortunately, the BIOS PST is not sufficient
> to keep the machine from locking up;-)

My experience with the Sonys is that their fans alone are insufficient to
maintain an equilibrium under high load and they overheat _very_ quickly. 
On these machines you _must_ run a program to monitor CPU temperature and
scale/throttle the CPU down when it gets too hot or the system _will_ lock
up.  (My cpuspeed daemon does that as well as automatically adjust the the
speed depending on the demand on the processor.  After adding this to my
program I never experienced a lock up on my Sonys again.)

Do your lock ups coincide with heavy CPU use?  I ran exactly what you are
running (including the modem driver) and did not experience any lock ups
except for heat related ones.

The only other issue I had is that rarely ACPI would "freak out" when
battery power was extremely low (<2% IIRC).  And I only experienced that
problem when running multiple batteries.

> ...

> On my laptop the effect of scaling only the frequency is not sufficient
> to keep the CPU fan from occasionally turning on. I have the hope to get
> the machine quiet (for low-load situations as text editing or mp3
> playing) by scaling the voltage too.
>
> Therefore it seems desirable to me to have a means to override the BIOS
> PST in order to test upto what voltage the machine does not lock up much
> more often than with 1.3V.

In my experience on the Sonys (and most every other modern desktop
replacement laptop) even with full CPU scaling and ACPI C2 if you are doing
anything at all the fan will be on a good portion of the time even if the
CPU at at minimum speed and voltage.  Lower powered CPUs are better at
keeping the fan off; my Mobile Duron based Sony had the fan on much less
than my Mobile Athlon 4 based Sonys.  Playing MP3s is probably enough to
keep the fan running constantly on your Mobile Athlon XP machine.  Be happy
though-- the fans on the Sonys are quiter than most and _much_ quiter than
some (Compaq Presarios are horribly noisy).

Yes, I'm kind of a laptop junkie and over the last 3 years I've owned 7! 
Best: my current eMachines M5305 Widscreen.  Worst: KDS Valiant 6480iPTD-
actually fell apart from 6 months of normal use.

> Regards
>
> Johannes

Carl Thompson
