From: Jan Rychter <jan@rychter.com>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
 P-state driver
Date: Sun, 02 Nov 2003 12:28:44 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m23cd6bjlv.fsf@tnuctip.rychter.com>
References: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
	(Venkatesh
	Pallipadi's message of "Wed, 22 Oct 2003 11:21:22 -0700")
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Mukesh Rajan <megabyte1024@hotmail.com>, linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk

>>>>> "Venkatesh" == Venkatesh Pallipadi writes:
 Venkatesh> I do not have any performance numbers taken from actual
 Venkatesh> probes. We have seen in our testing that the the frequency
 Venkatesh> does change based on the cpu usage.  For example, on a
 Venkatesh> Centrino system,
 Venkatesh> - frequency will be lowest when system is idle
 Venkatesh> - frequency will be somewhere in the mid-range when you run
 Venkatesh>   single app like mp3/mpeg player
 Venkatesh> - frequency will be maximum when you run multiple apps
 Venkatesh> And with the kind of power savings that comes with these
 Venkatesh> frequency changes, this behaviour results in longer battery
 Venkatesh> life. However, as yet I do not have any numbers to quantify
 Venkatesh> this gain, mainly because I do not have any setup where I
 Venkatesh> can measure actual power.
[...]

Interesting. I have done some measurements on a Toshiba S7/290LNKW,
which has a 900MHz Pentium-M. The results have been posted to this list
a while ago -- the most surprising one being that the Pentium-M in that
machine seemed to always consume the same amount of power when idle,
independent of operating frequency. The frequency only made a difference
when the CPU was actually doing something (or when I made it not use the
C3 state by loading usb-uhci).

Another interesting result was that in general, my P-III based laptop
has lower power consumption than the Centrino-based one. Runs against
the Centrino advertising campaign.

My measurements were done using the ACPI battery status and overall
seemed to make a lot of sense, except for this little detail. Can
anybody from Intel confirm that this is the way it is supposed to be?

--J.
