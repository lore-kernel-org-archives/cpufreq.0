From: Marcus Grando <marcus@corp.grupos.com.br>
Subject: Re: p4_clockmod or speedstep_ich | acpi?
Date: Tue, 27 Jan 2004 00:41:44 -0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4015CFE8.1030002@corp.grupos.com.br>
References: <4011EC55.5030304@sbh.eng.br> <20040124060321.GP25416@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040124060321.GP25416@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Hi,

But why my kernel show this messages, if celeron not support speedstep-ich?

cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
cpufreq: modules offers voltage scaling in addition of frequency 
scaling. You
cpufreq: should use either one instead of p4-clockmod, if possible.

Regards

Ducrot Bruno wrote:
> On Sat, Jan 24, 2004 at 01:53:57AM -0200, Marcus Grando wrote:
> 
>>Hi,
>>
>>I have a toshiba satellite a10 127, and use p4 clockmod in cpufreq. I 
>>look this kernel messages:
>>
>>cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
>>cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
>>cpufreq: modules offers voltage scaling in addition of frequency 
>>scaling. You
>>cpufreq: should use either one instead of p4-clockmod, if possible.
>>
> 
> 
> ...
> 
>>CPU:     After generic identify, caps: bfebf9ff 00000000 00000000 00000000
>>CPU:     After vendor identify, caps: bfebf9ff 00000000 00000000 00000000
>>CPU: Trace cache: 12K uops, L1 D cache: 8K
>>CPU: L2 cache: 256K
>>CPU:     After all inits, caps: bfebf9ff 00000000 00000000 00000080
>>CPU: Intel Mobile Intel(R) Celeron(R) CPU 2.00GHz stepping 09
> 
>                              ^^^^^^^
> 		  A celeron is not speedstep capable.
> 
> Cheers,
> 

-- 
Marcus Grando
Grupos Internet S/A
marcus(at)corp.grupos.com.br
