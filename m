From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Mon, 22 Sep 2003 10:00:05 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <3F6EAC05.7090009@basmevissen.nl>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>	<3F6ACB0E.8050009@basmevissen.nl>
	<m2r82avdm6.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <m2r82avdm6.fsf@tnuctip.rychter.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Rychter <jan@rychter.com>
Cc: cpufreq@www.linux.org.uk

Jan Rychter wrote:

>>>>>>"Bas" == Bas Mevissen <ml@basmevissen.nl> writes:
> 
>  
> 11048mW 900MHz, C2 only
> 10560mW 600MHz, C2 only
> 
> 9306mW 900MHz, C3 allowed
> 9306mW 600MHz, C3 allowed
> 
> So, it seems that changing the frequency actually buys very little if
> you're stuck in C2 (about 0.5W) and exactly NOTHING if the machine is
> idle and can use C3.
> 

Do you measure this from the ACPI baatery output? I still suspect that 
your CPU is only running at low speed all the time. So please boot with 
AC adapter in and check /proc/cpuinfo and reboot without AC adapter and 
check again. In the meantime, get bogomips as it is worthless as a 
benchmark, but usefull to compare :-)

Bas.
