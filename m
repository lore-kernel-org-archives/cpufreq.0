From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Problem with acpi-cpufreq on 8-core machines
Date: Thu, 12 Jul 2007 14:02:27 +0800
Message-ID: <1184220147.2720.1.camel@laptopd505.fenrus.org>
References: <c583a31b0707111737s237dcde8m211ac2c192668300@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <c583a31b0707111737s237dcde8m211ac2c192668300@mail.gmail.com>
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
To: Lei Yang <leiyang@google.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, 2007-07-11 at 17:37 -0700, Lei Yang wrote:
> Hi list,
> 
> I found that on my 8 cpu server, the acpi-cpufreq module doesn't work
> properly. The CPU is Intel(R) Xeon(R) CPU (E5345  @ 2.33GHz). First of all,
> except for /sys/devices/system/cpu/cpu0/cpufreq, for all other 7 cpus the
> cpufreq dir is just a link to cpu0/cpufreq. When I use the userspace
> governor and scale down the frequency by editing the scaling_setspeed file
> in cpu0/cpufreq, only cpu0 and cpu4 have their frequencies changed. I
> verified this with a simple loop test that would report different timing
> number at different frequencies. Even though the /proc/cpuinfo shows that
> all cpus are running at a lower frequency. Has anyone had the same problem
> before? Is there a fix for this?

note that this can be a bios issue; have you run the linux-ready
firmware developer kit? (see http://www.linuxfirmwarekit.org)
the bios is supposed to tell linux which cores share frequency etc etc
(and in theory the setting is supposed to be per core, and the hardware
then takes the maximum of these values on whatever granularity the
hardware has to group things)

if your bios doesn't do this correctly then yes you get funky results...


-- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com
Test the interaction between Linux and your BIOS via http://www.linuxfirmwarekit.org
