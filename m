From: Jan Rychter <jan@rychter.com>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Sat, 20 Sep 2003 23:50:57 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m2r82avdm6.fsf@tnuctip.rychter.com>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
	<3F6ACB0E.8050009@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F6ACB0E.8050009@basmevissen.nl> (Bas Mevissen's message of
	"Fri, 19 Sep 2003 11:23:26 +0200")
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

>>>>> "Bas" == Bas Mevissen <ml@basmevissen.nl> writes:
 Bas> Jan Rychter wrote:
 >> and much to my surprise, even though /proc/cpufreq echoes my
 >> changes, I can see no resulting changes in power consumption as
 >> reported by ACPI battery proc entry.

 Bas> Can you verify the CPU speed with the bogomips userland utility? 
 Bas> Or something else that gives a CPU-only performance impression.

Ok, I haven't actually verified the CPU speed as reported by bogomips,
but I've done some power consumption measurements. This is on a Toshiba
S7/290LNKW, which has a 900MHz Pentium-M, the machine had its HDD spun
down, no wi-fi or other networking, display set to max brightness and
was otherwise idle.

11048mW 900MHz, C2 only
10560mW 600MHz, C2 only

9306mW 900MHz, C3 allowed
9306mW 600MHz, C3 allowed

So, it seems that changing the frequency actually buys very little if
you're stuck in C2 (about 0.5W) and exactly NOTHING if the machine is
idle and can use C3.

FYI, a good way to get the machine not to use C3 is to plug in an USB
device. Or just use usb-uhci, which immediately disallows C3 states.

An unscientific comparison with my old Sharp Mebius Pentium3M-based,
750MHz, shows that the old machine has actually better idle performance,
with 8750mW at max display, no HDD, and speedstepped down to 350MHz.

Another test has shown that on the Pentium-IIIM machine it DOES make a
difference if it's speedstepped high or low. The numbers for lowest
brightness, no HDD, idle machine:
  speedstep 350MHz
  5757mW
  speedstep 750MHz
  5905mW

5757mW is BTW the absolute minimum this machine can do with the display
on :-)

The above results are rather surprising for me. Either something is
wrong, or Intel has managed to make a CPU which effectively doesn't
really need frequency scaling, because it is so good at idle
handling. But then I thought that voltage also changes along with the
frequency?

--J.
