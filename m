From: Colin Marquardt <colin@marquardt-home.de>
Subject: Re: 2.6.3-rc3: "powernow-k8: fid 0 invalid : 0x0"
Date: Thu, 26 Feb 2004 00:54:37 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <msgidspam.87r7wi3ebm.fsf@schnee.marquardt-home.de>
References: <msgidspam.87u11h1j4n.fsf@schnee.marquardt-home.de>
	<msgidspam.8765dwi1es.fsf@schnee.marquardt-home.de>
	<20040225085337.GG2869@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040225085337.GG2869@poupinou.org> (Bruno Ducrot's message of
	"Wed, 25 Feb 2004 09:53:37 +0100")
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Bruno Ducrot <ducrot@poupinou.org> writes:

> On Tue, Feb 24, 2004 at 10:59:55PM +0100, Colin Marquardt wrote:
>> Colin Marquardt <colin@marquardt-home.de> writes:
>> 
>> > powernow-k8: Found AMD64 processor supporting PowerNow (version 1.00.08a)
>> > powernow-k8: voltage stable in 100 usec, ramp voltage offset: 2, isochronous relief time: 3, maximum voltage step: 0
>> > powernow-k8: pll lock time: 0x2, maxfid 0xc (2000 MHz), maxvid 0x0
>> > powernow-k8: fid 0 invalid : 0x0
>> >
>> > Everything under /sys/devices/system/cpu/cpu0/ is empty.
>> Maybe ACPI is somehow disturbing it?
>
> In theory no, but you may consider ACPI especially on amd64
> architectures.

Thanks for your answer. I now built a kernel without ACPI support,
alas, nothing has changed. :/  I'll probably have to wait and try
again from time to time.

Cheers,
  Colin
