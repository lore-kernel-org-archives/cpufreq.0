From: Colin Marquardt <colin@marquardt-home.de>
Subject: Re: 2.6.3-rc3: "powernow-k8: fid 0 invalid : 0x0"
Date: Tue, 24 Feb 2004 22:59:55 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <msgidspam.8765dwi1es.fsf@schnee.marquardt-home.de>
References: <msgidspam.87u11h1j4n.fsf@schnee.marquardt-home.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <msgidspam.87u11h1j4n.fsf@schnee.marquardt-home.de> (Colin
	Marquardt's message of "Tue, 24 Feb 2004 00:16:56 +0100")
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
To: cpufreq@www.linux.org.uk

Colin Marquardt <colin@marquardt-home.de> writes:

> powernow-k8: Found AMD64 processor supporting PowerNow (version 1.00.08a)
> powernow-k8: voltage stable in 100 usec, ramp voltage offset: 2, isochronous relief time: 3, maximum voltage step: 0
> powernow-k8: pll lock time: 0x2, maxfid 0xc (2000 MHz), maxvid 0x0
> powernow-k8: fid 0 invalid : 0x0
>
> Everything under /sys/devices/system/cpu/cpu0/ is empty.

Same with 2.6.3 proper :/

I also get

apm: BIOS version 1.2 Flags 0x07 (Driver version 1.16ac)
apm: overridden by ACPI.

Maybe ACPI is somehow disturbing it?

Cheers,
  Colin
